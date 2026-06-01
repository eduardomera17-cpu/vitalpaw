import '../repositories/auth_repository.dart';

// CASO DE USO: RECUPERAR CONTRASEÑA
// En Arquitectura Limpia, cada clase de tipo "UseCase" representa una única acción específica
// que un usuario puede hacer en la aplicación. Esto hace que el código sea modular:
// si hay un error al recuperar la contraseña, sabemos exactamente que el problema está en esta clase.

class ForgotPasswordUseCase {
  // El repositorio que tiene las funciones de autenticación.
  final AuthRepository _repository;

  ForgotPasswordUseCase(this._repository);

  /// Ejecuta la acción de enviar un correo de recuperación de contraseña al email indicado.
  Future<void> execute(String email) {
    return _repository.sendPasswordResetEmail(email);
  }
}
