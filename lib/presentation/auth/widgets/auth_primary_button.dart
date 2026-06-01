import 'package:flutter/material.dart';

// BOTÓN PRINCIPAL DE ACCIÓN (AUTH PRIMARY BUTTON)
// Este es un botón visualmente personalizado que reutilizamos en las pantallas
// de Login, Registro y Recuperación de clave.
//
// Nos ayuda a mantener la app homogénea (mismos bordes redondeados y estilo)
// y maneja de forma inteligente el estado de "Cargando" (Loading).

class AuthPrimaryButton extends StatelessWidget {
  /// El texto que se mostrará dentro del botón (ej. "Iniciar Sesión").
  final String label;

  /// La función o acción que se ejecutará cuando el usuario haga clic en el botón.
  final VoidCallback onPressed;

  /// Indica si la aplicación está procesando algo en internet (por defecto falso).
  /// Si es verdadero, el botón se deshabilita y dibuja un indicador de carga.
  final bool isLoading;

  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    // 'FilledButton' es un botón clásico relleno del tema de Material Design
    return FilledButton(
      // Si está cargando, deshabilitamos el clic ('null') para evitar clics duplicados molestos
      onPressed: isLoading ? null : onPressed,
      style: FilledButton.styleFrom(
        // Relleno interno para hacerlo más alto y cómodo para tocar con el dedo
        padding: const EdgeInsets.symmetric(vertical: 16),
        // Bordes redondeados elegantes de 12px
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      // Si está cargando, dibujamos un circulito de carga; de lo contrario, mostramos el texto
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2, // Grosor delgado de la línea de carga
              ),
            )
          : Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
    );
  }
}
