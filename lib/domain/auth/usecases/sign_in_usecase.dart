import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

// CASO DE USO: INICIAR SESIÓN (SIGN IN)
// Esta clase representa la acción de iniciar sesión en la veterinaria.
// Se asegura de enviar el correo y la clave ingresados al repositorio para validar si son correctos.

class SignInUseCase {
  // El repositorio que tiene las funciones de autenticación.
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  /// Ejecuta la acción de iniciar sesión.
  /// Pide obligatoriamente el [email] y el [password].
  /// Devuelve el perfil del usuario ([AppUser]) si el inicio de sesión es exitoso.
  Future<AppUser> execute({required String email, required String password}) {
    return _repository.signIn(email: email, password: password);
  }
}
