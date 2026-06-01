import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import '../../../domain/auth/entities/app_user.dart';

// Este provider lee la colección de usuarios directamente desde Firestore
// Ya que es un panel de administrador online-first
final crmUsersProvider = StreamProvider.autoDispose<List<AppUser>>((ref) {
  return FirebaseFirestore.instance
      .collection('users')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return AppUser(
        id: doc.id,
        firebaseUid: data['firebaseUid'] ?? doc.id,
        email: data['email'] ?? '',
        displayName: data['displayName'] ?? '',
        role: UserRole.fromString(data['role'] ?? 'client'),
        isEmailVerified: data['isEmailVerified'] ?? false,
        createdAt: data['createdAt'] != null 
            ? (data['createdAt'] as Timestamp).toDate() 
            : DateTime.now(),
        isActive: data['isActive'] ?? true,
      );
    }).toList();
  });
});

final crmActionsProvider = Provider((ref) => CrmActions());

class CrmActions {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  Future<void> createUser({
    required String email,
    required String password,
    required String displayName,
    required String role,
  }) async {
    final callable = _functions.httpsCallable('adminCreateUser');
    await callable.call({
      'email': email,
      'password': password,
      'displayName': displayName,
      'role': role,
    });
  }

  Future<void> updateUser({
    required String uid,
    String? displayName,
    String? password,
    String? role,
  }) async {
    final callable = _functions.httpsCallable('adminUpdateUser');
    final payload = <String, dynamic>{'uid': uid};
    if (displayName != null && displayName.isNotEmpty) payload['displayName'] = displayName;
    if (password != null && password.isNotEmpty) payload['password'] = password;
    if (role != null && role.isNotEmpty) payload['role'] = role;
    
    await callable.call(payload);
  }

  Future<void> disableUser(String uid) async {
    final callable = _functions.httpsCallable('adminDisableUser');
    await callable.call({'uid': uid});
  }
}
