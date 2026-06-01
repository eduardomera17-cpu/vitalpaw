import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/auth/entities/auth_exception.dart';
import 'providers/auth_providers.dart';
import 'widgets/auth_primary_button.dart';
import 'widgets/auth_text_field.dart';

// PANTALLA DE REGISTRO DE CUENTAS (REGISTER SCREEN)
// Permite que nuevos clientes se registren completando un formulario sencillo.
//
// Al igual que el Login, usa 'ConsumerStatefulWidget' para recordar los textos escritos
// y los estados de carga temporales.

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  // CONTROLADORES DE TEXTO: Recogen los datos de entrada
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Llave global del formulario para ejecutar todas las validaciones juntas
  final _formKey = GlobalKey<FormState>();

  // Variables de Estado Interno
  bool _obscurePassword = true; // Ocultar contraseña
  bool _obscureConfirmPassword = true; // Ocultar confirmación de contraseña
  bool _isLoading = false; // Círculo de carga
  String? _errorMessage; // Letrero de error traducido

  // 'dispose' destruye los controladores para liberar la memoria del teléfono al cerrar la pantalla
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// Función que procesa el registro del nuevo cliente
  Future<void> _handleRegister() async {
    // 1. Validamos que no falte ningún dato y que las contraseñas coincidan
    if (!_formKey.currentState!.validate()) return;

    // 2. Encendemos el círculo de carga y limpiamos viejos errores
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // 3. Ejecutamos el Caso de Uso de Registro enviando los datos a Firebase y SQLite local
      await ref
          .read(signUpUseCaseProvider)
          .execute(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            displayName: _nameController.text.trim(),
          );

      if (!mounted) return;

      // 4. Al ser un nuevo registro, por defecto se le asigna rol de cliente normal,
      // por lo que lo redirigimos directo al Home de compras.
      context.go('/home');
    } on AuthException catch (e) {
      // Captura de errores de Firebase traducidos en español (ej. "correo ya registrado")
      setState(() => _errorMessage = e.message);
    } catch (e) {
      setState(
        () => _errorMessage =
            'Ocurrió un error inesperado al registrar tu cuenta.',
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('Crear cuenta'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Entrada del nombre del cliente
                AuthTextField(
                  controller: _nameController,
                  label: 'Nombre completo',
                  prefixIcon: Icons.person_outline,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Ingresa tu nombre';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Entrada del correo
                AuthTextField(
                  controller: _emailController,
                  label: 'Correo electrónico',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Ingresa tu correo';
                    if (!v.contains('@')) return 'El correo debe tener una @';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Entrada de la contraseña
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
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Ingresa tu contraseña';
                    if (v.length < 6)
                      return 'La contraseña debe tener al menos 6 letras';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Entrada para re-escribir la contraseña (Confirmación de seguridad)
                AuthTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirmar contraseña',
                  prefixIcon: Icons.lock_outline,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Confirma tu contraseña';
                    // REGLA DE COINCIDENCIA: Compara con la contraseña del primer campo
                    if (v != _passwordController.text)
                      return 'Las contraseñas no coinciden';
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Si hay error de Firebase, pintamos la barra roja
                if (_errorMessage != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).colorScheme.onErrorContainer,
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

                // Botón de confirmación para disparar el registro
                AuthPrimaryButton(
                  label: 'Registrarse',
                  isLoading: _isLoading,
                  onPressed: _handleRegister,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
