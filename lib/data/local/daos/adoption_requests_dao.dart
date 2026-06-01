// lib/data/local/daos/adoption_requests_dao.dart

import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/adoption_requests_table.dart';

part 'adoption_requests_dao.g.dart';

@DriftAccessor(tables: [AdoptionRequestsTable])
class AdoptionRequestsDao extends DatabaseAccessor<AppDatabase> with _$AdoptionRequestsDaoMixin {
  AdoptionRequestsDao(super.db);

  Stream<List<AdoptionRequestsTableData>> watchByClient(String clientId) {
    return (select(adoptionRequestsTable)
          ..where((t) => t.clientId.equals(clientId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  Stream<List<AdoptionRequestsTableData>> watchPending() {
    return (select(adoptionRequestsTable)
          ..where((t) => t.status.equals('pending'))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  Future<void> insertRequest(Insertable<AdoptionRequestsTableData> request) {
    return into(adoptionRequestsTable).insert(request, mode: InsertMode.replace);
  }

  Future<void> updateStatus({
    required String requestId,
    required String status,
    String? adminNotes,
  }) {
    return (update(adoptionRequestsTable)..where((t) => t.id.equals(requestId))).write(
      AdoptionRequestsTableCompanion(
        status: Value(status),
        adminNotes: adminNotes == null ? const Value.absent() : Value(adminNotes),
        updatedAt: Value(DateTime.now()),
        syncStatus: const Value('pending'),
      ),
    );
  }
}
