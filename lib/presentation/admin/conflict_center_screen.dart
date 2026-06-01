import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/medical/entities/medical_record.dart';
import '../medical/providers/medical_providers.dart';

class ConflictCenterScreen extends ConsumerWidget {
  const ConflictCenterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escucha los conflictos detectados por el SyncWorker (List<MedicalRecord>)
    final conflictsAsync = ref.watch(medicalConflictsProvider); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Centro de Resolución de Conflictos Clínicos'),
        backgroundColor: Colors.red.shade50,
      ),
      body: conflictsAsync.when(
        data: (conflicts) {
          if (conflicts.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 72, color: Colors.green),
                  SizedBox(height: 16),
                  Text(
                    '✅ No hay conflictos de sincronización pendientes.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: conflicts.length,
            itemBuilder: (context, index) {
              final record = conflicts[index];
              return _ConflictResolverCard(record: record);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error al cargar conflictos: $err')),
      ),
    );
  }
}

class _ConflictResolverCard extends ConsumerStatefulWidget {
  final MedicalRecord record;

  const _ConflictResolverCard({required this.record});

  @override
  ConsumerState<_ConflictResolverCard> createState() => _ConflictResolverCardState();
}

class _ConflictResolverCardState extends ConsumerState<_ConflictResolverCard> {
  final _notesController = TextEditingController();
  bool _isLoading = false;
  late Future<DocumentSnapshot<Map<String, dynamic>>> _remoteDocFuture;

  @override
  void initState() {
    super.initState();
    // Obtener los datos remotos directamente de Firestore para comparar
    _remoteDocFuture = FirebaseFirestore.instance
        .collection('pets')
        .doc(widget.record.petId)
        .collection('medical_records')
        .doc(widget.record.id)
        .get();
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submitResolution() async {
    final notes = _notesController.text.trim();
    if (notes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, escribe o selecciona una nota de resolución antes de guardar.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref.read(resolveConflictUseCaseProvider).execute(
            recordId: widget.record.id,
            adminNotes: notes,
          );

      // Refrescar la lista de conflictos
      ref.invalidate(medicalConflictsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Conflicto resuelto exitosamente y programado para sincronización.'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Error al resolver conflicto: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red.shade300, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.red.shade700, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Conflicto en Registro Médico (Mascota ID: ${widget.record.petId})',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: _remoteDocFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                Map<String, dynamic>? remoteData;
                if (snapshot.hasData && snapshot.data!.exists) {
                  remoteData = snapshot.data!.data();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Versión Local (Drift)
                        Expanded(
                          child: _DataColumn(
                            title: 'Versión Local (Dispositivo)',
                            color: Colors.blue.shade50,
                            recordTitle: widget.record.title,
                            description: widget.record.description,
                            type: widget.record.recordType.displayName,
                            weight: widget.record.weightKg != null ? '${widget.record.weightKg} kg' : 'No especificado',
                            date: widget.record.createdAt.toLocal().toString().split('.')[0],
                            onSelect: () {
                              _notesController.text = 
                                  'Se mantuvo la versión local del dispositivo. Notas: ${widget.record.description}';
                            },
                            buttonText: 'Usar versión local',
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Versión Remota (Firestore)
                        Expanded(
                          child: remoteData != null
                              ? _DataColumn(
                                  title: 'Versión Remota (Nube)',
                                  color: Colors.green.shade50,
                                  recordTitle: remoteData['title'] ?? 'Sin título',
                                  description: remoteData['description'] ?? 'Sin descripción',
                                  type: remoteData['recordType'] ?? 'General',
                                  weight: remoteData['weightKg'] != null
                                      ? '${remoteData['weightKg']} kg'
                                      : 'No especificado',
                                  date: remoteData['createdAt'] != null
                                      ? (remoteData['createdAt'] as Timestamp).toDate().toLocal().toString().split('.')[0]
                                      : 'Desconocida',
                                  onSelect: () {
                                    _notesController.text =
                                        'Se prefirió la versión remota de la nube. Notas remotas: ${remoteData?['description'] ?? ''}';
                                  },
                                  buttonText: 'Usar versión remota',
                                )
                              : Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Esta nota clínica no existe en la nube (creada solo de manera local offline).',
                                      style: TextStyle(color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 12),
                    const Text(
                      'Notas de resolución:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _notesController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'Explica cómo se resolvió este conflicto...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _isLoading ? null : _submitResolution,
                        icon: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Icon(Icons.check_circle),
                        label: const Text('Resolver y Guardar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DataColumn extends StatelessWidget {
  final String title;
  final Color color;
  final String recordTitle;
  final String description;
  final String type;
  final String weight;
  final String date;
  final VoidCallback onSelect;
  final String buttonText;

  const _DataColumn({
    required this.title,
    required this.color,
    required this.recordTitle,
    required this.description,
    required this.type,
    required this.weight,
    required this.date,
    required this.onSelect,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const Divider(),
          Text('Título: $recordTitle', style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text('Tipo: $type'),
          const SizedBox(height: 4),
          Text('Descripción: $description'),
          const SizedBox(height: 4),
          Text('Peso: $weight'),
          const SizedBox(height: 4),
          Text('Fecha: $date'),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onSelect,
            icon: const Icon(Icons.copy, size: 16),
            label: Text(buttonText),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
          )
        ],
      ),
    );
  }
}
