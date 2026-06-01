import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/auth/entities/app_user.dart';
import 'providers/admin_crm_provider.dart';

class WebDashboardScreen extends ConsumerStatefulWidget {
  const WebDashboardScreen({super.key});

  @override
  ConsumerState<WebDashboardScreen> createState() => _WebDashboardScreenState();
}

class _WebDashboardScreenState extends ConsumerState<WebDashboardScreen> {
  int _selectedIndex = 0; // 0 = Home, 1 = CRM, 2 = Agenda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // SIDEBAR (Panel Izquierdo)
          Container(
            width: 250,
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                const SizedBox(height: 24),
                const Text('⚕️ VitalPaw Admin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text('Panel de Inicio'),
                  selected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('Directorio CRM'),
                  selected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: const Text('Agenda Clínica'),
                  selected: _selectedIndex == 2,
                  onTap: () => setState(() => _selectedIndex = 2),
                ),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.red),
                  title: const Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    // Volver al inicio
                    context.go('/login');
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          // ÁREA CENTRAL
          Expanded(
            child: _selectedIndex == 0 
                ? const _AdminHomeTab() 
                : _selectedIndex == 1 
                    ? const _AdminCrmTab() 
                    : const _AdminAgendaTab(),
          ),
        ],
      ),
    );
  }
}

class _AdminHomeTab extends StatelessWidget {
  const _AdminHomeTab();
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Panel de Inicio en Construcción. Usa el CRM o la Agenda en el menú izquierdo.'),
    );
  }
}

class _AdminCrmTab extends ConsumerWidget {
  const _AdminCrmTab();

  void _showUserModal(BuildContext context, WidgetRef ref, {AppUser? user}) {
    showDialog(
      context: context,
      builder: (context) => _UserCrmDialog(user: user),
    );
  }

  void _disableUser(BuildContext context, WidgetRef ref, AppUser user) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Desactivar Usuario'),
        content: Text('¿Seguro que deseas desactivar a ${user.displayName}? No podrá iniciar sesión.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Desactivar', style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await ref.read(crmActionsProvider).disableUser(user.id);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuario desactivado.')));
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(crmUsersProvider);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Directorio CRM', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () => _showUserModal(context, ref),
                icon: const Icon(Icons.add),
                label: const Text('Añadir Usuario'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
              child: usersAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
                data: (users) {
                  return ListView(
                    children: [
                      DataTable(
                        columns: const [
                          DataColumn(label: Text('Nombre / Correo')),
                          DataColumn(label: Text('Rol')),
                          DataColumn(label: Text('Estado')),
                          DataColumn(label: Text('Registro')),
                          DataColumn(label: Text('Acciones')),
                        ],
                        rows: users.map((u) {
                          return DataRow(cells: [
                            DataCell(Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(u.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text(u.email, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              ],
                            )),
                            DataCell(Text(u.role.name.toUpperCase())),
                            DataCell(
                              Chip(
                                label: Text(u.isActive ? 'Activo' : 'Inactivo', style: const TextStyle(fontSize: 12, color: Colors.white)),
                                backgroundColor: u.isActive ? Colors.teal : Colors.redAccent,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            DataCell(Text('${u.createdAt.day}/${u.createdAt.month}/${u.createdAt.year}')),
                            DataCell(Row(
                              children: [
                                  IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () => _showUserModal(context, ref, user: u)),
                                  if (u.isActive)
                                    IconButton(icon: const Icon(Icons.block, color: Colors.red), onPressed: () => _disableUser(context, ref, u)),
                              ],
                            )),
                          ]);
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserCrmDialog extends ConsumerStatefulWidget {
  final AppUser? user;
  const _UserCrmDialog({this.user});

  @override
  ConsumerState<_UserCrmDialog> createState() => _UserCrmDialogState();
}

class _UserCrmDialogState extends ConsumerState<_UserCrmDialog> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  UserRole _role = UserRole.client;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameCtrl.text = widget.user!.displayName;
      _emailCtrl.text = widget.user!.email;
      _role = widget.user!.role;
    }
  }

  void _save() async {
    setState(() => _isLoading = true);
    try {
      if (widget.user != null) {
        // Edit
        await ref.read(crmActionsProvider).updateUser(
          uid: widget.user!.id,
          displayName: _nameCtrl.text,
          password: _passCtrl.text,
          role: _role.name,
        );
      } else {
        // Create
        await ref.read(crmActionsProvider).createUser(
          email: _emailCtrl.text,
          password: _passCtrl.text,
          displayName: _nameCtrl.text,
          role: _role.name,
        );
      }
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.user != null;
    return AlertDialog(
      title: Text(isEdit ? 'Editar Usuario' : 'Añadir Usuario'),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Nombre Completo')),
            const SizedBox(height: 16),
            TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Correo Electrónico'), enabled: !isEdit),
            const SizedBox(height: 16),
            TextField(controller: _passCtrl, decoration: InputDecoration(labelText: isEdit ? 'Nueva Contraseña (Opcional)' : 'Contraseña *')),
            const SizedBox(height: 16),
            DropdownButtonFormField<UserRole>(
              value: _role,
              decoration: const InputDecoration(labelText: 'Rol'),
              items: UserRole.values.map((r) => DropdownMenuItem(value: r, child: Text(r.name.toUpperCase()))).toList(),
              onChanged: (v) {
                if (v != null) setState(() => _role = v);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: _isLoading ? null : _save,
          child: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Guardar'),
        ),
      ],
    );
  }
}

class _AdminAgendaTab extends StatefulWidget {
  const _AdminAgendaTab();

  @override
  State<_AdminAgendaTab> createState() => _AdminAgendaTabState();
}

class _AdminAgendaTabState extends State<_AdminAgendaTab> {
  DateTime _selectedDate = DateTime.now();
  List<int> _activeDays = [1, 2, 3, 4, 5]; // Lun-Vie por defecto
  bool _isLoadingConfig = true;

  final List<String> _weekdaysNames = [
    "Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"
  ];

  @override
  void initState() {
    super.initState();
    _loadWeekdaysConfig();
  }

  void _loadWeekdaysConfig() {
    FirebaseFirestore.instance
        .collection('calendar_config')
        .doc('weekdays')
        .snapshots()
        .listen((doc) {
      if (doc.exists) {
        final days = List<int>.from(doc.data()?['days'] ?? []);
        setState(() {
          _activeDays = days;
          _isLoadingConfig = false;
        });
      } else {
        setState(() {
          _isLoadingConfig = false;
        });
      }
    });
  }

  Future<void> _saveWeekdaysConfig() async {
    try {
      await FirebaseFirestore.instance
          .collection('calendar_config')
          .doc('weekdays')
          .set({
        'days': _activeDays,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Días hábiles actualizados con éxito.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar configuración: $e')),
        );
      }
    }
  }

  void _showCancelDialog(String appId) {
    final reasonCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancelar Turno'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Por favor, escribe de forma obligatoria el motivo de cancelación:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: reasonCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ej. Falta de insumos, cita reprogramada, etc.',
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              final reason = reasonCtrl.text.trim();
              if (reason.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('El motivo de cancelación es obligatorio.')),
                );
                return;
              }

              final scaffoldMessenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(ctx);

              try {
                await FirebaseFirestore.instance
                    .collection('appointments')
                    .doc(appId)
                    .update({
                  'status': 'cancelled',
                  'cancellationReason': reason,
                  'updatedAt': FieldValue.serverTimestamp(),
                });
                if (mounted) {
                  navigator.pop();
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(content: Text('Cita cancelada correctamente.')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text('Error al cancelar: $e')),
                  );
                }
              }
            },
            child: const Text('Confirmar Cancelación', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _confirmComplete(String appId, String clientId, String clientName, String serviceName, double price) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Completar Cita'),
        content: Text(
          '¿Deseas marcar la cita de "$serviceName" como completada?\nEsto enviará una solicitud de cobro por \$${price.toStringAsFixed(2)} al panel de facturación/finanzas.'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () async {
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(ctx);

              try {
                final orderId = 'SERV-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
                await FirebaseFirestore.instance.collection('orders').doc(orderId).set({
                  'id': orderId,
                  'clientId': clientId,
                  'clientName': clientName,
                  'items': [{
                    'productId': appId,
                    'productName': 'Servicio: $serviceName',
                    'price': price,
                    'quantity': 1,
                  }],
                  'totalAmount': price,
                  'status': 'pending',
                  'createdAt': FieldValue.serverTimestamp(),
                  'type': 'service_order',
                });

                await FirebaseFirestore.instance
                    .collection('appointments')
                    .doc(appId)
                    .update({
                  'status': 'completed',
                  'updatedAt': FieldValue.serverTimestamp(),
                });

                if (mounted) {
                  navigator.pop();
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(content: Text('Cita completada y enviada a Finanzas con éxito.')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text('Error al completar cita: $e')),
                  );
                }
              }
            },
            child: const Text('Marcar Atendido', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingConfig) {
      return const Center(child: CircularProgressIndicator());
    }

    final dayOfWeek = _selectedDate.weekday % 7; // 0 = Domingo, 1 = Lunes, etc.
    final isWorkingDay = _activeDays.contains(dayOfWeek);

    final startOfDay = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day, 0, 0, 0);
    final endOfDay = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day, 23, 59, 59);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Agenda Clínica & Calendario', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            
            // 1. CONFIGURACIÓN DÍAS HÁBILES
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '⚙️ Configuración de Días Hábiles',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Configura los días en que la veterinaria atiende al público en turnos clínicos.',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [1, 2, 3, 4, 5, 6, 0].map((d) {
                        final isChecked = _activeDays.contains(d);
                        return FilterChip(
                          label: Text(_weekdaysNames[d]),
                          selected: isChecked,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _activeDays.add(d);
                              } else {
                                _activeDays.remove(d);
                              }
                            });
                            _saveWeekdaysConfig();
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 2. AGENDA DIARIA
            Row(
              children: [
                Expanded(
                  child: Text(
                    '📅 Agenda Diaria: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} (${_weekdaysNames[dayOfWeek]})',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) {
                      setState(() {
                        _selectedDate = picked;
                      });
                    }
                  },
                  icon: const Icon(Icons.date_range),
                  label: const Text('Cambiar Fecha'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            if (!isWorkingDay)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  border: Border.all(color: Colors.red.shade200, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.warning, color: Colors.red, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      '⚠️ La clínica no está habilitada para atender en este día (${_weekdaysNames[dayOfWeek]}).',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Puedes habilitar la atención para este día arriba en la Configuración de Días Hábiles.',
                      style: TextStyle(color: Colors.red, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('appointments')
                    .where('scheduledAt', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
                    .where('scheduledAt', isLessThanOrEqualTo: Timestamp.fromDate(endOfDay))
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error al cargar turnos: ${snapshot.error}'));
                  }

                  final bookedSlots = <int, Map<String, dynamic>>{};
                  if (snapshot.hasData) {
                    for (final doc in snapshot.data!.docs) {
                      final data = doc.data();
                      final scheduledAt = (data['scheduledAt'] as Timestamp).toDate();
                      bookedSlots[scheduledAt.hour] = {
                        'id': doc.id,
                        ...data,
                      };
                    }
                  }

                  return Column(
                    children: List.generate(10, (index) {
                      final hour = index + 8; // 8:00 to 17:00
                      final timeStr = '${hour.toString().padLeft(2, '0')}:00';
                      final booking = bookedSlots[hour];

                      if (booking != null) {
                        final status = booking['status'] ?? 'pending';
                        final petName = booking['petName'] ?? 'Sin Mascota';
                        final clientName = booking['clientName'] ?? 'Sin Cliente';
                        final serviceName = booking['serviceName'] ?? 'Sin Servicio';
                        final price = (booking['price'] as num?)?.toDouble() ?? 0.0;
                        final notes = booking['notes'];
                        final reason = booking['cancellationReason'];

                        Color badgeColor = Colors.amber;
                        String statusLabel = 'Agendado';
                        if (status == 'completed') {
                          badgeColor = Colors.teal;
                          statusLabel = 'Atendido';
                        } else if (status == 'cancelled') {
                          badgeColor = Colors.red;
                          statusLabel = 'Cancelado';
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Text(
                                    timeStr,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '$petName ($clientName)',
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '$serviceName • \$${price.toStringAsFixed(2)}',
                                          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                                        ),
                                        if (notes != null && notes.toString().isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Text(
                                            'Notas: $notes',
                                            style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                        if (status == 'cancelled' && reason != null && reason.toString().isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Text(
                                            'Motivo: $reason',
                                            style: const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                                          ),
                                        ]
                                      ],
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      statusLabel,
                                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: badgeColor,
                                    padding: EdgeInsets.zero,
                                  ),
                                  const SizedBox(width: 12),
                                  if (status == 'pending') ...[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      ),
                                      onPressed: () => _confirmComplete(
                                        booking['id'],
                                        booking['clientId'] ?? '',
                                        clientName,
                                        serviceName,
                                        price,
                                      ),
                                      child: const Text('Completar', style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ),
                                    const SizedBox(width: 8),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.red,
                                        side: const BorderSide(color: Colors.red),
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      ),
                                      onPressed: () => _showCancelDialog(booking['id']),
                                      child: const Text('Cancelar', style: TextStyle(fontSize: 12)),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  timeStr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Text(
                                  'Disponible',
                                  style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),
                                ),
                                const Spacer(),
                                const Text(
                                  'Sin cita programada',
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
