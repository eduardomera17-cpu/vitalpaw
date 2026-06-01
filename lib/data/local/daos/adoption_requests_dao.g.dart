// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_requests_dao.dart';

// ignore_for_file: type=lint
mixin _$AdoptionRequestsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $AdoptionRequestsTableTable get adoptionRequestsTable =>
      attachedDatabase.adoptionRequestsTable;
  AdoptionRequestsDaoManager get managers => AdoptionRequestsDaoManager(this);
}

class AdoptionRequestsDaoManager {
  final _$AdoptionRequestsDaoMixin _db;
  AdoptionRequestsDaoManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db.attachedDatabase, _db.usersTable);
  $$AdoptionRequestsTableTableTableManager get adoptionRequestsTable =>
      $$AdoptionRequestsTableTableTableManager(
        _db.attachedDatabase,
        _db.adoptionRequestsTable,
      );
}
