// ESTE ES EL PUNTO DE PARTIDA DE NUESTRA APLICACIÓN (EL ARCHIVO PRINCIPAL)
// Aquí es donde el celular empieza a leer el código para arrancar la app de Pet Shop.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'core/router/app_router.dart';
import 'presentation/auth/providers/auth_providers.dart';
import 'presentation/appointments/notifications/push_notification_service.dart';

/// La función [main] es el motor de arranque de la aplicación.
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Capturamos todos los errores de Flutter que ocurren durante el renderizado
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      debugPrint('FLUTTER UI ERROR: ${details.exception}');
    };

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    // Activar Firebase App Check para evitar abusos y proteger los endpoints de Firebase
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity, // Producción: Usa Google Play Integrity API
      appleProvider: AppleProvider.appAttest,
      webProvider: ReCaptchaV3Provider('6Lef_OUqAAAAAEZ3g4n-oM2qD97P3B4f9j4k3l5m'),
    );

    final pushNotificationService = PushNotificationService();
    await pushNotificationService.init();

    runApp(
      ProviderScope(
        child: Consumer(
          builder: (context, ref, child) {
            ref.watch(syncBootstrapProvider);
            return const MyApp();
          },
        ),
      ),
    );
  } catch (e, stack) {
    debugPrint('ERROR CRÍTICO EN INICIALIZACIÓN: $e');
    debugPrint(stack.toString());
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Error al iniciar: $e')),
      ),
    ));
  }
}

/// [MyApp] representa la aplicación en sí.
/// Hereda de 'ConsumerWidget', lo que significa que es un componente visual capaz de "escuchar"
/// y reaccionar a cambios en nuestros almacenes de datos (Providers).
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchamos el enrutador de la aplicación. El enrutador decide qué pantalla mostrar
    // (por ejemplo, si muestra la pantalla de Login, la de Registro o el menú principal).
    final router = ref.watch(routerProvider);

    // 'MaterialApp.router' configura el diseño visual básico de Android e iOS (Material Design),
    // establece los temas de colores y conecta las rutas para navegar entre pantallas.
    return MaterialApp.router(
      title: 'Pet Shop App',
      // Definimos el tema visual de la app, en este caso usando tonos morados (deepPurple)
      // y la estética moderna de Material 3.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Le pasamos la configuración de navegación que creamos en 'app_router.dart'
      routerConfig: router,
    );
  }
}
