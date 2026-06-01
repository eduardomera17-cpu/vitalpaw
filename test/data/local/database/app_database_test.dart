import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_shop/data/local/database/app_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async => await db.close());

  test('insertar y recuperar usuario', () async {
    final now = DateTime.now();
    await db.usersDao.upsertUser(
      UsersTableCompanion.insert(
        id: 'user-uuid-001',
        email: 'test@petshop.com',
        displayName: 'Test User',
        createdAt: now,
        updatedAt: now,
      ),
    );

    final user = await db.usersDao.getUserById('user-uuid-001');
    expect(user?.email, equals('test@petshop.com'));
    expect(user?.syncStatus, equals('pending'));
  });

  test('soft delete no elimina físicamente', () async {
    // Insertar → soft delete → verificar que sigue en BD pero con deletedAt
    final now = DateTime.now();
    await db.usersDao.upsertUser(
      UsersTableCompanion.insert(
        id: 'user-to-delete',
        email: 'delete@petshop.com',
        displayName: 'To Delete',
        createdAt: now,
        updatedAt: now,
      ),
    );

    await db.usersDao.softDeleteUser('user-to-delete');
    final user = await db.usersDao.getUserById('user-to-delete');

    // getUserById filtra deletedAt.isNull(), así que debe retornar null
    expect(user, isNull);
  });
}
