// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_dao.dart';

// ignore_for_file: type=lint
mixin _$OrdersDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTableTable get usersTable => attachedDatabase.usersTable;
  $OrdersTableTable get ordersTable => attachedDatabase.ordersTable;
  $ProductsTableTable get productsTable => attachedDatabase.productsTable;
  $OrderItemsTableTable get orderItemsTable => attachedDatabase.orderItemsTable;
  OrdersDaoManager get managers => OrdersDaoManager(this);
}

class OrdersDaoManager {
  final _$OrdersDaoMixin _db;
  OrdersDaoManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db.attachedDatabase, _db.usersTable);
  $$OrdersTableTableTableManager get ordersTable =>
      $$OrdersTableTableTableManager(_db.attachedDatabase, _db.ordersTable);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db.attachedDatabase, _db.productsTable);
  $$OrderItemsTableTableTableManager get orderItemsTable =>
      $$OrderItemsTableTableTableManager(
        _db.attachedDatabase,
        _db.orderItemsTable,
      );
}
