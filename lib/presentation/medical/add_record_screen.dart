// lib/presentation/medical/add_record_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/medical/entities/medical_record.dart';
import '../../domain/medical/repositories/medical_repository.dart';
import '../auth/providers/auth_providers.dart';
import 'providers/medical_providers.dart';
import 'widgets/attachment_picker.dart';
import 'widgets/record_type_selector.dart';

class AddRecordScreen extends ConsumerStatefulWidget {
  final String petId;
  final String petName;

  const AddRecordScreen({
    super.key,
    required this.petId,
    required this.petName,
  });

  @override
  ConsumerState<AddRecordScreen> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends ConsumerState<AddRecordScreen> {
  final _formKey = GlobalKey<FormState>();
  MedicalRecordType _selectedType = MedicalRecordType.generalNote;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _medicationController = TextEditingController();
  final _dosageController = TextEditingController();
  double? _weightKg;
  DateTime? _nextDueDate;
  String? _attachmentPath;
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _medicationController.dispose();
    _dosageController.dispose();
    super.dispose();
  }

  // Mostrar/ocultar campos según el tipo de registro
  bool get _showWeight => _selectedType == MedicalRecordType.weightCheck;

  bool get _showMedication =>
      _selectedType == MedicalRecordType.prescription ||
      _selectedType == MedicalRecordType.deworming;

  bool get _showNextDue =>
      _selectedType == MedicalRecordType.vaccine ||
      _selectedType == MedicalRecordType.deworming;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_showWeight && _weightKg == null) {
      _showError('Ingresa el peso de la mascota');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = ref.read(authStateProvider).value;
      if (user == null) throw Exception('Usuario no autenticado');

      await ref
          .read(addMedicalRecordUseCaseProvider)
          .execute(
            AddMedicalRecordParams(
              petId: widget.petId,
              vetId: user.id,
              vetName: user.displayName,
              recordType: _selectedType,
              title: _titleController.text.trim(),
              description: _descController.text.trim(),
              weightKg: _showWeight ? _weightKg : null,
              medicationName: _showMedication
                  ? _medicationController.text.trim()
                  : null,
              dosage: _showMedication ? _dosageController.text.trim() : null,
              nextDueDate: _showNextDue ? _nextDueDate : null,
              attachmentLocalPath: _attachmentPath,
            ),
          );

      if (!mounted) return;
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Registro clínico guardado'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      _showError('Error al guardar: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nuevo registro — ${widget.petName}',
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // BANNER: recordatorio append-only para el veterinario
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                border: Border.all(color: Colors.amber.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 16,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Los registros clínicos son inmutables. '
                      'Verifica los datos antes de guardar.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tipo de registro
            Text(
              'Tipo de registro',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            RecordTypeSelector(
              selected: _selectedType,
              onSelected: (type) => setState(() {
                _selectedType = type;
                // Resetear campos que no aplican al nuevo tipo
                _weightKg = null;
                _nextDueDate = null;
              }),
            ),
            const SizedBox(height: 20),

            // Título
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                hintText: 'ej: Vacuna antirrábica anual',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'El título es requerido'
                  : null,
            ),
            const SizedBox(height: 16),

            // Descripción
            TextFormField(
              controller: _descController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Descripción / Observaciones',
                hintText: 'Detalla hallazgos, dosis, reacciones…',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'La descripción es requerida'
                  : null,
            ),
            const SizedBox(height: 16),

            // Campo peso (solo para weightCheck)
            if (_showWeight) ...[
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight_outlined),
                  suffixText: 'kg',
                ),
                onChanged: (v) =>
                    _weightKg = double.tryParse(v.replaceAll(',', '.')),
                validator: (v) {
                  if (!_showWeight) return null;
                  final val = double.tryParse(v?.replaceAll(',', '.') ?? '');
                  if (val == null || val <= 0) return 'Ingresa un peso válido';
                  return null;
                },
              ),
              const SizedBox(height: 16),
            ],

            // Campos medicación (prescription / deworming)
            if (_showMedication) ...[
              TextFormField(
                controller: _medicationController,
                decoration: const InputDecoration(
                  labelText: 'Medicamento / Producto',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.medication_outlined),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _dosageController,
                decoration: const InputDecoration(
                  labelText: 'Dosis y frecuencia',
                  hintText: 'ej: 5mg cada 12h por 7 días',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.schedule_outlined),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Próxima dosis (vaccine / deworming)
            if (_showNextDue) ...[
              Text(
                'Próxima aplicación',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                icon: const Icon(Icons.event_outlined),
                label: Text(
                  _nextDueDate == null
                      ? 'Seleccionar fecha (opcional)'
                      : _formatDate(_nextDueDate!),
                ),
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 365)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
                  );
                  if (picked != null) {
                    setState(() => _nextDueDate = picked);
                  }
                },
              ),
              const SizedBox(height: 16),
            ],

            // Adjunto de foto
            Text(
              'Adjuntar foto (opcional)',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            AttachmentPicker(
              currentPath: _attachmentPath,
              onPicked: (path) => setState(() => _attachmentPath = path),
              onRemoved: () => setState(() => _attachmentPath = null),
            ),
            const SizedBox(height: 32),

            // Botón guardar
            FilledButton.icon(
              onPressed: _isLoading ? null : _submit,
              icon: _isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.save_outlined),
              label: const Text('Guardar registro clínico'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    const months = [
      '',
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sep',
      'oct',
      'nov',
      'dic',
    ];
    return '${dt.day} ${months[dt.month]} ${dt.year}';
  }
}
