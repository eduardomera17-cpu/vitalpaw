// lib/data/local/database/connection_web.dart
import 'package:drift/drift.dart';
import 'package:drift/web.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final storage = await DriftWebStorage.indexedDbIfSupported('petshop_db');
    return WebDatabase.withStorage(storage, logStatements: true);
  });
}
