import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/providers/auth_providers.dart';

// PANTALLA PRINCIPAL DE CLIENTES (HOME SCREEN)
// Esta pantalla la visualizan los clientes normales del negocio al ingresar a la app.
// Desde aquí verán el catálogo de productos y podrán agendar citas para sus mascotas.

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home (Cliente)'),
        actions: [
          // Botón de salir (Cerrar Sesión)
          IconButton(
            icon: const Icon(Icons.logout),
            // Llama de forma segura al caso de uso de cerrar sesión
            onPressed: () => ref.read(signOutUseCaseProvider).execute(),
          ),
        ],
      ),
      body: const Center(
        child: Text('Bienvenido a la Tienda de Mascotas (Pet Shop)'),
      ),
    );
  }
}
