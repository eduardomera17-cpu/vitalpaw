import 'package:flutter/material.dart';
import '../widgets/bento_card.dart';

class InventoryTab extends StatelessWidget {
  const InventoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Inventario y Adopciones',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF191C1E),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BentoCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Stock de Productos',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Nuevo Producto'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00658D),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                        columns: const [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Producto')),
                          DataColumn(label: Text('Categoría')),
                          DataColumn(label: Text('Precio')),
                          DataColumn(label: Text('Stock')),
                          DataColumn(label: Text('Acciones')),
                        ],
                        rows: List.generate(
                          10,
                          (index) => DataRow(
                            cells: [
                              DataCell(Text('PRD-00${index + 1}')),
                              DataCell(Text('Alimento Premium ${index + 1}')),
                              const DataCell(Text('Alimentos')),
                              const DataCell(Text('\$45.00')),
                              DataCell(
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: index % 3 == 0 ? const Color(0xFFFFDAD6) : const Color(0xFFC6E7FF),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    index % 3 == 0 ? 'Bajo ($index)' : 'Óptimo',
                                    style: TextStyle(
                                      color: index % 3 == 0 ? const Color(0xFF93000A) : const Color(0xFF001E2D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                IconButton(
                                  icon: const Icon(Icons.edit, size: 20, color: Colors.grey),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
