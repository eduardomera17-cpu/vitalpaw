import 'package:flutter/material.dart';

// CAMPO DE TEXTO PERSONALIZADO (AUTH TEXT FIELD)
// Este es un campo de texto (caja de entrada de datos) diseñado con la estética de la app.
// Lo usamos para que el usuario escriba su correo, contraseña o nombre.
//
// Evita tener que copiar y pegar el mismo código visual repetitivo de cajas de texto
// en todos los formularios de autenticación.

class AuthTextField extends StatelessWidget {
  /// El controlador de texto que captura lo que escribe el usuario para mandarlo al código.
  final TextEditingController controller;

  /// El título o etiqueta flotante que describe el campo (ej. "Correo Electrónico").
  final String label;

  /// El icono ilustrativo que se dibuja al inicio de la caja (ej. un candado para contraseñas).
  final IconData prefixIcon;

  /// Un icono opcional al final de la caja (ej. el ojo para mostrar/ocultar contraseña).
  final Widget? suffixIcon;

  /// Indica si el texto debe ocultarse con puntos negros (para seguridad de contraseñas).
  final bool obscureText;

  /// Tipo de teclado que se abrirá en el teléfono (ej. teclado numérico o con tecla '@').
  final TextInputType keyboardType;

  /// El guardián o validador. Es una función que revisa si lo escrito cumple con las reglas
  /// (ej. verifica que el campo no esté vacío o que sea un correo válido).
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // 'TextFormField' es el widget de Flutter especializado en entradas de datos con validación
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      // 'InputDecoration' decora la caja de texto dándole forma y color
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon), // Icono izquierdo
        suffixIcon: suffixIcon, // Icono derecho (opcional)
        // Bordes de la caja con esquinas redondeadas elegantes
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true, // Relleno de color suave de fondo
      ),
    );
  }
}
