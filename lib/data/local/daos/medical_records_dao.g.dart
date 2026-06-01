// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_records_dao.dart';

// ignore_for_file: type=lint
mixin _$MedicalRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $PetsTableTable get petsTable => attachedDatabase.petsTable;
  $MedicalRecordsTableTable get medicalRecordsTable =>
      attachedDatabase.medicalRecordsTable;
  MedicalRecordsDaoManager get managers => MedicalRecordsDaoManager(this);
}

class MedicalRecordsDaoManager {
  final _$MedicalRecordsDaoMixin _db;
  MedicalRecordsDaoManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db.attachedDatabase, _db.usersTable);
  $$PetsTableTableTableManager get petsTable =>
      $$PetsTableTableTableManager(_db.attachedDatabase, _db.petsTable);
  $$MedicalRecordsTableTableTableManager get medicalRecordsTable =>
      $$MedicalRecordsTableTableTableManager(
        _db.attachedDatabase,
        _db.medicalRecordsTable,
      );
}
