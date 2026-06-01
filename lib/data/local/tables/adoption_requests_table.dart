// lib/data/local/tables/adoption_requests_table.dart

import 'package:drift/drift.dart';
import 'users_table.dart';

class AdoptionRequestsTable extends Table {
  @override
  String get tableName => 'adoption_requests';

  TextColumn get id          => text()();
  TextColumn get listingId   => text()();
  TextColumn get animalName  => text()();
  TextColumn get clientId    => text().references(UsersTable, #id)();
  TextColumn get clientName  => text()();
  TextColumn get clientPhone => text()();
  TextColumn get clientEmail => text()();
  TextColumn get requestType => text()();  // 'sale' | 'adoption'
  TextColumn get message     => text().nullable()();
  TextColumn get status      => text().withDefault(const Constant('pending'))();
  TextColumn get adminNotes  => text().nullable()();

  DateTimeColumn get createdAt   => dateTime()();
  DateTimeColumn get updatedAt   => dateTime()();
  DateTimeColumn get deletedAt   => dateTime().nullable()();
  TextColumn     get syncStatus  => text().withDefault(const Constant('pending'))();
  IntColumn      get syncVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
