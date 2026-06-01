import '../entities/app_user.dart';

// EL CONTRATO DE AUTENTICACIÓN (REPOSITORIO ABSTRACTO)
// En Arquitectura Limpia, los repositorios abstractos actúan como "contratos" o "planos".
// No contienen el código de CÓMO se hacen las cosas, sino que definen QUÉ cosas debe poder hacer
// cualquier sistema de usuarios que use la aplicación (por ejemplo: Firebase o un servidor propio).

abstract class AuthRepository {
  /// Obtiene el usuario que tiene la sesión iniciada actualmente en el teléfono.
  /// Devuelve 'null' si no hay ningún usuario conectado.
  Future<AppUser?> getCurrentUser();

  /// Un canal de datos continuo (Stream) que nos avisa en tiempo real si un usuario
  /// acaba de iniciar sesión, cerrar sesión o si caducó su sesión.
  Stream<AppUser?> get authStateChanges;

  /// Inicia sesión en la aplicación usando el correo electrónico y la contraseña.
  /// Si los datos son correctos, nos devuelve el perfil del usuario.
  Future<AppUser> signIn({required String email, required String password});

  /// Registra una nueva cuenta de usuario en el sistema.
  /// Pide el correo, la contraseña y su nombre para mostrar.
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String displayName,
  });

  /// Cierra la sesión activa del usuario y limpia los datos de acceso del teléfono.
  Future<void> signOut();

  /// Envía un correo electrónico al usuario con un enlace seguro para restablecer o cambiar su contraseña.
  Future<void> sendPasswordResetEmail(String email);
}
