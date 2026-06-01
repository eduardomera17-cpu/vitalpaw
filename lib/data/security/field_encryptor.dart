import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'database_key_service.dart';
import 'dart:math';

/// Servicio para cifrar campos individuales en Firestore (Ej: mensajes médicos o de chat)
/// Utiliza AES-256 en modo GCM para evitar manipulación de datos (Authenticated Encryption).
class FieldEncryptor {
  static Future<String> encrypt(String plaintext) async {
    if (plaintext.isEmpty) return plaintext;
    
    final masterKeyHex = await DatabaseKeyService.getMasterKey();
    // Tomar solo 32 bytes (64 caracteres hex) de la llave por si acaso es más larga
    final keyBytes = _hexToBytes(masterKeyHex.substring(0, 64));

    // AES-GCM requiere un nonce único (IV) de 12 bytes por cada cifrado
    final nonce = _generateNonce();
    
    final cipher = GCMBlockCipher(AESEngine())
      ..init(
        true, // Cifrar
        AEADParameters(
          KeyParameter(keyBytes),
          128, // Mac Size
          nonce,
          Uint8List(0), // Additional Auth Data vacía
        ),
      );

    final plainBytes = utf8.encode(plaintext);
    final cipherText = cipher.process(Uint8List.fromList(plainBytes));

    // Concatenamos el nonce y el ciphertext para poder descifrar después,
    // y lo codificamos en Base64 para guardarlo como String en Firestore.
    final result = BytesBuilder()
      ..add(nonce)
      ..add(cipherText);

    return base64Encode(result.toBytes());
  }

  static Future<String> decrypt(String ciphertextBase64) async {
    if (ciphertextBase64.isEmpty) return ciphertextBase64;
    
    try {
      final encryptedBytes = base64Decode(ciphertextBase64);
      // El nonce son los primeros 12 bytes
      final nonce = encryptedBytes.sublist(0, 12);
      final cipherText = encryptedBytes.sublist(12);

      final masterKeyHex = await DatabaseKeyService.getMasterKey();
      final keyBytes = _hexToBytes(masterKeyHex.substring(0, 64));

      final cipher = GCMBlockCipher(AESEngine())
        ..init(
          false, // Descifrar
          AEADParameters(
            KeyParameter(keyBytes),
            128,
            nonce,
            Uint8List(0),
          ),
        );

      final plainBytes = cipher.process(cipherText);
      return utf8.decode(plainBytes);
    } catch (e) {
      // Si falla, significa que no estaba encriptado o la llave no coincide.
      // Podríamos retornar el texto original si fue antes del cifrado,
      // pero por seguridad retornamos un mensaje de error genérico u original
      return "Contenido no disponible o clave incorrecta";
    }
  }

  static Uint8List _generateNonce() {
    final random = Random.secure();
    final nonce = Uint8List(12);
    for (int i = 0; i < 12; i++) {
      nonce[i] = random.nextInt(256);
    }
    return nonce;
  }

  static Uint8List _hexToBytes(String hex) {
    final result = Uint8List(hex.length ~/ 2);
    for (int i = 0; i < hex.length; i += 2) {
      final num = int.parse(hex.substring(i, i + 2), radix: 16);
      result[i ~/ 2] = num;
    }
    return result;
  }
}
