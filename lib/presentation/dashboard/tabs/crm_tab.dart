import 'package:flutter/material.dart';
import '../widgets/bento_card.dart';

class CrmTab extends StatelessWidget {
  const CrmTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CRM y Usuarios',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF191C1E),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: BentoCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Directorio de Clientes',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Buscar por nombre, teléfono o mascota...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.separated(
                            itemCount: 15,
                            separatorBuilder: (context, index) => const Divider(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Color(0xFFC6E7FF),
                                  child: Icon(Icons.person, color: Color(0xFF00658D)),
                                ),
                                title: Text('Cliente ${index + 1}'),
                                subtitle: const Text('+1 234 567 8900'),
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF7F9FB),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Text('2 Mascotas'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: BentoCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Registro de Auditoría',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.history, size: 16, color: Colors.grey),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Dr. Veterinario actualizó el inventario',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            'Hace 2 horas',
                                            style: TextStyle(fontSize: 12, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
