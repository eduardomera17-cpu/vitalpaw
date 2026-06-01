import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/sync/sync_worker.dart';
import '../../../data/auth/datasources/firebase_auth_datasource.dart';
import '../../../data/auth/datasources/local_auth_datasource.dart';
import '../../../data/auth/repositories/auth_repository_impl.dart';
import '../../../core/providers/database_provider.dart';
import '../../../domain/auth/entities/app_user.dart';
import '../../../domain/auth/repositories/auth_repository.dart';
import '../../../domain/auth/usecases/forgot_password_usecase.dart';
import '../../../domain/auth/usecases/get_current_user_usecase.dart';
import '../../../domain/auth/usecases/sign_in_usecase.dart';
import '../../../domain/auth/usecases/sign_out_usecase.dart';
import '../../../domain/auth/usecases/sign_up_usecase.dart';

// PROVEEDORES DEL MÓDULO DE USUARIOS Y AUTENTICACIÓN
// Aquí creamos los "accesos directos" (Providers) de Riverpod para inyectar y conectar
// todas las piezas de la autenticación de la app (Fuentes de datos, Casos de Uso y Seguridad).

// ── 1. FUENTES DE DATOS (DATASOURCES) ───────────────────────────────────────

/// Conector a los servicios de internet de Google Firebase Authentication.
final firebaseAuthDatasourceProvider = Provider<FirebaseAuthDatasource>((ref) {
  return FirebaseAuthDatasource();
});

/// Conector a las tablas locales de SQLite de usuarios.
final localAuthDatasourceProvider = Provider<LocalAuthDatasource>((ref) {
  return LocalAuthDatasource(ref.watch(appDatabaseProvider));
});

// ── 2. REPOSITORIO (COORDINADOR) ──────────────────────────────────────────

/// Inyecta la implementación del repositorio inyectándole ambos datasources (remoto y local).
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    firebaseDatasource: ref.watch(firebaseAuthDatasourceProvider),
    localDatasource: ref.watch(localAuthDatasourceProvider),
  );
});

// ── 3. ESTADO DE LA SESIÓN EN VIVO (AUTH STATE STREAM) ──────────────────────

/// [authStateProvider] vigila en vivo si el usuario está conectado o no.
/// Las pantallas (Widgets) escuchan este Stream para decidir si muestran la pantalla
/// de Inicio (Catálogo) o mandan al usuario a la pantalla de Login.
final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

// ── 4. CASOS DE USO (USE CASES) ─────────────────────────────────────────────
// Exponen acciones específicas y aisladas para que los botones de la interfaz
// las puedan disparar con un solo clic.

/// Inyecta la acción de Iniciar Sesión.
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

/// Inyecta la acción de Registrar nuevos Clientes.
final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.watch(authRepositoryProvider));
});

/// Inyecta la acción de Cerrar Sesión.
final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(ref.watch(authRepositoryProvider));
});

/// Inyecta la acción de mandar el correo para cambiar la clave.
final forgotPasswordUseCaseProvider = Provider<ForgotPasswordUseCase>((ref) {
  return ForgotPasswordUseCase(ref.watch(authRepositoryProvider));
});

/// Inyecta la acción de verificar quién está conectado en este momento.
final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  return GetCurrentUserUseCase(ref.watch(authRepositoryProvider));
});

// ── 5. EL INTERRUPTOR AUTOMÁTICO DE SINCRONIZACIÓN (SYNC BOOTSTRAP) ─────────

/// [syncBootstrapProvider] es un vigilante sumamente inteligente.
///
/// Escucha continuamente el estado de la sesión del usuario ([authStateProvider]):
/// - Si detecta que un usuario inicia sesión con éxito:
///   1. Enciende el motor de sincronización automática de fondo.
///   2. Si el usuario es un Repartidor ('driver'), le pasa su ID para que comience
///      a recopilar y subir sus coordenadas de GPS en ruta.
/// - Si el usuario cierra sesión:
///   1. Apaga y desarma por completo el motor de sincronización de fondo para no gastar batería.
final syncBootstrapProvider = Provider<void>((ref) {
  final authState = ref.watch(authStateProvider);
  final syncWorker = ref.watch(syncWorkerProvider);

  authState.whenData((user) {
    if (user != null) {
      // Usuario Conectado -> Arrancamos el worker de sincronización
      syncWorker.start(driverId: user.role == UserRole.driver ? user.id : null);
    } else {
      // Usuario Desconectado -> Apagamos el worker
      syncWorker.stop();
    }
  });
});
