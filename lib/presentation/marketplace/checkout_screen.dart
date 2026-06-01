// lib/presentation/marketplace/checkout_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/marketplace/entities/order.dart';
import '../../domain/marketplace/entities/marketplace_exception.dart';
import '../../domain/marketplace/repositories/order_repository.dart';
import '../auth/providers/auth_providers.dart';
import 'providers/marketplace_providers.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  PaymentMethod _selectedPayment = PaymentMethod.cash;
  bool _isLoading = false;

  @override
  void dispose() {
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _placeOrder() async {
    if (_addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingresa tu dirección de entrega'),
        ),
      );
      return;
    }

    final user = ref.read(authStateProvider).value;
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      final totals = ref.read(cartTotalsProvider).value!;

      // FIX: El uso de coordenadas quemadas se mantiene como mock visual
      // En producción esto provendría de un mapa real
      final order = await ref
          .read(placeOrderUseCaseProvider)
          .execute(
            PlaceOrderParams(
              clientId: user.id,
              deliveryAddress: _addressController.text.trim(),
              deliveryLat: -2.1709, // Mock Guayaquil
              deliveryLng: -79.9224,
              paymentMethod: _selectedPayment,
              deliveryFee: totals.deliveryFee,
              clientNotes: _notesController.text.trim(),
            ),
          );

      if (mounted) {
        context.go('/order-confirmation', extra: order);
      }
    } on MarketplaceException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al procesar el pedido'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final totals = ref.watch(cartTotalsProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dirección de entrega',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      hintText: 'Ej. Av. 9 de Octubre y Boyacá...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Notas para el repartidor (Opcional)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _notesController,
                    decoration: const InputDecoration(
                      hintText:
                          'Ej. Dejar en garita, tocar el timbre fuerte...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Método de Pago',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  ...PaymentMethod.values.map(
                    (method) => RadioListTile<PaymentMethod>(
                      title: Row(
                        children: [
                          Text(method.icon),
                          const SizedBox(width: 8),
                          Text(method.displayName),
                        ],
                      ),
                      value: method,
                      groupValue: _selectedPayment,
                      onChanged: (v) => setState(() => _selectedPayment = v!),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _isLoading ? null : _placeOrder,
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
            child: Text(
              _isLoading
                  ? 'Procesando...'
                  : 'Confirmar Pedido (\$${totals?.total.toStringAsFixed(2) ?? '0.00'})',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
