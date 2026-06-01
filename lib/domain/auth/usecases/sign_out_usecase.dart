import '../repositories/auth_repository.dart';

// CASO DE USO: CERRAR SESIÓN (SIGN OUT)
// Esta clase representa la acción de cerrar la sesión activa del usuario.
// Se encarga de borrar las credenciales guardadas en el teléfono para que nadie más pueda entrar.

class SignOutUseCase {
  // El repositorio que tiene las funciones de autenticación.
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  /// Ejecuta la acción de cerrar la sesión de forma segura.
  Future<void> execute() {
    return _repository.signOut();
  }
}
