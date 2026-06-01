import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/auth/entities/auth_exception.dart';
import 'providers/auth_providers.dart';
import 'widgets/auth_primary_button.dart';
import 'widgets/auth_text_field.dart';

// PANTALLA DE RECUPERACIÓN DE CONTRASEÑA (FORGOT PASSWORD SCREEN)
// Permite al usuario solicitar un enlace seguro para restablecer su clave.
//
// Al igual que las anteriores, es reactiva y coordinada con Firebase.

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  // Controlador para leer el correo electrónico del campo de texto
  final _emailController = TextEditingController();
  // Llave global del formulario
  final _formKey = GlobalKey<FormState>();

  // Variables de Estado Interno
  bool _isLoading = false; // Círculo de carga
  String?
  _errorMessage; // Mensaje de error si la red falla o el correo no existe
  bool _isSuccess =
      false; // Controla si se pinta el letrero verde de "Correo enviado"

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  /// Función que procesa la petición de cambio de clave
  Future<void> _handleReset() async {
    // 1. Validamos que el correo tenga una estructura correcta
    if (!_formKey.currentState!.validate()) return;

    // 2. Encendemos el círculo de carga y reseteamos el estado visual
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _isSuccess = false;
    });

    try {
      // 3. Ejecutamos el Caso de Uso de recuperar contraseña
      await ref
          .read(forgotPasswordUseCaseProvider)
          .execute(_emailController.text.trim());

      // 4. Si fue correcto, marcamos éxito en pantalla para avisar al usuario
      setState(() => _isSuccess = true);
    } on AuthException catch (e) {
      // Capturamos si el correo no existe o si no hay señal
      setState(() => _errorMessage = e.message);
    } catch (e) {
      setState(
        () =>
            _errorMessage = 'Ocurrió un error inesperado al enviar el correo.',
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar contraseña')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),

                // Campo para ingresar el email
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
                const SizedBox(height: 24),

                // Letrero de error (contenedor rojo)
                if (_errorMessage != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                  ),

                // Letrero de éxito (Hermoso contenedor verde que da paz mental al usuario)
                if (_isSuccess)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Se ha enviado un correo con las instrucciones. Por favor, revisa tu bandeja de entrada o spam.',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),

                // Botón para iniciar el envío
                AuthPrimaryButton(
                  label: 'Enviar enlace',
                  isLoading: _isLoading,
                  onPressed: _handleReset,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
