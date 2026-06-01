// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_dao.dart';

// ignore_for_file: type=lint
mixin _$PetsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $PetsTableTable get petsTable => attachedDatabase.petsTable;
  PetsDaoManager get managers => PetsDaoManager(this);
}

class PetsDaoManager {
  final _$PetsDaoMixin _db;
  PetsDaoManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db.attachedDatabase, _db.usersTable);
  $$PetsTableTableTableManager get petsTable =>
      $$PetsTableTableTableManager(_db.attachedDatabase, _db.petsTable);
}
