import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

// CASO DE USO: OBTENER EL USUARIO ACTUAL
// Este caso de uso sirve para responder a la pregunta: ¿Quién está usando la aplicación ahora mismo?
// Nos ayuda a cargar el perfil correcto al abrir la app o al verificar si debemos enviarlo al Login.

class GetCurrentUserUseCase {
  // El repositorio que tiene las funciones de autenticación.
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  /// Ejecuta la acción de buscar al usuario actualmente logueado.
  /// Devuelve el perfil completo del usuario ([AppUser]) o 'null' si no hay nadie conectado.
  Future<AppUser?> execute() {
    return _repository.getCurrentUser();
  }
}
