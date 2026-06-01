import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/auth/entities/app_user.dart';
import '../../../domain/auth/entities/auth_exception.dart';
import 'providers/auth_providers.dart';
import 'widgets/auth_primary_button.dart';
import 'widgets/auth_text_field.dart';

// PANTALLA DE INICIO DE SESIÓN (LOGIN SCREEN)
// Esta es la pantalla principal donde cualquier empleado o cliente ingresa sus datos
// para acceder a la aplicación.
//
// Usamos 'ConsumerStatefulWidget' porque esta pantalla necesita recordar variables internas
// (como si el usuario hizo clic en "Ver contraseña" o si el sistema está cargando)
// y a la vez leer los proveedores de datos (Providers) de Riverpod.

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // CONTROLADORES DE TEXTO: Recogen lo que el usuario escribe en las cajas de texto en tiempo real.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Llave global para validar todo el formulario (cajas de texto) al mismo tiempo
  final _formKey = GlobalKey<FormState>();

  // Variables de Estado Interno
  bool _obscurePassword = true; // Controla si se oculta la clave con bolitas
  bool _isLoading = false; // Controla si se muestra el circulito de carga
  String? _errorMessage; // Almacena el mensaje traducido si algo sale mal

  // 'dispose' es el destructor. Libera la memoria del teléfono borrando los controladores
  // cuando el usuario cambia de pantalla para evitar lentitud en el celular.
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Función que procesa el intento de inicio de sesión al hacer clic en el botón.
  Future<void> _handleLogin() async {
    // 1. Validamos que las cajas de texto cumplan con sus reglas (que no estén vacías, etc.)
    if (!_formKey.currentState!.validate()) return;

    // 2. Encendemos el estado de carga y limpiamos errores anteriores en pantalla
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // 3. Ejecutamos el Caso de Uso inyectado desde Riverpod pasándole el correo y clave
      final user = await ref
          .read(signInUseCaseProvider)
          .execute(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );

      // Si el usuario cambió de pantalla antes de que terminara la petición, detenemos el proceso
      if (!mounted) return;

      // 4. Redirigimos al usuario a su panel correspondiente según sea Admin, Repartidor o Cliente
      _redirectByRole(user.role);
    } on AuthException catch (e) {
      // Si ocurre un error traducido (clave incorrecta, sin internet), lo mostramos en pantalla
      setState(() => _errorMessage = e.message);
    } catch (e) {
      debugPrint('LOGIN ERROR: $e');
      setState(
        () =>
            _errorMessage = 'Ocurrió un error inesperado al intentar acceder.',
      );
    } finally {
      // Al terminar (haya sido éxito o fallo), apagamos el circulito de carga para desbloquear el botón
      if (mounted) setState(() => _isLoading = false);
    }
  }

  /// Decide a qué pantalla mandar al usuario según el Rol que tenga guardado en su perfil.
  void _redirectByRole(UserRole role) {
    final router = GoRouter.of(context);
    switch (role) {
      // Si es Admin o Staff, lo mandamos al panel administrativo
      case UserRole.admin:
      case UserRole.staff:
        router.go('/dashboard');
        break;
      // Si es Cliente, lo mandamos a la tienda principal
      case UserRole.client:
        router.go('/home');
        break;
      // Si es Chofer/Repartidor, lo mandamos a sus entregas
      case UserRole.driver:
        router.go('/delivery');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        // 'SafeArea' evita que el contenido se dibuje encima del notch o cámara del teléfono
        child: Center(
          child: SingleChildScrollView(
            // 'SingleChildScrollView' permite hacer scroll si la pantalla es muy pequeña
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: _formKey, // Conectamos nuestra llave validadora
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  // Logotipo visual de la veterinaria (Icono de patita)
                  Icon(
                    Icons.pets,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pet Shop',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Inicia sesión para continuar',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Caja de entrada para el correo electrónico o nombre de usuario
                  AuthTextField(
                    controller: _emailController,
                    label: 'Correo o Usuario',
                    prefixIcon: Icons.person_outline,
                    keyboardType: TextInputType.text,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Ingresa tu correo o usuario';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Caja de entrada para la contraseña
                  AuthTextField(
                    controller: _passwordController,
                    label: 'Contraseña',
                    prefixIcon: Icons.lock_outline,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      // Alterna ocultar o mostrar la clave
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty)
                        return 'Ingresa tu contraseña';
                      if (v.length < 6)
                        return 'La contraseña debe tener mínimo 6 letras';
                      return null;
                    },
                  ),

                  // Enlace para recuperar contraseña olvidada
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push('/forgot-password'),
                      child: const Text('¿Olvidaste tu contraseña?'),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Si hay un mensaje de error, dibujamos un contenedor rojo amigable
                  if (_errorMessage != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Theme.of(
                              context,
                            ).colorScheme.onErrorContainer,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onErrorContainer,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Botón de confirmación principal
                  AuthPrimaryButton(
                    label: 'Iniciar sesión',
                    isLoading: _isLoading,
                    onPressed: _handleLogin,
                  ),
                  const SizedBox(height: 20),

                  // Enlace para ir al registro
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes cuenta? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () => context.push('/register'),
                        child: const Text('Regístrate'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
