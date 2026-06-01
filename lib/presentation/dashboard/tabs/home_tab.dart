import 'package:flutter/material.dart';
import '../widgets/bento_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          const Text(
            '¡Buen día, Dr. Veterinario!',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF191C1E),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Aquí tienes un resumen de tu clínica hoy.',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16,
              color: Color(0xFF3E4850),
            ),
          ),
          const SizedBox(height: 32),
          // Bento Grid
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Próxima cita
                    BentoCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Próxima Cita',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xFFC6E7FF),
                                child: Icon(Icons.pets, color: Color(0xFF00658D)),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Max (Golden Retriever)',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '10:30 AM - Vacunación Anual',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00A8E8),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Iniciar Consulta',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Pacientes Recientes
                    BentoCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pacientes Recientes',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 100,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              separatorBuilder: (context, index) => const SizedBox(width: 16),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Colors.grey.shade200,
                                      child: const Icon(Icons.pets, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Mascota ${index + 1}',
                                      style: const TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Right Column
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    // Resumen del día
                    BentoCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Resumen de Hoy',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildSummaryRow(Icons.calendar_today, 'Citas Hoy', '8'),
                          const Divider(height: 24),
                          _buildSummaryRow(Icons.local_shipping, 'Pedidos', '3 Activos'),
                          const Divider(height: 24),
                          _buildSummaryRow(Icons.pets, 'En Hospedaje', '2'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF00658D), size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16,
              color: Color(0xFF3E4850),
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF191C1E),
          ),
        ),
      ],
    );
  }
}
