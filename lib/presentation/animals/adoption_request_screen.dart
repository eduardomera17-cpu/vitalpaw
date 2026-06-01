// lib/presentation/animals/adoption_request_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/animals/entities/animal_listing.dart';
import '../../../domain/animals/repositories/adoption_repository.dart';
import 'providers/animal_providers.dart';

class AdoptionRequestScreen extends ConsumerStatefulWidget {
  final AnimalListing listing;

  const AdoptionRequestScreen({super.key, required this.listing});

  @override
  ConsumerState<AdoptionRequestScreen> createState() => _AdoptionRequestScreenState();
}

class _AdoptionRequestScreenState extends ConsumerState<AdoptionRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final submitUseCase = ref.read(submitRequestUseCaseProvider);
      final currentUser = ref.read(currentUserProvider);

      await submitUseCase.execute(
        SubmitRequestParams(
          listingId: widget.listing.id,
          animalName: widget.listing.name,
          clientId: currentUser['id']!,
          clientName: currentUser['name']!,
          clientPhone: currentUser['phone']!,
          clientEmail: currentUser['email']!,
          requestType: widget.listing.listingType,
          message: _messageController.text,
        ),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.listing.listingType == ListingType.adoption
                  ? '¡Solicitud de adopción enviada con éxito! Te contactaremos pronto.'
                  : '¡Reserva enviada con éxito! Te contactaremos para el pago.',
            ),
            backgroundColor: Colors.green,
          ),
        );
        context.pop(); // Volver al detalle
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final type = widget.listing.listingType;
    final isAdoption = type == ListingType.adoption;

    return Scaffold(
      appBar: AppBar(
        title: Text(isAdoption ? 'Solicitud de Adopción' : 'Reserva de Mascota'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _AnimalSummaryCard(listing: widget.listing),
              const SizedBox(height: 32),
              
              Text(
                isAdoption 
                    ? '¿Por qué quieres adoptar a ${widget.listing.name}?' 
                    : 'Déjanos un mensaje (Opcional)',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _messageController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: isAdoption
                      ? 'Cuéntanos un poco sobre tu hogar, tu experiencia con mascotas y quiénes vivirán con ${widget.listing.name}.'
                      : 'Cualquier consulta sobre la compra...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (isAdoption && (value == null || value.trim().length < 20)) {
                    return 'Por favor, escríbenos al menos un par de líneas.';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 32),
              
              // Nota de funcionamiento offline
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.offline_pin, color: Colors.blue),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Esta solicitud se guardará localmente en tu dispositivo. Si no tienes internet, se enviará automáticamente cuando recuperes la conexión.',
                        style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitRequest,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: isAdoption ? Colors.pink : Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        height: 24, width: 24, 
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                      )
                    : Text(
                        isAdoption ? 'Enviar Solicitud de Adopción' : 'Confirmar Reserva',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimalSummaryCard extends StatelessWidget {
  final AnimalListing listing;
  const _AnimalSummaryCard({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(listing.species.icon, style: const TextStyle(fontSize: 40)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listing.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('${listing.species.displayName} · ${listing.ageLabel}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
