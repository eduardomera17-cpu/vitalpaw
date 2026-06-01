import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/chat/chat_screen.dart';
import '../../presentation/admin/web_dashboard_screen.dart';
import '../../domain/auth/entities/app_user.dart';
import '../../presentation/auth/login_screen.dart';
import '../../presentation/auth/register_screen.dart';
import '../../presentation/auth/forgot_password_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/dashboard/dashboard_screen.dart';
import '../../presentation/auth/providers/auth_providers.dart';
import '../../presentation/appointments/agenda_screen.dart';
import '../../presentation/appointments/appointment_form_screen.dart';
import '../../presentation/appointments/appointment_detail_screen.dart';
import '../../domain/medical/entities/medical_record.dart';
import '../../presentation/medical/pet_history_screen.dart';
import '../../presentation/medical/add_record_screen.dart';
import '../../presentation/medical/record_detail_screen.dart';
import '../../presentation/admin/conflict_center_screen.dart';

import '../../domain/marketplace/entities/order.dart';
import '../../domain/marketplace/entities/product.dart';
import '../../presentation/marketplace/catalog_screen.dart';
import '../../presentation/marketplace/product_detail_screen.dart';
import '../../presentation/marketplace/cart_screen.dart';
import '../../presentation/marketplace/checkout_screen.dart';
import '../../presentation/marketplace/order_confirmation_screen.dart';
import '../../presentation/marketplace/order_history_screen.dart';

import '../../domain/animals/entities/animal_listing.dart';
import '../../presentation/animals/animal_catalog_screen.dart';
import '../../presentation/animals/animal_detail_screen.dart';
import '../../presentation/animals/adoption_request_screen.dart';

// EL MAPA DE NAVEGACIÓN Y GUARDiÁN DE PANTALLAS (ROUTER)
// Este archivo funciona como el GPS de nuestra aplicación. Le dice a la app qué pantallas
// existen y controla quién puede entrar a ellas según si ha iniciado sesión y cuál es su rol.

/// [routerProvider] configura y expone la librería 'GoRouter'.
/// Al estar dentro de un Provider de Riverpod, puede "escuchar" el estado de la autenticación
/// del usuario en tiempo real para redirigirlo automáticamente si inicia o cierra sesión.
final routerProvider = Provider<GoRouter>((ref) {
  // Escuchamos continuamente si hay un usuario logueado en la aplicación.
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    // La pantalla con la que arranca la aplicación por defecto (el Login).
    initialLocation: '/login',

    // 'redirect' es el GUARDiÁN de seguridad. Cada vez que el usuario intenta cambiar
    // de pantalla, este método comprueba si tiene permiso de hacerlo.
    redirect: (context, state) {
      // ¿El usuario ha iniciado sesión? (isLoggedIn será verdadero si hay datos de usuario).
      final isLoggedIn = authState.value != null;

      // ¿La pantalla a la que intenta ir es de las "públicas" (Login, Registro o Recuperar Clave)?
      final isAuthRoute =
          state.matchedLocation.startsWith('/login') ||
          state.matchedLocation.startsWith('/register') ||
          state.matchedLocation.startsWith('/forgot-password');

      // CASO 1: Si NO ha iniciado sesión y está intentando entrar a una pantalla privada
      // (como el Home o el Dashboard), lo detenemos y lo mandamos de regreso al Login.
      if (!isLoggedIn && !isAuthRoute) return '/login';

      // CASO 2: Si SÍ ha iniciado sesión pero está intentando entrar a las pantallas de Login o Registro...
      // ¡Eso ya no tiene sentido! Así que lo redirigimos automáticamente a su pantalla correspondiente según su ROL:
      if (isLoggedIn && isAuthRoute) {
        final role = authState.value?.role;

        // Dependiendo del rol del usuario (Administrador, Repartidor, Cliente), lo mandamos a su panel de control:
        return switch (role) {
          // Si es Administrador o Personal de la tienda, lo mandamos al Panel Administrativo.
          UserRole.admin || UserRole.staff => '/dashboard',
          // Para cualquier otro caso (clientes normales), los mandamos a la pantalla de inicio (Catálogo).
          _ => '/home',
        };
      }

      // Si todo está en orden y no hay necesidad de redirigir, permitimos que continúe a donde iba.
      return null;
    },

    // Aquí definimos la "lista de direcciones" de la app.
    // Cada ruta asocia un texto (como '/login') con la pantalla visual (Widget) correspondiente.
    routes: [
      // Pantalla de inicio de sesión
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      // Pantalla de registro de nuevos clientes
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      // Pantalla para recuperar la contraseña olvidada
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      // Pantalla principal de la tienda para clientes
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      // Pantalla del panel de administración para personal
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const WebDashboardScreen(),
      ),
      GoRoute(
        path: '/chat/:roomId',
        builder: (context, state) {
          final roomId = state.pathParameters['roomId']!;
          return ChatScreen(roomId: roomId);
        },
      ),

      // -- RUTAS DEL MÓDULO DE AGENDA --
      // Pantalla principal de la agenda (Calendario + Lista)
      GoRoute(
        path: '/appointments',
        builder: (context, state) => const AgendaScreen(),
      ),
      // Pantalla para crear nueva cita
      GoRoute(
        path: '/appointments/new',
        builder: (context, state) {
          final preselectedDate = state.extra as DateTime?;
          return AppointmentFormScreen(preselectedDate: preselectedDate);
        },
      ),
      // Pantalla para editar cita existente
      GoRoute(
        path: '/appointments/edit/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return AppointmentFormScreen(appointmentId: id);
        },
      ),
      // Pantalla de detalles de la cita
      GoRoute(
        path: '/appointments/detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return AppointmentDetailScreen(appointmentId: id);
        },
      ),

      // -- RUTAS DEL MÓDULO DE HISTORIA CLÍNICA --
      GoRoute(
        path: '/medical/conflicts',
        builder: (context, state) => const ConflictCenterScreen(),
      ),
      GoRoute(
        path: '/medical/:petId',
        builder: (context, state) {
          final petId = state.pathParameters['petId']!;
          final petName = state.extra as String? ?? 'Mascota';
          return PetHistoryScreen(petId: petId, petName: petName);
        },
      ),
      GoRoute(
        path: '/medical/:petId/add',
        builder: (context, state) {
          final petId = state.pathParameters['petId']!;
          final petName = state.extra as String? ?? 'Mascota';
          return AddRecordScreen(petId: petId, petName: petName);
        },
      ),
      GoRoute(
        path: '/medical/record/:id',
        builder: (context, state) {
          final record = state.extra as MedicalRecord;
          return RecordDetailScreen(record: record);
        },
      ),

      // -- RUTAS DEL MARKETPLACE --
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const CatalogScreen(),
      ),
      GoRoute(
        path: '/catalog/:id',
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailScreen(product: product);
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/checkout',
        builder: (context, state) => const CheckoutScreen(),
      ),
      GoRoute(
        path: '/order-confirmation',
        builder: (context, state) {
          final order = state.extra as Order;
          return OrderConfirmationScreen(order: order);
        },
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrderHistoryScreen(),
      ),

      // -- RUTAS DEL CATÁLOGO DE ANIMALES --
      GoRoute(
        path: '/animals',
        builder: (context, state) => const AnimalCatalogScreen(),
      ),
      GoRoute(
        path: '/animals/request',
        builder: (context, state) {
          final listing = state.extra as AnimalListing;
          return AdoptionRequestScreen(listing: listing);
        },
      ),
      GoRoute(
        path: '/animals/:id',
        builder: (context, state) {
          final listing = state.extra as AnimalListing;
          return AnimalDetailScreen(listing: listing);
        },
      ),
    ],
  );
});
