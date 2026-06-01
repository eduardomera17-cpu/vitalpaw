// lib/presentation/marketplace/order_history_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/marketplace/entities/order.dart';
import 'providers/marketplace_providers.dart';

class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(orderHistoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Pedidos')),
      body: historyAsync.when(
        data: (orders) {
          if (orders.isEmpty) {
            return const Center(child: Text('Aún no has realizado pedidos.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final date = order.placedAt != null
                  ? DateFormat('dd/MM/yyyy HH:mm').format(order.placedAt!)
                  : 'Fecha desconocida';

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pedido #${order.id.substring(0, 8).toUpperCase()}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Chip(
                            label: Text(
                              order.status.displayName,
                              style: const TextStyle(fontSize: 12),
                            ),
                            avatar: Text(order.status.icon),
                            backgroundColor: _getStatusColor(
                              order.status,
                            ).withValues(alpha: 0.2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Fecha: $date',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${order.totalItems} producto(s)'),
                          Text(
                            '\$${order.totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      if (order.canBeCancelled) ...[
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                            onPressed: () =>
                                _cancelOrder(context, ref, order.id),
                            child: const Text('Cancelar Pedido'),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }

  void _cancelOrder(BuildContext context, WidgetRef ref, String orderId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Cancelar pedido'),
        content: const Text(
          '¿Estás seguro de que deseas cancelar este pedido?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(c, true),
            child: const Text('Sí, cancelar'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await ref.read(cancelOrderUseCaseProvider).execute(orderId);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Pedido cancelado correctamente')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.placed:
      case OrderStatus.confirmed:
        return Colors.blue;
      case OrderStatus.preparing:
      case OrderStatus.ready:
        return Colors.orange;
      case OrderStatus.delivering:
        return Colors.purple;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
