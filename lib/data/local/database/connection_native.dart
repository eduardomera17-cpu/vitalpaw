import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import '../../security/database_key_service.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    // Busca el directorio de documentos del celular (una carpeta protegida de nuestra app)
    final dbDir = await getApplicationDocumentsDirectory();
    // Creamos la ruta completa para el archivo de base de datos
    final file = File(p.join(dbDir.path, 'petshop.db'));
    
    // Obtenemos la llave maestra del Keystore de Android o Keychain de iOS
    final encryptionKey = await DatabaseKeyService.getMasterKey();

    // Abre la conexión en segundo plano e inyecta la llave maestra de cifrado
    return NativeDatabase.createInBackground(
      file,
      setup: (db) {
        // Encriptar / Desencriptar la base de datos usando SQLite3MultipleCiphers
        db.execute("PRAGMA cipher = 'sqlcipher';");
        db.execute("PRAGMA legacy = 4;");
        db.execute("PRAGMA key = '$encryptionKey';");
        // Asegurarse de que el modo WAL y demás siguen optimizados
        db.execute("PRAGMA journal_mode = WAL;");
      },
    );
  });
}
