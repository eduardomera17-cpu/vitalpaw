import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/providers/auth_providers.dart';

// PANTALLA PRINCIPAL DE CLIENTES (HOME SCREEN)
// Panel nativo y moderno donde los clientes pueden acceder a todas las funciones
// de la tienda, adopción y veterinaria mediante botones grandes (tarjetas).

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchamos quién está logueado para mostrar su nombre
    final userAsync = ref.watch(authStateProvider);
    final userName = userAsync.value?.displayName ?? 'Cliente';

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB), // Fondo gris muy claro
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FB),
        elevation: 0,
        title: Text(
          'Hola, $userName 👋',
          style: const TextStyle(
            color: Color(0xFF191C1E),
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
        ),
        actions: [
          // Botón para ir al carrito de compras rápido
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF191C1E)),
            onPressed: () => context.push('/cart'),
          ),
          // Botón de salir (Cerrar Sesión)
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () => ref.read(signOutUseCaseProvider).execute(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BANNERS DE PROMOCIÓN O BIENVENIDA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00658D), Color(0xFF004F71)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00658D).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bienvenido a VitalPaw 🐾',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Encuentra todo lo que tu mascota necesita en un solo lugar. Productos, citas médicas y adopciones.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // TÍTULO DE SECCIÓN
              const Text(
                '¿Qué necesitas hoy?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF191C1E),
                ),
              ),
              const SizedBox(height: 16),

              // GRILLA DE MÓDULOS (Dashboard Cliente)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.95,
                children: [
                  _HomeModuleCard(
                    title: 'Tienda de Productos',
                    subtitle: 'Alimentos, juguetes y más',
                    icon: Icons.storefront_outlined,
                    color: Colors.orange,
                    onTap: () => context.push('/catalog'),
                  ),
                  _HomeModuleCard(
                    title: 'Agenda Clínica',
                    subtitle: 'Reserva citas veterinarias',
                    icon: Icons.calendar_month_outlined,
                    color: Colors.teal,
                    onTap: () => context.push('/appointments'),
                  ),
                  _HomeModuleCard(
                    title: 'Adopciones',
                    subtitle: 'Dale un hogar a una mascota',
                    icon: Icons.pets_outlined,
                    color: Colors.pinkAccent,
                    onTap: () => context.push('/animals'),
                  ),
                  _HomeModuleCard(
                    title: 'Mis Compras',
                    subtitle: 'Revisa tu historial de pedidos',
                    icon: Icons.receipt_long_outlined,
                    color: Colors.indigo,
                    onTap: () => context.push('/orders'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget interno para las tarjetas del menú principal
class _HomeModuleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _HomeModuleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191C1E),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
