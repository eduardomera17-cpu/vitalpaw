// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_tracks_dao.dart';

// ignore_for_file: type=lint
mixin _$LocationTracksDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $OrdersTableTable get ordersTable => attachedDatabase.ordersTable;
  $LocationTracksTableTable get locationTracksTable =>
      attachedDatabase.locationTracksTable;
  LocationTracksDaoManager get managers => LocationTracksDaoManager(this);
}

class LocationTracksDaoManager {
  final _$LocationTracksDaoMixin _db;
  LocationTracksDaoManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db.attachedDatabase, _db.usersTable);
  $$OrdersTableTableTableManager get ordersTable =>
      $$OrdersTableTableTableManager(_db.attachedDatabase, _db.ordersTable);
  $$LocationTracksTableTableTableManager get locationTracksTable =>
      $$LocationTracksTableTableTableManager(
        _db.attachedDatabase,
        _db.locationTracksTable,
      );
}
