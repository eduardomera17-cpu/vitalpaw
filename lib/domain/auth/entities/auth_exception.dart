// TRADUCTOR DE ERRORES DE AUTENTICACIÓN (EXCEPCIÓN PERSONALIZADA)
// Cuando algo sale mal al iniciar sesión o registrarse (por ejemplo, contraseña incorrecta o falta de internet),
// esta clase nos ayuda a capturar ese error y traducirlo en un mensaje amigable en español.

class AuthException implements Exception {
  /// El mensaje amigable y fácil de entender que le mostraremos al usuario en pantalla.
  final String message;

  /// El código técnico del error (por si necesitamos investigarlo en el futuro).
  final String? code;

  const AuthException(this.message, {this.code});

  /// Este "Constructor de Fábrica" ([AuthException.fromFirebaseCode]) toma el código técnico en inglés
  /// que nos envía Firebase (el servidor) y lo traduce a una frase clara en español.
  ///
  /// Por ejemplo: si Firebase dice "wrong-password", nosotros le mostramos "Contraseña incorrecta."
  factory AuthException.fromFirebaseCode(String code) {
    const messages = {
      'user-not-found': 'El usuario o la contraseña son incorrectos. Por favor, verifícalos.',
      'wrong-password': 'El usuario o la contraseña son incorrectos. Por favor, verifícalos.',
      'invalid-credential': 'El usuario o la contraseña son incorrectos. Por favor, verifícalos.',
      'invalid-email': 'El formato del correo no es válido.',
      'user-disabled': 'Esta cuenta ha sido deshabilitada.',
      'email-already-in-use': 'Este correo ya está registrado.',
      'weak-password': 'La contraseña debe tener al menos 6 caracteres.',
      'network-request-failed': 'Sin conexión de internet. Verifica tu red.',
      'too-many-requests': 'Demasiados intentos seguidos. Intenta más tarde.',
    };

    // Buscamos si tenemos traducción para el código de error.
    // Si es un código desconocido, mostramos un mensaje por defecto para no asustar al usuario.
    return AuthException(
      messages[code] ?? 'Ocurrió un error inesperado al intentar acceder.',
      code: code,
    );
  }

  /// 'toString' le dice a Dart cómo representar esta clase como un texto simple.
  /// Así, si ponemos 'print(error)', nos mostrará directamente el mensaje amigable en español.
  @override
  String toString() => message;
}
