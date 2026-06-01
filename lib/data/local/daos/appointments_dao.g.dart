// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_dao.dart';

// ignore_for_file: type=lint
mixin _$AppointmentsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $PetsTableTable get petsTable => attachedDatabase.petsTable;
  $AppointmentsTableTable get appointmentsTable =>
      attachedDatabase.appointmentsTable;
  AppointmentsDaoManager get managers => AppointmentsDaoManager(this);
}

class AppointmentsDaoManager {
  final _$AppointmentsDaoMixin _db;
  AppointmentsDaoManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db.attachedDatabase, _db.usersTable);
  $$PetsTableTableTableManager get petsTable =>
      $$PetsTableTableTableManager(_db.attachedDatabase, _db.petsTable);
  $$AppointmentsTableTableTableManager get appointmentsTable =>
      $$AppointmentsTableTableTableManager(
        _db.attachedDatabase,
        _db.appointmentsTable,
      );
}
