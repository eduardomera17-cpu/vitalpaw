import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

// CASO DE USO: REGISTRAR UN NUEVO USUARIO (SIGN UP)
// Esta clase representa la acción de crear una cuenta nueva en la Pet Shop.
// Toma los datos ingresados por el usuario (nombre, correo y clave) y los envía al repositorio
// para darlo de alta en el sistema.

class SignUpUseCase {
  // El repositorio que tiene las funciones de autenticación.
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  /// Ejecuta la acción de registrar un nuevo usuario.
  /// Requiere obligatoriamente el [email], la contraseña [password] y el nombre a mostrar [displayName].
  /// Devuelve el perfil completo del usuario creado ([AppUser]) si todo se procesa correctamente.
  Future<AppUser> execute({
    required String email,
    required String password,
    required String displayName,
  }) {
    return _repository.signUp(
      email: email,
      password: password,
      displayName: displayName,
    );
  }
}
