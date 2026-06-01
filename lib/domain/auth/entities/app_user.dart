// REPRESENTACIÓN DE UN USUARIO (ENTIDAD)
// En Arquitectura Limpia, las entidades representan los objetos reales del negocio.
// Esta clase representa a cualquier persona que use nuestra aplicación (Clientes, Administradores, etc.).

class AppUser {
  /// El identificador único de este usuario en nuestra base de datos local (Drift).
  /// Es un formato UUID (código largo y único) para evitar choques al guardar sin internet.
  final String id;

  /// El código de seguridad único que le asigna Firebase Authentication en la nube.
  /// Nos sirve para conectar los datos locales con la cuenta del usuario en internet.
  final String firebaseUid;

  /// El correo electrónico del usuario (con el que inicia sesión).
  final String email;

  /// El nombre completo o apodo que el usuario quiere mostrar en la app.
  final String displayName;

  /// El rol o cargo que tiene el usuario en el negocio (por ejemplo: Administrador o Cliente).
  /// Esto decide a qué pantallas tiene acceso en el menú principal.
  final UserRole role;

  /// Indica si el usuario ya verificó su correo electrónico haciendo clic en el enlace enviado por email.
  final bool isEmailVerified;

  /// La fecha y hora exacta en la que se creó esta cuenta de usuario.
  final DateTime createdAt;

  /// Indica si el usuario sigue activo en el sistema.
  /// Se usa false para "Soft Delete" (cuando el admin desactiva la cuenta).
  final bool isActive;

  const AppUser({
    required this.id,
    required this.firebaseUid,
    required this.email,
    required this.displayName,
    required this.role,
    required this.isEmailVerified,
    required this.createdAt,
    this.isActive = true,
  });
}

/// [UserRole] define las diferentes funciones u "oficios" que puede tener un usuario en el sistema.
/// Usamos un 'enum' porque es una lista cerrada de opciones, lo que evita errores de escritura (typos).
enum UserRole {
  /// Administrador: Tiene control total de la aplicación y el negocio.
  admin,

  /// Personal de la tienda: Atiende mascotas, gestiona productos, etc.
  staff,

  /// Cliente: Dueño de las mascotas que agenda citas y compra productos.
  client,

  /// Repartidor / Chofer: Encargado de llevar los pedidos a los clientes.
  driver;

  /// Esta función ayuda a convertir un texto simple (como "driver") que viene de la base de datos
  /// o de Firebase en una opción válida de nuestro listado.
  /// Si el texto no coincide con ninguno, por seguridad lo trata como un cliente normal.
  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (r) => r.name == value,
      orElse: () => UserRole.client,
    );
  }
}
