import 'package:flutter/material.dart';
import '../widgets/bento_card.dart';

class FinanceTab extends StatelessWidget {
  const FinanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Finanzas y Facturación',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF191C1E),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: BentoCard(
                  backgroundColor: const Color(0xFF00A8E8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ingresos del Día',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$1,250.00',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: BentoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Pedidos Completados',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '24',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: BentoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Citas Atendidas',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '8',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BentoCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Transacciones Recientes',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xFFF7F9FB),
                            child: Icon(
                              index % 2 == 0 ? Icons.shopping_bag : Icons.medical_services,
                              color: const Color(0xFF00658D),
                            ),
                          ),
                          title: Text(index % 2 == 0 ? 'Venta E-commerce' : 'Consulta Veterinaria'),
                          subtitle: const Text('10:45 AM - Cliente: Juan Pérez'),
                          trailing: Text(
                            '+\$${(index + 1) * 25}.00',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E7D32),
                            ),
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
    );
  }
}
