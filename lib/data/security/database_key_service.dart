import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'dart:math';
import 'dart:typed_data';

/// Servicio responsable de generar y custodiar de forma segura la clave maestra 
/// para el cifrado AES-256 (SQLCipher y cifrado de campos de Firestore).
class DatabaseKeyService {
  static const _storage = FlutterSecureStorage();
  static const _dbKeyName = 'petshop_sqlcipher_master_key';

  /// Obtiene la clave maestra del Android Keystore / iOS Keychain.
  /// Si no existe, la genera por primera vez con entropía fuerte.
  static Future<String> getMasterKey() async {
    // Intentar leer la llave
    var key = await _storage.read(key: _dbKeyName);
    
    // Si la llave no existe, la generamos
    if (key == null) {
      key = _generateSecureRandomKey();
      await _storage.write(key: _dbKeyName, value: key);
    }
    
    return key;
  }

  /// Genera una cadena aleatoria de 32 bytes en formato Hex (para AES-256)
  static String _generateSecureRandomKey() {
    final secureRandom = FortunaRandom();
    
    // Generar la semilla aleatoria real del SO
    final seed = Uint8List(32);
    final random = Random.secure();
    for (int i = 0; i < 32; i++) {
      seed[i] = random.nextInt(256);
    }
    
    secureRandom.seed(KeyParameter(seed));
    
    final keyBytes = secureRandom.nextBytes(32);
    return keyBytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }
}
