// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firebaseUidMeta = const VerificationMeta(
    'firebaseUid',
  );
  @override
  late final GeneratedColumn<String> firebaseUid = GeneratedColumn<String>(
    'firebase_uid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoUrlMeta = const VerificationMeta(
    'photoUrl',
  );
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
    'photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('client'),
  );
  static const VerificationMeta _isEmailVerifiedMeta = const VerificationMeta(
    'isEmailVerified',
  );
  @override
  late final GeneratedColumn<bool> isEmailVerified = GeneratedColumn<bool>(
    'is_email_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_email_verified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    firebaseUid,
    email,
    displayName,
    photoUrl,
    role,
    isEmailVerified,
    isActive,
    phoneNumber,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('firebase_uid')) {
      context.handle(
        _firebaseUidMeta,
        firebaseUid.isAcceptableOrUnknown(
          data['firebase_uid']!,
          _firebaseUidMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('photo_url')) {
      context.handle(
        _photoUrlMeta,
        photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('is_email_verified')) {
      context.handle(
        _isEmailVerifiedMeta,
        isEmailVerified.isAcceptableOrUnknown(
          data['is_email_verified']!,
          _isEmailVerifiedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      firebaseUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_uid'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      photoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_url'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      isEmailVerified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_email_verified'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  /// Identificador único del usuario (usamos UUID, un texto largo único generado localmente).
  final String id;

  /// El código identificador que Firebase le asigna a este usuario en la nube (puede ser nulo).
  final String? firebaseUid;

  /// Correo electrónico único del usuario. No puede haber dos usuarios con el mismo correo.
  final String email;

  /// El nombre completo del usuario para mostrar en la interfaz.
  final String displayName;

  /// Enlace o URL de la foto de perfil del usuario (opcional).
  final String? photoUrl;

  /// El rol del usuario dentro de la tienda (por defecto es 'client').
  /// Los valores posibles son: 'admin' (administrador), 'staff' (vendedor/veterinario),
  /// 'client' (dueño de mascota) o 'driver' (repartidor).
  final String role;

  /// Indica si el usuario ya validó su correo electrónico (por defecto es falso).
  final bool isEmailVerified;

  /// Indica si el usuario está activo (por defecto es verdadero).
  final bool isActive;

  /// Número telefónico de contacto del usuario (opcional).
  final String? phoneNumber;

  /// Fecha y hora exacta de creación del usuario.
  final DateTime createdAt;

  /// Fecha y hora de la última modificación de los datos. Ayuda a saber qué dato es más reciente.
  final DateTime updatedAt;

  /// Fecha de eliminación lógica. Si el usuario "se borra", en realidad guardamos aquí la fecha
  /// en lugar de borrar la fila de inmediato, para poder avisarle al servidor que debe borrarlo también.
  final DateTime? deletedAt;

  /// Estado de sincronización actual. Valores posibles:
  /// - 'pending': El dato se creó/editó sin internet y está esperando ser subido al servidor.
  /// - 'synced': El dato ya está perfectamente guardado y actualizado tanto en el teléfono como en internet.
  final String syncStatus;

  /// El número de versión del registro. Cada vez que se actualiza en internet, aumenta en 1.
  /// Evita que datos viejos del teléfono sobrescriban datos nuevos del servidor (Estrategia LWW).
  final int syncVersion;
  const UsersTableData({
    required this.id,
    this.firebaseUid,
    required this.email,
    required this.displayName,
    this.photoUrl,
    required this.role,
    required this.isEmailVerified,
    required this.isActive,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || firebaseUid != null) {
      map['firebase_uid'] = Variable<String>(firebaseUid);
    }
    map['email'] = Variable<String>(email);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    map['role'] = Variable<String>(role);
    map['is_email_verified'] = Variable<bool>(isEmailVerified);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      firebaseUid: firebaseUid == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseUid),
      email: Value(email),
      displayName: Value(displayName),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      role: Value(role),
      isEmailVerified: Value(isEmailVerified),
      isActive: Value(isActive),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory UsersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      id: serializer.fromJson<String>(json['id']),
      firebaseUid: serializer.fromJson<String?>(json['firebaseUid']),
      email: serializer.fromJson<String>(json['email']),
      displayName: serializer.fromJson<String>(json['displayName']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      role: serializer.fromJson<String>(json['role']),
      isEmailVerified: serializer.fromJson<bool>(json['isEmailVerified']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'firebaseUid': serializer.toJson<String?>(firebaseUid),
      'email': serializer.toJson<String>(email),
      'displayName': serializer.toJson<String>(displayName),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'role': serializer.toJson<String>(role),
      'isEmailVerified': serializer.toJson<bool>(isEmailVerified),
      'isActive': serializer.toJson<bool>(isActive),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  UsersTableData copyWith({
    String? id,
    Value<String?> firebaseUid = const Value.absent(),
    String? email,
    String? displayName,
    Value<String?> photoUrl = const Value.absent(),
    String? role,
    bool? isEmailVerified,
    bool? isActive,
    Value<String?> phoneNumber = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => UsersTableData(
    id: id ?? this.id,
    firebaseUid: firebaseUid.present ? firebaseUid.value : this.firebaseUid,
    email: email ?? this.email,
    displayName: displayName ?? this.displayName,
    photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
    role: role ?? this.role,
    isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    isActive: isActive ?? this.isActive,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      id: data.id.present ? data.id.value : this.id,
      firebaseUid: data.firebaseUid.present
          ? data.firebaseUid.value
          : this.firebaseUid,
      email: data.email.present ? data.email.value : this.email,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      role: data.role.present ? data.role.value : this.role,
      isEmailVerified: data.isEmailVerified.present
          ? data.isEmailVerified.value
          : this.isEmailVerified,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('role: $role, ')
          ..write('isEmailVerified: $isEmailVerified, ')
          ..write('isActive: $isActive, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    firebaseUid,
    email,
    displayName,
    photoUrl,
    role,
    isEmailVerified,
    isActive,
    phoneNumber,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.id == this.id &&
          other.firebaseUid == this.firebaseUid &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.photoUrl == this.photoUrl &&
          other.role == this.role &&
          other.isEmailVerified == this.isEmailVerified &&
          other.isActive == this.isActive &&
          other.phoneNumber == this.phoneNumber &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<String> id;
  final Value<String?> firebaseUid;
  final Value<String> email;
  final Value<String> displayName;
  final Value<String?> photoUrl;
  final Value<String> role;
  final Value<bool> isEmailVerified;
  final Value<bool> isActive;
  final Value<String?> phoneNumber;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.firebaseUid = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.role = const Value.absent(),
    this.isEmailVerified = const Value.absent(),
    this.isActive = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersTableCompanion.insert({
    required String id,
    this.firebaseUid = const Value.absent(),
    required String email,
    required String displayName,
    this.photoUrl = const Value.absent(),
    this.role = const Value.absent(),
    this.isEmailVerified = const Value.absent(),
    this.isActive = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       email = Value(email),
       displayName = Value(displayName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<UsersTableData> custom({
    Expression<String>? id,
    Expression<String>? firebaseUid,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<String>? photoUrl,
    Expression<String>? role,
    Expression<bool>? isEmailVerified,
    Expression<bool>? isActive,
    Expression<String>? phoneNumber,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (role != null) 'role': role,
      if (isEmailVerified != null) 'is_email_verified': isEmailVerified,
      if (isActive != null) 'is_active': isActive,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? firebaseUid,
    Value<String>? email,
    Value<String>? displayName,
    Value<String?>? photoUrl,
    Value<String>? role,
    Value<bool>? isEmailVerified,
    Value<bool>? isActive,
    Value<String?>? phoneNumber,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return UsersTableCompanion(
      id: id ?? this.id,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isActive: isActive ?? this.isActive,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (firebaseUid.present) {
      map['firebase_uid'] = Variable<String>(firebaseUid.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (isEmailVerified.present) {
      map['is_email_verified'] = Variable<bool>(isEmailVerified.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('role: $role, ')
          ..write('isEmailVerified: $isEmailVerified, ')
          ..write('isActive: $isActive, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PetsTableTable extends PetsTable
    with TableInfo<$PetsTableTable, PetsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorDescMeta = const VerificationMeta(
    'colorDesc',
  );
  @override
  late final GeneratedColumn<String> colorDesc = GeneratedColumn<String>(
    'color_desc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isNeuteredMeta = const VerificationMeta(
    'isNeutered',
  );
  @override
  late final GeneratedColumn<bool> isNeutered = GeneratedColumn<bool>(
    'is_neutered',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_neutered" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isForSaleMeta = const VerificationMeta(
    'isForSale',
  );
  @override
  late final GeneratedColumn<bool> isForSale = GeneratedColumn<bool>(
    'is_for_sale',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_for_sale" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isForAdoptionMeta = const VerificationMeta(
    'isForAdoption',
  );
  @override
  late final GeneratedColumn<bool> isForAdoption = GeneratedColumn<bool>(
    'is_for_adoption',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_for_adoption" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _salePriceMeta = const VerificationMeta(
    'salePrice',
  );
  @override
  late final GeneratedColumn<double> salePrice = GeneratedColumn<double>(
    'sale_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoLocalPathMeta = const VerificationMeta(
    'photoLocalPath',
  );
  @override
  late final GeneratedColumn<String> photoLocalPath = GeneratedColumn<String>(
    'photo_local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoRemoteUrlMeta = const VerificationMeta(
    'photoRemoteUrl',
  );
  @override
  late final GeneratedColumn<String> photoRemoteUrl = GeneratedColumn<String>(
    'photo_remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerId,
    name,
    species,
    breed,
    gender,
    birthDate,
    weightKg,
    colorDesc,
    isNeutered,
    isForSale,
    isForAdoption,
    salePrice,
    photoLocalPath,
    photoRemoteUrl,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pets';
  @override
  VerificationContext validateIntegrity(
    Insertable<PetsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('color_desc')) {
      context.handle(
        _colorDescMeta,
        colorDesc.isAcceptableOrUnknown(data['color_desc']!, _colorDescMeta),
      );
    }
    if (data.containsKey('is_neutered')) {
      context.handle(
        _isNeuteredMeta,
        isNeutered.isAcceptableOrUnknown(data['is_neutered']!, _isNeuteredMeta),
      );
    }
    if (data.containsKey('is_for_sale')) {
      context.handle(
        _isForSaleMeta,
        isForSale.isAcceptableOrUnknown(data['is_for_sale']!, _isForSaleMeta),
      );
    }
    if (data.containsKey('is_for_adoption')) {
      context.handle(
        _isForAdoptionMeta,
        isForAdoption.isAcceptableOrUnknown(
          data['is_for_adoption']!,
          _isForAdoptionMeta,
        ),
      );
    }
    if (data.containsKey('sale_price')) {
      context.handle(
        _salePriceMeta,
        salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta),
      );
    }
    if (data.containsKey('photo_local_path')) {
      context.handle(
        _photoLocalPathMeta,
        photoLocalPath.isAcceptableOrUnknown(
          data['photo_local_path']!,
          _photoLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('photo_remote_url')) {
      context.handle(
        _photoRemoteUrlMeta,
        photoRemoteUrl.isAcceptableOrUnknown(
          data['photo_remote_url']!,
          _photoRemoteUrlMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PetsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PetsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      )!,
      breed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      colorDesc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_desc'],
      ),
      isNeutered: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_neutered'],
      )!,
      isForSale: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_for_sale'],
      )!,
      isForAdoption: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_for_adoption'],
      )!,
      salePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sale_price'],
      ),
      photoLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_local_path'],
      ),
      photoRemoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_remote_url'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $PetsTableTable createAlias(String alias) {
    return $PetsTableTable(attachedDatabase, alias);
  }
}

class PetsTableData extends DataClass implements Insertable<PetsTableData> {
  /// Identificador único de la mascota (UUID largo generado en el teléfono).
  final String id;

  /// Identificador del dueño de la mascota.
  /// '.references(UsersTable, #id)' crea una RELACIÓN (llave foránea).
  /// Esto le dice a la base de datos: "Esta mascota obligatoriamente pertenece a un usuario que existe en 'UsersTable'".
  final String ownerId;

  /// Nombre de la mascota (ej. "Toby", "Luna").
  final String name;

  /// Especie de la mascota.
  /// Valores típicos: 'dog' (perro), 'cat' (gato), 'bird' (ave), 'rabbit' (conejo), 'fish' (pez), 'other' (otro).
  final String species;

  /// Raza de la mascota (ej. "Husky", "Persa") - opcional.
  final String? breed;

  /// Género de la mascota.
  /// Valores: 'male' (macho), 'female' (hembra), 'unknown' (desconocido) - opcional.
  final String? gender;

  /// Fecha de nacimiento de la mascota (ayuda a calcular la edad exacta en las consultas).
  final DateTime? birthDate;

  /// Peso en kilogramos de la mascota (valor decimal).
  final double? weightKg;

  /// Color o marcas particulares de la mascota para identificarla.
  final String? colorDesc;

  /// ¿La mascota está esterilizada/castrada? (por defecto es falso).
  final bool isNeutered;

  /// ¿La mascota está a la venta? (por si la tienda tiene cachorritos autorizados).
  final bool isForSale;

  /// ¿La mascota está disponible para adopción gratuita?
  final bool isForAdoption;

  /// Precio de venta (si aplica).
  final double? salePrice;

  /// Ruta donde se guarda la foto temporalmente en la memoria del celular.
  final String? photoLocalPath;

  /// Enlace de internet donde se guarda la foto de forma permanente en la nube (Firebase Storage).
  final String? photoRemoteUrl;

  /// Notas adicionales del veterinario o del dueño (alergias, comportamientos).
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final int syncVersion;
  const PetsTableData({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.species,
    this.breed,
    this.gender,
    this.birthDate,
    this.weightKg,
    this.colorDesc,
    required this.isNeutered,
    required this.isForSale,
    required this.isForAdoption,
    this.salePrice,
    this.photoLocalPath,
    this.photoRemoteUrl,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_id'] = Variable<String>(ownerId);
    map['name'] = Variable<String>(name);
    map['species'] = Variable<String>(species);
    if (!nullToAbsent || breed != null) {
      map['breed'] = Variable<String>(breed);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || colorDesc != null) {
      map['color_desc'] = Variable<String>(colorDesc);
    }
    map['is_neutered'] = Variable<bool>(isNeutered);
    map['is_for_sale'] = Variable<bool>(isForSale);
    map['is_for_adoption'] = Variable<bool>(isForAdoption);
    if (!nullToAbsent || salePrice != null) {
      map['sale_price'] = Variable<double>(salePrice);
    }
    if (!nullToAbsent || photoLocalPath != null) {
      map['photo_local_path'] = Variable<String>(photoLocalPath);
    }
    if (!nullToAbsent || photoRemoteUrl != null) {
      map['photo_remote_url'] = Variable<String>(photoRemoteUrl);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  PetsTableCompanion toCompanion(bool nullToAbsent) {
    return PetsTableCompanion(
      id: Value(id),
      ownerId: Value(ownerId),
      name: Value(name),
      species: Value(species),
      breed: breed == null && nullToAbsent
          ? const Value.absent()
          : Value(breed),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      colorDesc: colorDesc == null && nullToAbsent
          ? const Value.absent()
          : Value(colorDesc),
      isNeutered: Value(isNeutered),
      isForSale: Value(isForSale),
      isForAdoption: Value(isForAdoption),
      salePrice: salePrice == null && nullToAbsent
          ? const Value.absent()
          : Value(salePrice),
      photoLocalPath: photoLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoLocalPath),
      photoRemoteUrl: photoRemoteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoRemoteUrl),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory PetsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PetsTableData(
      id: serializer.fromJson<String>(json['id']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      name: serializer.fromJson<String>(json['name']),
      species: serializer.fromJson<String>(json['species']),
      breed: serializer.fromJson<String?>(json['breed']),
      gender: serializer.fromJson<String?>(json['gender']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      colorDesc: serializer.fromJson<String?>(json['colorDesc']),
      isNeutered: serializer.fromJson<bool>(json['isNeutered']),
      isForSale: serializer.fromJson<bool>(json['isForSale']),
      isForAdoption: serializer.fromJson<bool>(json['isForAdoption']),
      salePrice: serializer.fromJson<double?>(json['salePrice']),
      photoLocalPath: serializer.fromJson<String?>(json['photoLocalPath']),
      photoRemoteUrl: serializer.fromJson<String?>(json['photoRemoteUrl']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerId': serializer.toJson<String>(ownerId),
      'name': serializer.toJson<String>(name),
      'species': serializer.toJson<String>(species),
      'breed': serializer.toJson<String?>(breed),
      'gender': serializer.toJson<String?>(gender),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'weightKg': serializer.toJson<double?>(weightKg),
      'colorDesc': serializer.toJson<String?>(colorDesc),
      'isNeutered': serializer.toJson<bool>(isNeutered),
      'isForSale': serializer.toJson<bool>(isForSale),
      'isForAdoption': serializer.toJson<bool>(isForAdoption),
      'salePrice': serializer.toJson<double?>(salePrice),
      'photoLocalPath': serializer.toJson<String?>(photoLocalPath),
      'photoRemoteUrl': serializer.toJson<String?>(photoRemoteUrl),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  PetsTableData copyWith({
    String? id,
    String? ownerId,
    String? name,
    String? species,
    Value<String?> breed = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<DateTime?> birthDate = const Value.absent(),
    Value<double?> weightKg = const Value.absent(),
    Value<String?> colorDesc = const Value.absent(),
    bool? isNeutered,
    bool? isForSale,
    bool? isForAdoption,
    Value<double?> salePrice = const Value.absent(),
    Value<String?> photoLocalPath = const Value.absent(),
    Value<String?> photoRemoteUrl = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => PetsTableData(
    id: id ?? this.id,
    ownerId: ownerId ?? this.ownerId,
    name: name ?? this.name,
    species: species ?? this.species,
    breed: breed.present ? breed.value : this.breed,
    gender: gender.present ? gender.value : this.gender,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    colorDesc: colorDesc.present ? colorDesc.value : this.colorDesc,
    isNeutered: isNeutered ?? this.isNeutered,
    isForSale: isForSale ?? this.isForSale,
    isForAdoption: isForAdoption ?? this.isForAdoption,
    salePrice: salePrice.present ? salePrice.value : this.salePrice,
    photoLocalPath: photoLocalPath.present
        ? photoLocalPath.value
        : this.photoLocalPath,
    photoRemoteUrl: photoRemoteUrl.present
        ? photoRemoteUrl.value
        : this.photoRemoteUrl,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  PetsTableData copyWithCompanion(PetsTableCompanion data) {
    return PetsTableData(
      id: data.id.present ? data.id.value : this.id,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      name: data.name.present ? data.name.value : this.name,
      species: data.species.present ? data.species.value : this.species,
      breed: data.breed.present ? data.breed.value : this.breed,
      gender: data.gender.present ? data.gender.value : this.gender,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      colorDesc: data.colorDesc.present ? data.colorDesc.value : this.colorDesc,
      isNeutered: data.isNeutered.present
          ? data.isNeutered.value
          : this.isNeutered,
      isForSale: data.isForSale.present ? data.isForSale.value : this.isForSale,
      isForAdoption: data.isForAdoption.present
          ? data.isForAdoption.value
          : this.isForAdoption,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      photoLocalPath: data.photoLocalPath.present
          ? data.photoLocalPath.value
          : this.photoLocalPath,
      photoRemoteUrl: data.photoRemoteUrl.present
          ? data.photoRemoteUrl.value
          : this.photoRemoteUrl,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PetsTableData(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('gender: $gender, ')
          ..write('birthDate: $birthDate, ')
          ..write('weightKg: $weightKg, ')
          ..write('colorDesc: $colorDesc, ')
          ..write('isNeutered: $isNeutered, ')
          ..write('isForSale: $isForSale, ')
          ..write('isForAdoption: $isForAdoption, ')
          ..write('salePrice: $salePrice, ')
          ..write('photoLocalPath: $photoLocalPath, ')
          ..write('photoRemoteUrl: $photoRemoteUrl, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    ownerId,
    name,
    species,
    breed,
    gender,
    birthDate,
    weightKg,
    colorDesc,
    isNeutered,
    isForSale,
    isForAdoption,
    salePrice,
    photoLocalPath,
    photoRemoteUrl,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PetsTableData &&
          other.id == this.id &&
          other.ownerId == this.ownerId &&
          other.name == this.name &&
          other.species == this.species &&
          other.breed == this.breed &&
          other.gender == this.gender &&
          other.birthDate == this.birthDate &&
          other.weightKg == this.weightKg &&
          other.colorDesc == this.colorDesc &&
          other.isNeutered == this.isNeutered &&
          other.isForSale == this.isForSale &&
          other.isForAdoption == this.isForAdoption &&
          other.salePrice == this.salePrice &&
          other.photoLocalPath == this.photoLocalPath &&
          other.photoRemoteUrl == this.photoRemoteUrl &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class PetsTableCompanion extends UpdateCompanion<PetsTableData> {
  final Value<String> id;
  final Value<String> ownerId;
  final Value<String> name;
  final Value<String> species;
  final Value<String?> breed;
  final Value<String?> gender;
  final Value<DateTime?> birthDate;
  final Value<double?> weightKg;
  final Value<String?> colorDesc;
  final Value<bool> isNeutered;
  final Value<bool> isForSale;
  final Value<bool> isForAdoption;
  final Value<double?> salePrice;
  final Value<String?> photoLocalPath;
  final Value<String?> photoRemoteUrl;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const PetsTableCompanion({
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.name = const Value.absent(),
    this.species = const Value.absent(),
    this.breed = const Value.absent(),
    this.gender = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.colorDesc = const Value.absent(),
    this.isNeutered = const Value.absent(),
    this.isForSale = const Value.absent(),
    this.isForAdoption = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.photoLocalPath = const Value.absent(),
    this.photoRemoteUrl = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetsTableCompanion.insert({
    required String id,
    required String ownerId,
    required String name,
    required String species,
    this.breed = const Value.absent(),
    this.gender = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.colorDesc = const Value.absent(),
    this.isNeutered = const Value.absent(),
    this.isForSale = const Value.absent(),
    this.isForAdoption = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.photoLocalPath = const Value.absent(),
    this.photoRemoteUrl = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerId = Value(ownerId),
       name = Value(name),
       species = Value(species),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PetsTableData> custom({
    Expression<String>? id,
    Expression<String>? ownerId,
    Expression<String>? name,
    Expression<String>? species,
    Expression<String>? breed,
    Expression<String>? gender,
    Expression<DateTime>? birthDate,
    Expression<double>? weightKg,
    Expression<String>? colorDesc,
    Expression<bool>? isNeutered,
    Expression<bool>? isForSale,
    Expression<bool>? isForAdoption,
    Expression<double>? salePrice,
    Expression<String>? photoLocalPath,
    Expression<String>? photoRemoteUrl,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerId != null) 'owner_id': ownerId,
      if (name != null) 'name': name,
      if (species != null) 'species': species,
      if (breed != null) 'breed': breed,
      if (gender != null) 'gender': gender,
      if (birthDate != null) 'birth_date': birthDate,
      if (weightKg != null) 'weight_kg': weightKg,
      if (colorDesc != null) 'color_desc': colorDesc,
      if (isNeutered != null) 'is_neutered': isNeutered,
      if (isForSale != null) 'is_for_sale': isForSale,
      if (isForAdoption != null) 'is_for_adoption': isForAdoption,
      if (salePrice != null) 'sale_price': salePrice,
      if (photoLocalPath != null) 'photo_local_path': photoLocalPath,
      if (photoRemoteUrl != null) 'photo_remote_url': photoRemoteUrl,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerId,
    Value<String>? name,
    Value<String>? species,
    Value<String?>? breed,
    Value<String?>? gender,
    Value<DateTime?>? birthDate,
    Value<double?>? weightKg,
    Value<String?>? colorDesc,
    Value<bool>? isNeutered,
    Value<bool>? isForSale,
    Value<bool>? isForAdoption,
    Value<double?>? salePrice,
    Value<String?>? photoLocalPath,
    Value<String?>? photoRemoteUrl,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return PetsTableCompanion(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      weightKg: weightKg ?? this.weightKg,
      colorDesc: colorDesc ?? this.colorDesc,
      isNeutered: isNeutered ?? this.isNeutered,
      isForSale: isForSale ?? this.isForSale,
      isForAdoption: isForAdoption ?? this.isForAdoption,
      salePrice: salePrice ?? this.salePrice,
      photoLocalPath: photoLocalPath ?? this.photoLocalPath,
      photoRemoteUrl: photoRemoteUrl ?? this.photoRemoteUrl,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (colorDesc.present) {
      map['color_desc'] = Variable<String>(colorDesc.value);
    }
    if (isNeutered.present) {
      map['is_neutered'] = Variable<bool>(isNeutered.value);
    }
    if (isForSale.present) {
      map['is_for_sale'] = Variable<bool>(isForSale.value);
    }
    if (isForAdoption.present) {
      map['is_for_adoption'] = Variable<bool>(isForAdoption.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<double>(salePrice.value);
    }
    if (photoLocalPath.present) {
      map['photo_local_path'] = Variable<String>(photoLocalPath.value);
    }
    if (photoRemoteUrl.present) {
      map['photo_remote_url'] = Variable<String>(photoRemoteUrl.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsTableCompanion(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('gender: $gender, ')
          ..write('birthDate: $birthDate, ')
          ..write('weightKg: $weightKg, ')
          ..write('colorDesc: $colorDesc, ')
          ..write('isNeutered: $isNeutered, ')
          ..write('isForSale: $isForSale, ')
          ..write('isForAdoption: $isForAdoption, ')
          ..write('salePrice: $salePrice, ')
          ..write('photoLocalPath: $photoLocalPath, ')
          ..write('photoRemoteUrl: $photoRemoteUrl, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppointmentsTableTable extends AppointmentsTable
    with TableInfo<$AppointmentsTableTable, AppointmentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pets (id)',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _staffIdMeta = const VerificationMeta(
    'staffId',
  );
  @override
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
    'staff_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _serviceTypeMeta = const VerificationMeta(
    'serviceType',
  );
  @override
  late final GeneratedColumn<String> serviceType = GeneratedColumn<String>(
    'service_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(60),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reminderSentMeta = const VerificationMeta(
    'reminderSent',
  );
  @override
  late final GeneratedColumn<bool> reminderSent = GeneratedColumn<bool>(
    'reminder_sent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminder_sent" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _whatsappSentMeta = const VerificationMeta(
    'whatsappSent',
  );
  @override
  late final GeneratedColumn<bool> whatsappSent = GeneratedColumn<bool>(
    'whatsapp_sent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("whatsapp_sent" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    clientId,
    staffId,
    serviceType,
    status,
    scheduledAt,
    durationMinutes,
    price,
    notes,
    reminderSent,
    whatsappSent,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointments';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppointmentsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('staff_id')) {
      context.handle(
        _staffIdMeta,
        staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta),
      );
    }
    if (data.containsKey('service_type')) {
      context.handle(
        _serviceTypeMeta,
        serviceType.isAcceptableOrUnknown(
          data['service_type']!,
          _serviceTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('reminder_sent')) {
      context.handle(
        _reminderSentMeta,
        reminderSent.isAcceptableOrUnknown(
          data['reminder_sent']!,
          _reminderSentMeta,
        ),
      );
    }
    if (data.containsKey('whatsapp_sent')) {
      context.handle(
        _whatsappSentMeta,
        whatsappSent.isAcceptableOrUnknown(
          data['whatsapp_sent']!,
          _whatsappSentMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppointmentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppointmentsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      staffId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}staff_id'],
      ),
      serviceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      reminderSent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminder_sent'],
      )!,
      whatsappSent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}whatsapp_sent'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $AppointmentsTableTable createAlias(String alias) {
    return $AppointmentsTableTable(attachedDatabase, alias);
  }
}

class AppointmentsTableData extends DataClass
    implements Insertable<AppointmentsTableData> {
  /// Identificador único de la cita (UUID largo).
  final String id;

  /// La mascota que asistirá a la cita.
  /// Relaciona esta columna con la tabla 'PetsTable'.
  final String petId;

  /// El cliente (dueño de la mascota) que solicita la cita.
  /// Relaciona con la tabla 'UsersTable'.
  final String clientId;

  /// El empleado o veterinario asignado para atender esta cita (puede ser nulo al inicio).
  /// Relaciona con la tabla 'UsersTable'.
  final String? staffId;

  /// Tipo de servicio solicitado.
  /// Valores comunes: 'vet' (consulta médica), 'grooming' (corte de pelo), 'boarding' (hospedaje), 'bath' (baño).
  final String serviceType;

  /// Estado de la cita (por defecto es 'pending').
  /// Valores: 'pending' (pendiente), 'confirmed' (confirmada), 'in_progress' (en atención),
  /// 'completed' (finalizada), 'cancelled' (cancelada).
  final String status;

  /// Fecha y hora exacta programada para la cita.
  final DateTime scheduledAt;

  /// Duración aproximada de la cita en minutos (por defecto 60 minutos).
  final int durationMinutes;

  /// Costo estimado o final del servicio cobrado al cliente.
  final double? price;

  /// Indicaciones, síntomas iniciales reportados o comentarios del cliente/recepcionista.
  final String? notes;

  /// Indica si ya se le envió una notificación o alarma interna de recordatorio (por defecto falso).
  final bool reminderSent;

  /// Indica si ya se le envió el recordatorio automatizado por WhatsApp al cliente (por defecto falso).
  final bool whatsappSent;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final int syncVersion;
  const AppointmentsTableData({
    required this.id,
    required this.petId,
    required this.clientId,
    this.staffId,
    required this.serviceType,
    required this.status,
    required this.scheduledAt,
    required this.durationMinutes,
    this.price,
    this.notes,
    required this.reminderSent,
    required this.whatsappSent,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['client_id'] = Variable<String>(clientId);
    if (!nullToAbsent || staffId != null) {
      map['staff_id'] = Variable<String>(staffId);
    }
    map['service_type'] = Variable<String>(serviceType);
    map['status'] = Variable<String>(status);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['reminder_sent'] = Variable<bool>(reminderSent);
    map['whatsapp_sent'] = Variable<bool>(whatsappSent);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  AppointmentsTableCompanion toCompanion(bool nullToAbsent) {
    return AppointmentsTableCompanion(
      id: Value(id),
      petId: Value(petId),
      clientId: Value(clientId),
      staffId: staffId == null && nullToAbsent
          ? const Value.absent()
          : Value(staffId),
      serviceType: Value(serviceType),
      status: Value(status),
      scheduledAt: Value(scheduledAt),
      durationMinutes: Value(durationMinutes),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      reminderSent: Value(reminderSent),
      whatsappSent: Value(whatsappSent),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory AppointmentsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppointmentsTableData(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      clientId: serializer.fromJson<String>(json['clientId']),
      staffId: serializer.fromJson<String?>(json['staffId']),
      serviceType: serializer.fromJson<String>(json['serviceType']),
      status: serializer.fromJson<String>(json['status']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      price: serializer.fromJson<double?>(json['price']),
      notes: serializer.fromJson<String?>(json['notes']),
      reminderSent: serializer.fromJson<bool>(json['reminderSent']),
      whatsappSent: serializer.fromJson<bool>(json['whatsappSent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'clientId': serializer.toJson<String>(clientId),
      'staffId': serializer.toJson<String?>(staffId),
      'serviceType': serializer.toJson<String>(serviceType),
      'status': serializer.toJson<String>(status),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'price': serializer.toJson<double?>(price),
      'notes': serializer.toJson<String?>(notes),
      'reminderSent': serializer.toJson<bool>(reminderSent),
      'whatsappSent': serializer.toJson<bool>(whatsappSent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  AppointmentsTableData copyWith({
    String? id,
    String? petId,
    String? clientId,
    Value<String?> staffId = const Value.absent(),
    String? serviceType,
    String? status,
    DateTime? scheduledAt,
    int? durationMinutes,
    Value<double?> price = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? reminderSent,
    bool? whatsappSent,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => AppointmentsTableData(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    clientId: clientId ?? this.clientId,
    staffId: staffId.present ? staffId.value : this.staffId,
    serviceType: serviceType ?? this.serviceType,
    status: status ?? this.status,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    price: price.present ? price.value : this.price,
    notes: notes.present ? notes.value : this.notes,
    reminderSent: reminderSent ?? this.reminderSent,
    whatsappSent: whatsappSent ?? this.whatsappSent,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  AppointmentsTableData copyWithCompanion(AppointmentsTableCompanion data) {
    return AppointmentsTableData(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      serviceType: data.serviceType.present
          ? data.serviceType.value
          : this.serviceType,
      status: data.status.present ? data.status.value : this.status,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      price: data.price.present ? data.price.value : this.price,
      notes: data.notes.present ? data.notes.value : this.notes,
      reminderSent: data.reminderSent.present
          ? data.reminderSent.value
          : this.reminderSent,
      whatsappSent: data.whatsappSent.present
          ? data.whatsappSent.value
          : this.whatsappSent,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentsTableData(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('clientId: $clientId, ')
          ..write('staffId: $staffId, ')
          ..write('serviceType: $serviceType, ')
          ..write('status: $status, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('price: $price, ')
          ..write('notes: $notes, ')
          ..write('reminderSent: $reminderSent, ')
          ..write('whatsappSent: $whatsappSent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    clientId,
    staffId,
    serviceType,
    status,
    scheduledAt,
    durationMinutes,
    price,
    notes,
    reminderSent,
    whatsappSent,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppointmentsTableData &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.clientId == this.clientId &&
          other.staffId == this.staffId &&
          other.serviceType == this.serviceType &&
          other.status == this.status &&
          other.scheduledAt == this.scheduledAt &&
          other.durationMinutes == this.durationMinutes &&
          other.price == this.price &&
          other.notes == this.notes &&
          other.reminderSent == this.reminderSent &&
          other.whatsappSent == this.whatsappSent &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class AppointmentsTableCompanion
    extends UpdateCompanion<AppointmentsTableData> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> clientId;
  final Value<String?> staffId;
  final Value<String> serviceType;
  final Value<String> status;
  final Value<DateTime> scheduledAt;
  final Value<int> durationMinutes;
  final Value<double?> price;
  final Value<String?> notes;
  final Value<bool> reminderSent;
  final Value<bool> whatsappSent;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const AppointmentsTableCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.clientId = const Value.absent(),
    this.staffId = const Value.absent(),
    this.serviceType = const Value.absent(),
    this.status = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.price = const Value.absent(),
    this.notes = const Value.absent(),
    this.reminderSent = const Value.absent(),
    this.whatsappSent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppointmentsTableCompanion.insert({
    required String id,
    required String petId,
    required String clientId,
    this.staffId = const Value.absent(),
    required String serviceType,
    this.status = const Value.absent(),
    required DateTime scheduledAt,
    this.durationMinutes = const Value.absent(),
    this.price = const Value.absent(),
    this.notes = const Value.absent(),
    this.reminderSent = const Value.absent(),
    this.whatsappSent = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       clientId = Value(clientId),
       serviceType = Value(serviceType),
       scheduledAt = Value(scheduledAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<AppointmentsTableData> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? clientId,
    Expression<String>? staffId,
    Expression<String>? serviceType,
    Expression<String>? status,
    Expression<DateTime>? scheduledAt,
    Expression<int>? durationMinutes,
    Expression<double>? price,
    Expression<String>? notes,
    Expression<bool>? reminderSent,
    Expression<bool>? whatsappSent,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (clientId != null) 'client_id': clientId,
      if (staffId != null) 'staff_id': staffId,
      if (serviceType != null) 'service_type': serviceType,
      if (status != null) 'status': status,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (price != null) 'price': price,
      if (notes != null) 'notes': notes,
      if (reminderSent != null) 'reminder_sent': reminderSent,
      if (whatsappSent != null) 'whatsapp_sent': whatsappSent,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppointmentsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? clientId,
    Value<String?>? staffId,
    Value<String>? serviceType,
    Value<String>? status,
    Value<DateTime>? scheduledAt,
    Value<int>? durationMinutes,
    Value<double?>? price,
    Value<String?>? notes,
    Value<bool>? reminderSent,
    Value<bool>? whatsappSent,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return AppointmentsTableCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      clientId: clientId ?? this.clientId,
      staffId: staffId ?? this.staffId,
      serviceType: serviceType ?? this.serviceType,
      status: status ?? this.status,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      price: price ?? this.price,
      notes: notes ?? this.notes,
      reminderSent: reminderSent ?? this.reminderSent,
      whatsappSent: whatsappSent ?? this.whatsappSent,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<String>(staffId.value);
    }
    if (serviceType.present) {
      map['service_type'] = Variable<String>(serviceType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (reminderSent.present) {
      map['reminder_sent'] = Variable<bool>(reminderSent.value);
    }
    if (whatsappSent.present) {
      map['whatsapp_sent'] = Variable<bool>(whatsappSent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentsTableCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('clientId: $clientId, ')
          ..write('staffId: $staffId, ')
          ..write('serviceType: $serviceType, ')
          ..write('status: $status, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('price: $price, ')
          ..write('notes: $notes, ')
          ..write('reminderSent: $reminderSent, ')
          ..write('whatsappSent: $whatsappSent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicalRecordsTableTable extends MedicalRecordsTable
    with TableInfo<$MedicalRecordsTableTable, MedicalRecordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicalRecordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pets (id)',
    ),
  );
  static const VerificationMeta _vetIdMeta = const VerificationMeta('vetId');
  @override
  late final GeneratedColumn<String> vetId = GeneratedColumn<String>(
    'vet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _recordTypeMeta = const VerificationMeta(
    'recordType',
  );
  @override
  late final GeneratedColumn<String> recordType = GeneratedColumn<String>(
    'record_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _medicationNameMeta = const VerificationMeta(
    'medicationName',
  );
  @override
  late final GeneratedColumn<String> medicationName = GeneratedColumn<String>(
    'medication_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
    'dosage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextDueDateMeta = const VerificationMeta(
    'nextDueDate',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueDate = GeneratedColumn<DateTime>(
    'next_due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attachmentLocalPathMeta =
      const VerificationMeta('attachmentLocalPath');
  @override
  late final GeneratedColumn<String> attachmentLocalPath =
      GeneratedColumn<String>(
        'attachment_local_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _attachmentRemoteUrlMeta =
      const VerificationMeta('attachmentRemoteUrl');
  @override
  late final GeneratedColumn<String> attachmentRemoteUrl =
      GeneratedColumn<String>(
        'attachment_remote_url',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _conflictNotesMeta = const VerificationMeta(
    'conflictNotes',
  );
  @override
  late final GeneratedColumn<String> conflictNotes = GeneratedColumn<String>(
    'conflict_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    vetId,
    recordType,
    title,
    description,
    weightKg,
    medicationName,
    dosage,
    nextDueDate,
    attachmentLocalPath,
    attachmentRemoteUrl,
    conflictNotes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medical_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicalRecordsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('vet_id')) {
      context.handle(
        _vetIdMeta,
        vetId.isAcceptableOrUnknown(data['vet_id']!, _vetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vetIdMeta);
    }
    if (data.containsKey('record_type')) {
      context.handle(
        _recordTypeMeta,
        recordType.isAcceptableOrUnknown(data['record_type']!, _recordTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_recordTypeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('medication_name')) {
      context.handle(
        _medicationNameMeta,
        medicationName.isAcceptableOrUnknown(
          data['medication_name']!,
          _medicationNameMeta,
        ),
      );
    }
    if (data.containsKey('dosage')) {
      context.handle(
        _dosageMeta,
        dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta),
      );
    }
    if (data.containsKey('next_due_date')) {
      context.handle(
        _nextDueDateMeta,
        nextDueDate.isAcceptableOrUnknown(
          data['next_due_date']!,
          _nextDueDateMeta,
        ),
      );
    }
    if (data.containsKey('attachment_local_path')) {
      context.handle(
        _attachmentLocalPathMeta,
        attachmentLocalPath.isAcceptableOrUnknown(
          data['attachment_local_path']!,
          _attachmentLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('attachment_remote_url')) {
      context.handle(
        _attachmentRemoteUrlMeta,
        attachmentRemoteUrl.isAcceptableOrUnknown(
          data['attachment_remote_url']!,
          _attachmentRemoteUrlMeta,
        ),
      );
    }
    if (data.containsKey('conflict_notes')) {
      context.handle(
        _conflictNotesMeta,
        conflictNotes.isAcceptableOrUnknown(
          data['conflict_notes']!,
          _conflictNotesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicalRecordsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicalRecordsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      vetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vet_id'],
      )!,
      recordType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}record_type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      medicationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_name'],
      ),
      dosage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dosage'],
      ),
      nextDueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_date'],
      ),
      attachmentLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attachment_local_path'],
      ),
      attachmentRemoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attachment_remote_url'],
      ),
      conflictNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $MedicalRecordsTableTable createAlias(String alias) {
    return $MedicalRecordsTableTable(attachedDatabase, alias);
  }
}

class MedicalRecordsTableData extends DataClass
    implements Insertable<MedicalRecordsTableData> {
  /// Identificador único del registro médico (UUID largo).
  final String id;

  /// La mascota a la que le pertenece este registro médico.
  /// Relaciona con la tabla 'PetsTable'.
  final String petId;

  /// El veterinario (usuario de la app) que atendió la consulta y redactó la nota.
  /// Relaciona con la tabla 'UsersTable'.
  final String vetId;

  /// El tipo de evento médico registrado.
  /// Valores permitidos:
  /// - 'vaccine' (vacuna), 'deworming' (desparasitante), 'weight_check' (control de peso),
  /// - 'diagnosis' (diagnóstico/enfermedad), 'surgery' (cirugía), 'prescription' (receta médica),
  /// - 'general_note' (observación general).
  final String recordType;

  /// Título breve del registro (ej. "Vacuna Quíntuple", "Otitis bilateral").
  final String title;

  /// Explicación detallada de lo encontrado en la revisión o indicaciones médicas.
  final String description;

  /// Peso de la mascota tomado en esta consulta en específico (para ver la evolución de peso).
  final double? weightKg;

  /// Nombre del medicamento recetado o aplicado (si aplica).
  final String? medicationName;

  /// Dosis y frecuencia del medicamento (ej. "1 tableta cada 12 horas por 5 días").
  final String? dosage;

  /// Fecha de la siguiente cita o aplicación.
  /// Muy útil para vacunas (ej. cuándo toca el refuerzo en 6 meses).
  final DateTime? nextDueDate;

  /// Ruta de una foto del examen o receta guardada localmente en el celular.
  final String? attachmentLocalPath;

  /// Enlace de internet de la foto del examen guardada en la nube.
  final String? attachmentRemoteUrl;

  /// Notas aclaratorias escritas por el administrador si hubo un choque o conflicto
  /// al sincronizar los datos locales con el servidor (Merge Asistido).
  final String? conflictNotes;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// deletedAt se usa de manera virtual para marcar que una nota médica fue "anulada" por error.
  /// Pero recuerda: NUNCA se borra físicamente la fila de la base de datos.
  final DateTime? deletedAt;
  final String syncStatus;
  final int syncVersion;
  const MedicalRecordsTableData({
    required this.id,
    required this.petId,
    required this.vetId,
    required this.recordType,
    required this.title,
    required this.description,
    this.weightKg,
    this.medicationName,
    this.dosage,
    this.nextDueDate,
    this.attachmentLocalPath,
    this.attachmentRemoteUrl,
    this.conflictNotes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['vet_id'] = Variable<String>(vetId);
    map['record_type'] = Variable<String>(recordType);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || medicationName != null) {
      map['medication_name'] = Variable<String>(medicationName);
    }
    if (!nullToAbsent || dosage != null) {
      map['dosage'] = Variable<String>(dosage);
    }
    if (!nullToAbsent || nextDueDate != null) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate);
    }
    if (!nullToAbsent || attachmentLocalPath != null) {
      map['attachment_local_path'] = Variable<String>(attachmentLocalPath);
    }
    if (!nullToAbsent || attachmentRemoteUrl != null) {
      map['attachment_remote_url'] = Variable<String>(attachmentRemoteUrl);
    }
    if (!nullToAbsent || conflictNotes != null) {
      map['conflict_notes'] = Variable<String>(conflictNotes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  MedicalRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return MedicalRecordsTableCompanion(
      id: Value(id),
      petId: Value(petId),
      vetId: Value(vetId),
      recordType: Value(recordType),
      title: Value(title),
      description: Value(description),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      medicationName: medicationName == null && nullToAbsent
          ? const Value.absent()
          : Value(medicationName),
      dosage: dosage == null && nullToAbsent
          ? const Value.absent()
          : Value(dosage),
      nextDueDate: nextDueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextDueDate),
      attachmentLocalPath: attachmentLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentLocalPath),
      attachmentRemoteUrl: attachmentRemoteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentRemoteUrl),
      conflictNotes: conflictNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(conflictNotes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory MedicalRecordsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicalRecordsTableData(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      vetId: serializer.fromJson<String>(json['vetId']),
      recordType: serializer.fromJson<String>(json['recordType']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      medicationName: serializer.fromJson<String?>(json['medicationName']),
      dosage: serializer.fromJson<String?>(json['dosage']),
      nextDueDate: serializer.fromJson<DateTime?>(json['nextDueDate']),
      attachmentLocalPath: serializer.fromJson<String?>(
        json['attachmentLocalPath'],
      ),
      attachmentRemoteUrl: serializer.fromJson<String?>(
        json['attachmentRemoteUrl'],
      ),
      conflictNotes: serializer.fromJson<String?>(json['conflictNotes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'vetId': serializer.toJson<String>(vetId),
      'recordType': serializer.toJson<String>(recordType),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'weightKg': serializer.toJson<double?>(weightKg),
      'medicationName': serializer.toJson<String?>(medicationName),
      'dosage': serializer.toJson<String?>(dosage),
      'nextDueDate': serializer.toJson<DateTime?>(nextDueDate),
      'attachmentLocalPath': serializer.toJson<String?>(attachmentLocalPath),
      'attachmentRemoteUrl': serializer.toJson<String?>(attachmentRemoteUrl),
      'conflictNotes': serializer.toJson<String?>(conflictNotes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  MedicalRecordsTableData copyWith({
    String? id,
    String? petId,
    String? vetId,
    String? recordType,
    String? title,
    String? description,
    Value<double?> weightKg = const Value.absent(),
    Value<String?> medicationName = const Value.absent(),
    Value<String?> dosage = const Value.absent(),
    Value<DateTime?> nextDueDate = const Value.absent(),
    Value<String?> attachmentLocalPath = const Value.absent(),
    Value<String?> attachmentRemoteUrl = const Value.absent(),
    Value<String?> conflictNotes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => MedicalRecordsTableData(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    vetId: vetId ?? this.vetId,
    recordType: recordType ?? this.recordType,
    title: title ?? this.title,
    description: description ?? this.description,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    medicationName: medicationName.present
        ? medicationName.value
        : this.medicationName,
    dosage: dosage.present ? dosage.value : this.dosage,
    nextDueDate: nextDueDate.present ? nextDueDate.value : this.nextDueDate,
    attachmentLocalPath: attachmentLocalPath.present
        ? attachmentLocalPath.value
        : this.attachmentLocalPath,
    attachmentRemoteUrl: attachmentRemoteUrl.present
        ? attachmentRemoteUrl.value
        : this.attachmentRemoteUrl,
    conflictNotes: conflictNotes.present
        ? conflictNotes.value
        : this.conflictNotes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  MedicalRecordsTableData copyWithCompanion(MedicalRecordsTableCompanion data) {
    return MedicalRecordsTableData(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      vetId: data.vetId.present ? data.vetId.value : this.vetId,
      recordType: data.recordType.present
          ? data.recordType.value
          : this.recordType,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      medicationName: data.medicationName.present
          ? data.medicationName.value
          : this.medicationName,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      nextDueDate: data.nextDueDate.present
          ? data.nextDueDate.value
          : this.nextDueDate,
      attachmentLocalPath: data.attachmentLocalPath.present
          ? data.attachmentLocalPath.value
          : this.attachmentLocalPath,
      attachmentRemoteUrl: data.attachmentRemoteUrl.present
          ? data.attachmentRemoteUrl.value
          : this.attachmentRemoteUrl,
      conflictNotes: data.conflictNotes.present
          ? data.conflictNotes.value
          : this.conflictNotes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicalRecordsTableData(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vetId: $vetId, ')
          ..write('recordType: $recordType, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('weightKg: $weightKg, ')
          ..write('medicationName: $medicationName, ')
          ..write('dosage: $dosage, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('attachmentLocalPath: $attachmentLocalPath, ')
          ..write('attachmentRemoteUrl: $attachmentRemoteUrl, ')
          ..write('conflictNotes: $conflictNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    vetId,
    recordType,
    title,
    description,
    weightKg,
    medicationName,
    dosage,
    nextDueDate,
    attachmentLocalPath,
    attachmentRemoteUrl,
    conflictNotes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicalRecordsTableData &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.vetId == this.vetId &&
          other.recordType == this.recordType &&
          other.title == this.title &&
          other.description == this.description &&
          other.weightKg == this.weightKg &&
          other.medicationName == this.medicationName &&
          other.dosage == this.dosage &&
          other.nextDueDate == this.nextDueDate &&
          other.attachmentLocalPath == this.attachmentLocalPath &&
          other.attachmentRemoteUrl == this.attachmentRemoteUrl &&
          other.conflictNotes == this.conflictNotes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class MedicalRecordsTableCompanion
    extends UpdateCompanion<MedicalRecordsTableData> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> vetId;
  final Value<String> recordType;
  final Value<String> title;
  final Value<String> description;
  final Value<double?> weightKg;
  final Value<String?> medicationName;
  final Value<String?> dosage;
  final Value<DateTime?> nextDueDate;
  final Value<String?> attachmentLocalPath;
  final Value<String?> attachmentRemoteUrl;
  final Value<String?> conflictNotes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const MedicalRecordsTableCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.vetId = const Value.absent(),
    this.recordType = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.dosage = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.attachmentLocalPath = const Value.absent(),
    this.attachmentRemoteUrl = const Value.absent(),
    this.conflictNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicalRecordsTableCompanion.insert({
    required String id,
    required String petId,
    required String vetId,
    required String recordType,
    required String title,
    required String description,
    this.weightKg = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.dosage = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.attachmentLocalPath = const Value.absent(),
    this.attachmentRemoteUrl = const Value.absent(),
    this.conflictNotes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       vetId = Value(vetId),
       recordType = Value(recordType),
       title = Value(title),
       description = Value(description),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MedicalRecordsTableData> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? vetId,
    Expression<String>? recordType,
    Expression<String>? title,
    Expression<String>? description,
    Expression<double>? weightKg,
    Expression<String>? medicationName,
    Expression<String>? dosage,
    Expression<DateTime>? nextDueDate,
    Expression<String>? attachmentLocalPath,
    Expression<String>? attachmentRemoteUrl,
    Expression<String>? conflictNotes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (vetId != null) 'vet_id': vetId,
      if (recordType != null) 'record_type': recordType,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (weightKg != null) 'weight_kg': weightKg,
      if (medicationName != null) 'medication_name': medicationName,
      if (dosage != null) 'dosage': dosage,
      if (nextDueDate != null) 'next_due_date': nextDueDate,
      if (attachmentLocalPath != null)
        'attachment_local_path': attachmentLocalPath,
      if (attachmentRemoteUrl != null)
        'attachment_remote_url': attachmentRemoteUrl,
      if (conflictNotes != null) 'conflict_notes': conflictNotes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicalRecordsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? vetId,
    Value<String>? recordType,
    Value<String>? title,
    Value<String>? description,
    Value<double?>? weightKg,
    Value<String?>? medicationName,
    Value<String?>? dosage,
    Value<DateTime?>? nextDueDate,
    Value<String?>? attachmentLocalPath,
    Value<String?>? attachmentRemoteUrl,
    Value<String?>? conflictNotes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return MedicalRecordsTableCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      vetId: vetId ?? this.vetId,
      recordType: recordType ?? this.recordType,
      title: title ?? this.title,
      description: description ?? this.description,
      weightKg: weightKg ?? this.weightKg,
      medicationName: medicationName ?? this.medicationName,
      dosage: dosage ?? this.dosage,
      nextDueDate: nextDueDate ?? this.nextDueDate,
      attachmentLocalPath: attachmentLocalPath ?? this.attachmentLocalPath,
      attachmentRemoteUrl: attachmentRemoteUrl ?? this.attachmentRemoteUrl,
      conflictNotes: conflictNotes ?? this.conflictNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (vetId.present) {
      map['vet_id'] = Variable<String>(vetId.value);
    }
    if (recordType.present) {
      map['record_type'] = Variable<String>(recordType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (medicationName.present) {
      map['medication_name'] = Variable<String>(medicationName.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (nextDueDate.present) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate.value);
    }
    if (attachmentLocalPath.present) {
      map['attachment_local_path'] = Variable<String>(
        attachmentLocalPath.value,
      );
    }
    if (attachmentRemoteUrl.present) {
      map['attachment_remote_url'] = Variable<String>(
        attachmentRemoteUrl.value,
      );
    }
    if (conflictNotes.present) {
      map['conflict_notes'] = Variable<String>(conflictNotes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicalRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vetId: $vetId, ')
          ..write('recordType: $recordType, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('weightKg: $weightKg, ')
          ..write('medicationName: $medicationName, ')
          ..write('dosage: $dosage, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('attachmentLocalPath: $attachmentLocalPath, ')
          ..write('attachmentRemoteUrl: $attachmentRemoteUrl, ')
          ..write('conflictNotes: $conflictNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTableTable extends ProductsTable
    with TableInfo<$ProductsTableTable, ProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountPctMeta = const VerificationMeta(
    'discountPct',
  );
  @override
  late final GeneratedColumn<double> discountPct = GeneratedColumn<double>(
    'discount_pct',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _stockQtyMeta = const VerificationMeta(
    'stockQty',
  );
  @override
  late final GeneratedColumn<int> stockQty = GeneratedColumn<int>(
    'stock_qty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _stockMinAlertMeta = const VerificationMeta(
    'stockMinAlert',
  );
  @override
  late final GeneratedColumn<int> stockMinAlert = GeneratedColumn<int>(
    'stock_min_alert',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _imageLocalPathMeta = const VerificationMeta(
    'imageLocalPath',
  );
  @override
  late final GeneratedColumn<String> imageLocalPath = GeneratedColumn<String>(
    'image_local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageRemoteUrlMeta = const VerificationMeta(
    'imageRemoteUrl',
  );
  @override
  late final GeneratedColumn<String> imageRemoteUrl = GeneratedColumn<String>(
    'image_remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetSpeciesMeta = const VerificationMeta(
    'targetSpecies',
  );
  @override
  late final GeneratedColumn<String> targetSpecies = GeneratedColumn<String>(
    'target_species',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    category,
    brand,
    sku,
    price,
    discountPct,
    stockQty,
    stockMinAlert,
    isActive,
    imageLocalPath,
    imageRemoteUrl,
    targetSpecies,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount_pct')) {
      context.handle(
        _discountPctMeta,
        discountPct.isAcceptableOrUnknown(
          data['discount_pct']!,
          _discountPctMeta,
        ),
      );
    }
    if (data.containsKey('stock_qty')) {
      context.handle(
        _stockQtyMeta,
        stockQty.isAcceptableOrUnknown(data['stock_qty']!, _stockQtyMeta),
      );
    }
    if (data.containsKey('stock_min_alert')) {
      context.handle(
        _stockMinAlertMeta,
        stockMinAlert.isAcceptableOrUnknown(
          data['stock_min_alert']!,
          _stockMinAlertMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('image_local_path')) {
      context.handle(
        _imageLocalPathMeta,
        imageLocalPath.isAcceptableOrUnknown(
          data['image_local_path']!,
          _imageLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('image_remote_url')) {
      context.handle(
        _imageRemoteUrlMeta,
        imageRemoteUrl.isAcceptableOrUnknown(
          data['image_remote_url']!,
          _imageRemoteUrlMeta,
        ),
      );
    }
    if (data.containsKey('target_species')) {
      context.handle(
        _targetSpeciesMeta,
        targetSpecies.isAcceptableOrUnknown(
          data['target_species']!,
          _targetSpeciesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      discountPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_pct'],
      )!,
      stockQty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock_qty'],
      )!,
      stockMinAlert: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock_min_alert'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      imageLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_local_path'],
      ),
      imageRemoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_remote_url'],
      ),
      targetSpecies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_species'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $ProductsTableTable createAlias(String alias) {
    return $ProductsTableTable(attachedDatabase, alias);
  }
}

class ProductsTableData extends DataClass
    implements Insertable<ProductsTableData> {
  /// Identificador único del producto (UUID largo).
  final String id;

  /// Nombre del producto (ej. "Comida para Cachorro Sabor Pollo").
  final String name;

  /// Explicación sobre para qué sirve el producto, ingredientes, etc. (opcional).
  final String? description;

  /// Categoría del producto.
  /// Valores: 'food' (comida), 'accessory' (accesorio), 'medicine' (medicamento),
  /// 'toy' (juguete), 'hygiene' (limpieza/higiene).
  final String category;

  /// Marca fabricante del producto (ej. "Royal Canin", "Kong") - opcional.
  final String? brand;

  /// Código SKU (Código de barras o clave única comercial) - opcional.
  final String? sku;

  /// Precio regular del producto (valor decimal).
  final double price;

  /// Porcentaje de descuento aplicado actualmente (de 0.0 a 100.0, por defecto 0.0).
  final double discountPct;

  /// Cantidad de piezas disponibles físicamente en la tienda (por defecto 0).
  final int stockQty;

  /// Límite mínimo de existencias permitido antes de alertar para reordenar (por defecto 5).
  /// Si 'stockQty' es igual o menor a esta cantidad, se genera aviso de inventario bajo.
  final int stockMinAlert;

  /// Indica si el producto está visible y a la venta en la app (por defecto verdadero).
  final bool isActive;

  /// Ruta de la imagen guardada temporalmente en el celular (opcional).
  final String? imageLocalPath;

  /// Enlace de internet de la imagen en la nube para descargarla al celular (opcional).
  final String? imageRemoteUrl;

  /// Especies de mascotas para las que sirve el producto.
  /// Se guarda en formato texto JSON plano, por ejemplo: '["dog", "cat"]'.
  /// Sirve para filtrar el catálogo en la interfaz.
  final String? targetSpecies;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final int syncVersion;
  const ProductsTableData({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    this.brand,
    this.sku,
    required this.price,
    required this.discountPct,
    required this.stockQty,
    required this.stockMinAlert,
    required this.isActive,
    this.imageLocalPath,
    this.imageRemoteUrl,
    this.targetSpecies,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    map['price'] = Variable<double>(price);
    map['discount_pct'] = Variable<double>(discountPct);
    map['stock_qty'] = Variable<int>(stockQty);
    map['stock_min_alert'] = Variable<int>(stockMinAlert);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || imageLocalPath != null) {
      map['image_local_path'] = Variable<String>(imageLocalPath);
    }
    if (!nullToAbsent || imageRemoteUrl != null) {
      map['image_remote_url'] = Variable<String>(imageRemoteUrl);
    }
    if (!nullToAbsent || targetSpecies != null) {
      map['target_species'] = Variable<String>(targetSpecies);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  ProductsTableCompanion toCompanion(bool nullToAbsent) {
    return ProductsTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: Value(category),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      price: Value(price),
      discountPct: Value(discountPct),
      stockQty: Value(stockQty),
      stockMinAlert: Value(stockMinAlert),
      isActive: Value(isActive),
      imageLocalPath: imageLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(imageLocalPath),
      imageRemoteUrl: imageRemoteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageRemoteUrl),
      targetSpecies: targetSpecies == null && nullToAbsent
          ? const Value.absent()
          : Value(targetSpecies),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory ProductsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      brand: serializer.fromJson<String?>(json['brand']),
      sku: serializer.fromJson<String?>(json['sku']),
      price: serializer.fromJson<double>(json['price']),
      discountPct: serializer.fromJson<double>(json['discountPct']),
      stockQty: serializer.fromJson<int>(json['stockQty']),
      stockMinAlert: serializer.fromJson<int>(json['stockMinAlert']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      imageLocalPath: serializer.fromJson<String?>(json['imageLocalPath']),
      imageRemoteUrl: serializer.fromJson<String?>(json['imageRemoteUrl']),
      targetSpecies: serializer.fromJson<String?>(json['targetSpecies']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String>(category),
      'brand': serializer.toJson<String?>(brand),
      'sku': serializer.toJson<String?>(sku),
      'price': serializer.toJson<double>(price),
      'discountPct': serializer.toJson<double>(discountPct),
      'stockQty': serializer.toJson<int>(stockQty),
      'stockMinAlert': serializer.toJson<int>(stockMinAlert),
      'isActive': serializer.toJson<bool>(isActive),
      'imageLocalPath': serializer.toJson<String?>(imageLocalPath),
      'imageRemoteUrl': serializer.toJson<String?>(imageRemoteUrl),
      'targetSpecies': serializer.toJson<String?>(targetSpecies),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  ProductsTableData copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? category,
    Value<String?> brand = const Value.absent(),
    Value<String?> sku = const Value.absent(),
    double? price,
    double? discountPct,
    int? stockQty,
    int? stockMinAlert,
    bool? isActive,
    Value<String?> imageLocalPath = const Value.absent(),
    Value<String?> imageRemoteUrl = const Value.absent(),
    Value<String?> targetSpecies = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => ProductsTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    category: category ?? this.category,
    brand: brand.present ? brand.value : this.brand,
    sku: sku.present ? sku.value : this.sku,
    price: price ?? this.price,
    discountPct: discountPct ?? this.discountPct,
    stockQty: stockQty ?? this.stockQty,
    stockMinAlert: stockMinAlert ?? this.stockMinAlert,
    isActive: isActive ?? this.isActive,
    imageLocalPath: imageLocalPath.present
        ? imageLocalPath.value
        : this.imageLocalPath,
    imageRemoteUrl: imageRemoteUrl.present
        ? imageRemoteUrl.value
        : this.imageRemoteUrl,
    targetSpecies: targetSpecies.present
        ? targetSpecies.value
        : this.targetSpecies,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  ProductsTableData copyWithCompanion(ProductsTableCompanion data) {
    return ProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      brand: data.brand.present ? data.brand.value : this.brand,
      sku: data.sku.present ? data.sku.value : this.sku,
      price: data.price.present ? data.price.value : this.price,
      discountPct: data.discountPct.present
          ? data.discountPct.value
          : this.discountPct,
      stockQty: data.stockQty.present ? data.stockQty.value : this.stockQty,
      stockMinAlert: data.stockMinAlert.present
          ? data.stockMinAlert.value
          : this.stockMinAlert,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      imageLocalPath: data.imageLocalPath.present
          ? data.imageLocalPath.value
          : this.imageLocalPath,
      imageRemoteUrl: data.imageRemoteUrl.present
          ? data.imageRemoteUrl.value
          : this.imageRemoteUrl,
      targetSpecies: data.targetSpecies.present
          ? data.targetSpecies.value
          : this.targetSpecies,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('price: $price, ')
          ..write('discountPct: $discountPct, ')
          ..write('stockQty: $stockQty, ')
          ..write('stockMinAlert: $stockMinAlert, ')
          ..write('isActive: $isActive, ')
          ..write('imageLocalPath: $imageLocalPath, ')
          ..write('imageRemoteUrl: $imageRemoteUrl, ')
          ..write('targetSpecies: $targetSpecies, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    category,
    brand,
    sku,
    price,
    discountPct,
    stockQty,
    stockMinAlert,
    isActive,
    imageLocalPath,
    imageRemoteUrl,
    targetSpecies,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.category == this.category &&
          other.brand == this.brand &&
          other.sku == this.sku &&
          other.price == this.price &&
          other.discountPct == this.discountPct &&
          other.stockQty == this.stockQty &&
          other.stockMinAlert == this.stockMinAlert &&
          other.isActive == this.isActive &&
          other.imageLocalPath == this.imageLocalPath &&
          other.imageRemoteUrl == this.imageRemoteUrl &&
          other.targetSpecies == this.targetSpecies &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class ProductsTableCompanion extends UpdateCompanion<ProductsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> category;
  final Value<String?> brand;
  final Value<String?> sku;
  final Value<double> price;
  final Value<double> discountPct;
  final Value<int> stockQty;
  final Value<int> stockMinAlert;
  final Value<bool> isActive;
  final Value<String?> imageLocalPath;
  final Value<String?> imageRemoteUrl;
  final Value<String?> targetSpecies;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const ProductsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    this.price = const Value.absent(),
    this.discountPct = const Value.absent(),
    this.stockQty = const Value.absent(),
    this.stockMinAlert = const Value.absent(),
    this.isActive = const Value.absent(),
    this.imageLocalPath = const Value.absent(),
    this.imageRemoteUrl = const Value.absent(),
    this.targetSpecies = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsTableCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required String category,
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    required double price,
    this.discountPct = const Value.absent(),
    this.stockQty = const Value.absent(),
    this.stockMinAlert = const Value.absent(),
    this.isActive = const Value.absent(),
    this.imageLocalPath = const Value.absent(),
    this.imageRemoteUrl = const Value.absent(),
    this.targetSpecies = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       price = Value(price),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProductsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? brand,
    Expression<String>? sku,
    Expression<double>? price,
    Expression<double>? discountPct,
    Expression<int>? stockQty,
    Expression<int>? stockMinAlert,
    Expression<bool>? isActive,
    Expression<String>? imageLocalPath,
    Expression<String>? imageRemoteUrl,
    Expression<String>? targetSpecies,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (brand != null) 'brand': brand,
      if (sku != null) 'sku': sku,
      if (price != null) 'price': price,
      if (discountPct != null) 'discount_pct': discountPct,
      if (stockQty != null) 'stock_qty': stockQty,
      if (stockMinAlert != null) 'stock_min_alert': stockMinAlert,
      if (isActive != null) 'is_active': isActive,
      if (imageLocalPath != null) 'image_local_path': imageLocalPath,
      if (imageRemoteUrl != null) 'image_remote_url': imageRemoteUrl,
      if (targetSpecies != null) 'target_species': targetSpecies,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? category,
    Value<String?>? brand,
    Value<String?>? sku,
    Value<double>? price,
    Value<double>? discountPct,
    Value<int>? stockQty,
    Value<int>? stockMinAlert,
    Value<bool>? isActive,
    Value<String?>? imageLocalPath,
    Value<String?>? imageRemoteUrl,
    Value<String?>? targetSpecies,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return ProductsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      discountPct: discountPct ?? this.discountPct,
      stockQty: stockQty ?? this.stockQty,
      stockMinAlert: stockMinAlert ?? this.stockMinAlert,
      isActive: isActive ?? this.isActive,
      imageLocalPath: imageLocalPath ?? this.imageLocalPath,
      imageRemoteUrl: imageRemoteUrl ?? this.imageRemoteUrl,
      targetSpecies: targetSpecies ?? this.targetSpecies,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discountPct.present) {
      map['discount_pct'] = Variable<double>(discountPct.value);
    }
    if (stockQty.present) {
      map['stock_qty'] = Variable<int>(stockQty.value);
    }
    if (stockMinAlert.present) {
      map['stock_min_alert'] = Variable<int>(stockMinAlert.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (imageLocalPath.present) {
      map['image_local_path'] = Variable<String>(imageLocalPath.value);
    }
    if (imageRemoteUrl.present) {
      map['image_remote_url'] = Variable<String>(imageRemoteUrl.value);
    }
    if (targetSpecies.present) {
      map['target_species'] = Variable<String>(targetSpecies.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('price: $price, ')
          ..write('discountPct: $discountPct, ')
          ..write('stockQty: $stockQty, ')
          ..write('stockMinAlert: $stockMinAlert, ')
          ..write('isActive: $isActive, ')
          ..write('imageLocalPath: $imageLocalPath, ')
          ..write('imageRemoteUrl: $imageRemoteUrl, ')
          ..write('targetSpecies: $targetSpecies, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrdersTableTable extends OrdersTable
    with TableInfo<$OrdersTableTable, OrdersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _driverIdMeta = const VerificationMeta(
    'driverId',
  );
  @override
  late final GeneratedColumn<String> driverId = GeneratedColumn<String>(
    'driver_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('cart'),
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _deliveryFeeMeta = const VerificationMeta(
    'deliveryFee',
  );
  @override
  late final GeneratedColumn<double> deliveryFee = GeneratedColumn<double>(
    'delivery_fee',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _deliveryAddressMeta = const VerificationMeta(
    'deliveryAddress',
  );
  @override
  late final GeneratedColumn<String> deliveryAddress = GeneratedColumn<String>(
    'delivery_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deliveryLatMeta = const VerificationMeta(
    'deliveryLat',
  );
  @override
  late final GeneratedColumn<double> deliveryLat = GeneratedColumn<double>(
    'delivery_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deliveryLngMeta = const VerificationMeta(
    'deliveryLng',
  );
  @override
  late final GeneratedColumn<double> deliveryLng = GeneratedColumn<double>(
    'delivery_lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentStatusMeta = const VerificationMeta(
    'paymentStatus',
  );
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
    'payment_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _clientNotesMeta = const VerificationMeta(
    'clientNotes',
  );
  @override
  late final GeneratedColumn<String> clientNotes = GeneratedColumn<String>(
    'client_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _placedAtMeta = const VerificationMeta(
    'placedAt',
  );
  @override
  late final GeneratedColumn<DateTime> placedAt = GeneratedColumn<DateTime>(
    'placed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deliveredAtMeta = const VerificationMeta(
    'deliveredAt',
  );
  @override
  late final GeneratedColumn<DateTime> deliveredAt = GeneratedColumn<DateTime>(
    'delivered_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    driverId,
    status,
    subtotal,
    deliveryFee,
    totalAmount,
    deliveryAddress,
    deliveryLat,
    deliveryLng,
    paymentMethod,
    paymentStatus,
    clientNotes,
    placedAt,
    deliveredAt,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrdersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('driver_id')) {
      context.handle(
        _driverIdMeta,
        driverId.isAcceptableOrUnknown(data['driver_id']!, _driverIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    }
    if (data.containsKey('delivery_fee')) {
      context.handle(
        _deliveryFeeMeta,
        deliveryFee.isAcceptableOrUnknown(
          data['delivery_fee']!,
          _deliveryFeeMeta,
        ),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    }
    if (data.containsKey('delivery_address')) {
      context.handle(
        _deliveryAddressMeta,
        deliveryAddress.isAcceptableOrUnknown(
          data['delivery_address']!,
          _deliveryAddressMeta,
        ),
      );
    }
    if (data.containsKey('delivery_lat')) {
      context.handle(
        _deliveryLatMeta,
        deliveryLat.isAcceptableOrUnknown(
          data['delivery_lat']!,
          _deliveryLatMeta,
        ),
      );
    }
    if (data.containsKey('delivery_lng')) {
      context.handle(
        _deliveryLngMeta,
        deliveryLng.isAcceptableOrUnknown(
          data['delivery_lng']!,
          _deliveryLngMeta,
        ),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('payment_status')) {
      context.handle(
        _paymentStatusMeta,
        paymentStatus.isAcceptableOrUnknown(
          data['payment_status']!,
          _paymentStatusMeta,
        ),
      );
    }
    if (data.containsKey('client_notes')) {
      context.handle(
        _clientNotesMeta,
        clientNotes.isAcceptableOrUnknown(
          data['client_notes']!,
          _clientNotesMeta,
        ),
      );
    }
    if (data.containsKey('placed_at')) {
      context.handle(
        _placedAtMeta,
        placedAt.isAcceptableOrUnknown(data['placed_at']!, _placedAtMeta),
      );
    }
    if (data.containsKey('delivered_at')) {
      context.handle(
        _deliveredAtMeta,
        deliveredAt.isAcceptableOrUnknown(
          data['delivered_at']!,
          _deliveredAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrdersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrdersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      driverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}driver_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      deliveryFee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}delivery_fee'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      deliveryAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}delivery_address'],
      ),
      deliveryLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}delivery_lat'],
      ),
      deliveryLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}delivery_lng'],
      ),
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      ),
      paymentStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_status'],
      )!,
      clientNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_notes'],
      ),
      placedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}placed_at'],
      ),
      deliveredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}delivered_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $OrdersTableTable createAlias(String alias) {
    return $OrdersTableTable(attachedDatabase, alias);
  }
}

class OrdersTableData extends DataClass implements Insertable<OrdersTableData> {
  /// Identificador único del pedido (UUID largo).
  final String id;

  /// El cliente que realizó la compra.
  /// Relaciona con la tabla 'UsersTable'.
  final String clientId;

  /// El repartidor o chofer asignado para llevar el pedido (puede ser nulo si se retira en tienda).
  /// Relaciona con la tabla 'UsersTable'.
  final String? driverId;

  /// Estado de progreso del pedido (por defecto 'cart', o sea, en el carrito).
  /// Valores posibles:
  /// - 'cart' (en el carrito), 'placed' (pedido enviado), 'confirmed' (aceptado por la tienda),
  /// - 'preparing' (preparando productos), 'ready' (listo para despacho), 'delivering' (en camino),
  /// - 'delivered' (entregado al cliente), 'cancelled' (cancelado).
  final String status;

  /// Costo acumulado de los productos sin contar el envío (por defecto 0.0).
  final double subtotal;

  /// Costo del envío a domicilio cobrado al cliente (por defecto 0.0).
  final double deliveryFee;

  /// Monto total final a pagar (subtotal + deliveryFee).
  final double totalAmount;

  /// Dirección de calle y número escrita por el cliente para el reparto (opcional).
  final String? deliveryAddress;

  /// Latitud de la dirección (coordenada GPS) para mostrarla en el mapa del repartidor.
  final double? deliveryLat;

  /// Longitud de la dirección (coordenada GPS) para el mapa.
  final double? deliveryLng;

  /// Método de pago seleccionado por el cliente.
  /// Valores: 'cash' (efectivo), 'card' (tarjeta física), 'transfer' (transferencia), 'online' (pago web).
  final String? paymentMethod;

  /// Estado del pago del pedido (por defecto 'pending' - pendiente).
  /// Valores: 'pending' (pendiente), 'paid' (pagado), 'refunded' (reembolsado).
  final String paymentStatus;

  /// Notas aclaratorias que deje el cliente (ej. "Tocar el timbre verde", "Dejar en recepción").
  final String? clientNotes;

  /// Fecha y hora exacta en la que el cliente confirmó su compra y mandó el pedido a la tienda.
  final DateTime? placedAt;

  /// Fecha y hora exacta en la que el repartidor entregó el paquete al cliente.
  final DateTime? deliveredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final int syncVersion;
  const OrdersTableData({
    required this.id,
    required this.clientId,
    this.driverId,
    required this.status,
    required this.subtotal,
    required this.deliveryFee,
    required this.totalAmount,
    this.deliveryAddress,
    this.deliveryLat,
    this.deliveryLng,
    this.paymentMethod,
    required this.paymentStatus,
    this.clientNotes,
    this.placedAt,
    this.deliveredAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['client_id'] = Variable<String>(clientId);
    if (!nullToAbsent || driverId != null) {
      map['driver_id'] = Variable<String>(driverId);
    }
    map['status'] = Variable<String>(status);
    map['subtotal'] = Variable<double>(subtotal);
    map['delivery_fee'] = Variable<double>(deliveryFee);
    map['total_amount'] = Variable<double>(totalAmount);
    if (!nullToAbsent || deliveryAddress != null) {
      map['delivery_address'] = Variable<String>(deliveryAddress);
    }
    if (!nullToAbsent || deliveryLat != null) {
      map['delivery_lat'] = Variable<double>(deliveryLat);
    }
    if (!nullToAbsent || deliveryLng != null) {
      map['delivery_lng'] = Variable<double>(deliveryLng);
    }
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || clientNotes != null) {
      map['client_notes'] = Variable<String>(clientNotes);
    }
    if (!nullToAbsent || placedAt != null) {
      map['placed_at'] = Variable<DateTime>(placedAt);
    }
    if (!nullToAbsent || deliveredAt != null) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  OrdersTableCompanion toCompanion(bool nullToAbsent) {
    return OrdersTableCompanion(
      id: Value(id),
      clientId: Value(clientId),
      driverId: driverId == null && nullToAbsent
          ? const Value.absent()
          : Value(driverId),
      status: Value(status),
      subtotal: Value(subtotal),
      deliveryFee: Value(deliveryFee),
      totalAmount: Value(totalAmount),
      deliveryAddress: deliveryAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryAddress),
      deliveryLat: deliveryLat == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryLat),
      deliveryLng: deliveryLng == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryLng),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      paymentStatus: Value(paymentStatus),
      clientNotes: clientNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(clientNotes),
      placedAt: placedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(placedAt),
      deliveredAt: deliveredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveredAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory OrdersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrdersTableData(
      id: serializer.fromJson<String>(json['id']),
      clientId: serializer.fromJson<String>(json['clientId']),
      driverId: serializer.fromJson<String?>(json['driverId']),
      status: serializer.fromJson<String>(json['status']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      deliveryFee: serializer.fromJson<double>(json['deliveryFee']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      deliveryAddress: serializer.fromJson<String?>(json['deliveryAddress']),
      deliveryLat: serializer.fromJson<double?>(json['deliveryLat']),
      deliveryLng: serializer.fromJson<double?>(json['deliveryLng']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      clientNotes: serializer.fromJson<String?>(json['clientNotes']),
      placedAt: serializer.fromJson<DateTime?>(json['placedAt']),
      deliveredAt: serializer.fromJson<DateTime?>(json['deliveredAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientId': serializer.toJson<String>(clientId),
      'driverId': serializer.toJson<String?>(driverId),
      'status': serializer.toJson<String>(status),
      'subtotal': serializer.toJson<double>(subtotal),
      'deliveryFee': serializer.toJson<double>(deliveryFee),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'deliveryAddress': serializer.toJson<String?>(deliveryAddress),
      'deliveryLat': serializer.toJson<double?>(deliveryLat),
      'deliveryLng': serializer.toJson<double?>(deliveryLng),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'clientNotes': serializer.toJson<String?>(clientNotes),
      'placedAt': serializer.toJson<DateTime?>(placedAt),
      'deliveredAt': serializer.toJson<DateTime?>(deliveredAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  OrdersTableData copyWith({
    String? id,
    String? clientId,
    Value<String?> driverId = const Value.absent(),
    String? status,
    double? subtotal,
    double? deliveryFee,
    double? totalAmount,
    Value<String?> deliveryAddress = const Value.absent(),
    Value<double?> deliveryLat = const Value.absent(),
    Value<double?> deliveryLng = const Value.absent(),
    Value<String?> paymentMethod = const Value.absent(),
    String? paymentStatus,
    Value<String?> clientNotes = const Value.absent(),
    Value<DateTime?> placedAt = const Value.absent(),
    Value<DateTime?> deliveredAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => OrdersTableData(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    driverId: driverId.present ? driverId.value : this.driverId,
    status: status ?? this.status,
    subtotal: subtotal ?? this.subtotal,
    deliveryFee: deliveryFee ?? this.deliveryFee,
    totalAmount: totalAmount ?? this.totalAmount,
    deliveryAddress: deliveryAddress.present
        ? deliveryAddress.value
        : this.deliveryAddress,
    deliveryLat: deliveryLat.present ? deliveryLat.value : this.deliveryLat,
    deliveryLng: deliveryLng.present ? deliveryLng.value : this.deliveryLng,
    paymentMethod: paymentMethod.present
        ? paymentMethod.value
        : this.paymentMethod,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    clientNotes: clientNotes.present ? clientNotes.value : this.clientNotes,
    placedAt: placedAt.present ? placedAt.value : this.placedAt,
    deliveredAt: deliveredAt.present ? deliveredAt.value : this.deliveredAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  OrdersTableData copyWithCompanion(OrdersTableCompanion data) {
    return OrdersTableData(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      driverId: data.driverId.present ? data.driverId.value : this.driverId,
      status: data.status.present ? data.status.value : this.status,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      deliveryFee: data.deliveryFee.present
          ? data.deliveryFee.value
          : this.deliveryFee,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      deliveryAddress: data.deliveryAddress.present
          ? data.deliveryAddress.value
          : this.deliveryAddress,
      deliveryLat: data.deliveryLat.present
          ? data.deliveryLat.value
          : this.deliveryLat,
      deliveryLng: data.deliveryLng.present
          ? data.deliveryLng.value
          : this.deliveryLng,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      clientNotes: data.clientNotes.present
          ? data.clientNotes.value
          : this.clientNotes,
      placedAt: data.placedAt.present ? data.placedAt.value : this.placedAt,
      deliveredAt: data.deliveredAt.present
          ? data.deliveredAt.value
          : this.deliveredAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrdersTableData(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('driverId: $driverId, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('deliveryFee: $deliveryFee, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('deliveryAddress: $deliveryAddress, ')
          ..write('deliveryLat: $deliveryLat, ')
          ..write('deliveryLng: $deliveryLng, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('clientNotes: $clientNotes, ')
          ..write('placedAt: $placedAt, ')
          ..write('deliveredAt: $deliveredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientId,
    driverId,
    status,
    subtotal,
    deliveryFee,
    totalAmount,
    deliveryAddress,
    deliveryLat,
    deliveryLng,
    paymentMethod,
    paymentStatus,
    clientNotes,
    placedAt,
    deliveredAt,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrdersTableData &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.driverId == this.driverId &&
          other.status == this.status &&
          other.subtotal == this.subtotal &&
          other.deliveryFee == this.deliveryFee &&
          other.totalAmount == this.totalAmount &&
          other.deliveryAddress == this.deliveryAddress &&
          other.deliveryLat == this.deliveryLat &&
          other.deliveryLng == this.deliveryLng &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentStatus == this.paymentStatus &&
          other.clientNotes == this.clientNotes &&
          other.placedAt == this.placedAt &&
          other.deliveredAt == this.deliveredAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class OrdersTableCompanion extends UpdateCompanion<OrdersTableData> {
  final Value<String> id;
  final Value<String> clientId;
  final Value<String?> driverId;
  final Value<String> status;
  final Value<double> subtotal;
  final Value<double> deliveryFee;
  final Value<double> totalAmount;
  final Value<String?> deliveryAddress;
  final Value<double?> deliveryLat;
  final Value<double?> deliveryLng;
  final Value<String?> paymentMethod;
  final Value<String> paymentStatus;
  final Value<String?> clientNotes;
  final Value<DateTime?> placedAt;
  final Value<DateTime?> deliveredAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const OrdersTableCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.driverId = const Value.absent(),
    this.status = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.deliveryFee = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.deliveryAddress = const Value.absent(),
    this.deliveryLat = const Value.absent(),
    this.deliveryLng = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.clientNotes = const Value.absent(),
    this.placedAt = const Value.absent(),
    this.deliveredAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrdersTableCompanion.insert({
    required String id,
    required String clientId,
    this.driverId = const Value.absent(),
    this.status = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.deliveryFee = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.deliveryAddress = const Value.absent(),
    this.deliveryLat = const Value.absent(),
    this.deliveryLng = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.clientNotes = const Value.absent(),
    this.placedAt = const Value.absent(),
    this.deliveredAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       clientId = Value(clientId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<OrdersTableData> custom({
    Expression<String>? id,
    Expression<String>? clientId,
    Expression<String>? driverId,
    Expression<String>? status,
    Expression<double>? subtotal,
    Expression<double>? deliveryFee,
    Expression<double>? totalAmount,
    Expression<String>? deliveryAddress,
    Expression<double>? deliveryLat,
    Expression<double>? deliveryLng,
    Expression<String>? paymentMethod,
    Expression<String>? paymentStatus,
    Expression<String>? clientNotes,
    Expression<DateTime>? placedAt,
    Expression<DateTime>? deliveredAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (driverId != null) 'driver_id': driverId,
      if (status != null) 'status': status,
      if (subtotal != null) 'subtotal': subtotal,
      if (deliveryFee != null) 'delivery_fee': deliveryFee,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (deliveryAddress != null) 'delivery_address': deliveryAddress,
      if (deliveryLat != null) 'delivery_lat': deliveryLat,
      if (deliveryLng != null) 'delivery_lng': deliveryLng,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (clientNotes != null) 'client_notes': clientNotes,
      if (placedAt != null) 'placed_at': placedAt,
      if (deliveredAt != null) 'delivered_at': deliveredAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrdersTableCompanion copyWith({
    Value<String>? id,
    Value<String>? clientId,
    Value<String?>? driverId,
    Value<String>? status,
    Value<double>? subtotal,
    Value<double>? deliveryFee,
    Value<double>? totalAmount,
    Value<String?>? deliveryAddress,
    Value<double?>? deliveryLat,
    Value<double?>? deliveryLng,
    Value<String?>? paymentMethod,
    Value<String>? paymentStatus,
    Value<String?>? clientNotes,
    Value<DateTime?>? placedAt,
    Value<DateTime?>? deliveredAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return OrdersTableCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      driverId: driverId ?? this.driverId,
      status: status ?? this.status,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      totalAmount: totalAmount ?? this.totalAmount,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryLat: deliveryLat ?? this.deliveryLat,
      deliveryLng: deliveryLng ?? this.deliveryLng,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      clientNotes: clientNotes ?? this.clientNotes,
      placedAt: placedAt ?? this.placedAt,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (driverId.present) {
      map['driver_id'] = Variable<String>(driverId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (deliveryFee.present) {
      map['delivery_fee'] = Variable<double>(deliveryFee.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (deliveryAddress.present) {
      map['delivery_address'] = Variable<String>(deliveryAddress.value);
    }
    if (deliveryLat.present) {
      map['delivery_lat'] = Variable<double>(deliveryLat.value);
    }
    if (deliveryLng.present) {
      map['delivery_lng'] = Variable<double>(deliveryLng.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (clientNotes.present) {
      map['client_notes'] = Variable<String>(clientNotes.value);
    }
    if (placedAt.present) {
      map['placed_at'] = Variable<DateTime>(placedAt.value);
    }
    if (deliveredAt.present) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersTableCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('driverId: $driverId, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('deliveryFee: $deliveryFee, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('deliveryAddress: $deliveryAddress, ')
          ..write('deliveryLat: $deliveryLat, ')
          ..write('deliveryLng: $deliveryLng, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('clientNotes: $clientNotes, ')
          ..write('placedAt: $placedAt, ')
          ..write('deliveredAt: $deliveredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrderItemsTableTable extends OrderItemsTable
    with TableInfo<$OrderItemsTableTable, OrderItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<String> orderId = GeneratedColumn<String>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES orders (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productSnapshotMeta = const VerificationMeta(
    'productSnapshot',
  );
  @override
  late final GeneratedColumn<String> productSnapshot = GeneratedColumn<String>(
    'product_snapshot',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    productId,
    quantity,
    unitPrice,
    subtotal,
    productSnapshot,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderItemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('product_snapshot')) {
      context.handle(
        _productSnapshotMeta,
        productSnapshot.isAcceptableOrUnknown(
          data['product_snapshot']!,
          _productSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      productSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_snapshot'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $OrderItemsTableTable createAlias(String alias) {
    return $OrderItemsTableTable(attachedDatabase, alias);
  }
}

class OrderItemsTableData extends DataClass
    implements Insertable<OrderItemsTableData> {
  /// Identificador único de este renglón (UUID largo).
  final String id;

  /// El pedido principal al que pertenece este renglón.
  /// Relaciona con la tabla 'OrdersTable'.
  final String orderId;

  /// El producto comprado.
  /// Relaciona con la tabla 'ProductsTable'.
  final String productId;

  /// Cantidad de piezas de este producto que está comprando el cliente.
  final int quantity;

  /// Precio unitario cobrado por este producto al momento de la compra.
  /// Nota: Se guarda el precio exacto congelado en ese instante, por si el producto sube o baja de precio
  /// en el catálogo general mañana, no afecte la factura histórica del cliente.
  final double unitPrice;

  /// Subtotal acumulado de este producto específico (quantity * unitPrice).
  final double subtotal;

  /// Captura de datos del producto al momento del pedido.
  /// Se guarda como un texto en JSON (nombre, marca, imagen).
  /// Esto sirve como un respaldo histórico por si el producto llega a eliminarse del catálogo en el futuro.
  final String? productSnapshot;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final int syncVersion;
  const OrderItemsTableData({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
    this.productSnapshot,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['order_id'] = Variable<String>(orderId);
    map['product_id'] = Variable<String>(productId);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['subtotal'] = Variable<double>(subtotal);
    if (!nullToAbsent || productSnapshot != null) {
      map['product_snapshot'] = Variable<String>(productSnapshot);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  OrderItemsTableCompanion toCompanion(bool nullToAbsent) {
    return OrderItemsTableCompanion(
      id: Value(id),
      orderId: Value(orderId),
      productId: Value(productId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      subtotal: Value(subtotal),
      productSnapshot: productSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(productSnapshot),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory OrderItemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      orderId: serializer.fromJson<String>(json['orderId']),
      productId: serializer.fromJson<String>(json['productId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      productSnapshot: serializer.fromJson<String?>(json['productSnapshot']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'orderId': serializer.toJson<String>(orderId),
      'productId': serializer.toJson<String>(productId),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'subtotal': serializer.toJson<double>(subtotal),
      'productSnapshot': serializer.toJson<String?>(productSnapshot),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  OrderItemsTableData copyWith({
    String? id,
    String? orderId,
    String? productId,
    int? quantity,
    double? unitPrice,
    double? subtotal,
    Value<String?> productSnapshot = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => OrderItemsTableData(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    productId: productId ?? this.productId,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    subtotal: subtotal ?? this.subtotal,
    productSnapshot: productSnapshot.present
        ? productSnapshot.value
        : this.productSnapshot,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  OrderItemsTableData copyWithCompanion(OrderItemsTableCompanion data) {
    return OrderItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      productSnapshot: data.productSnapshot.present
          ? data.productSnapshot.value
          : this.productSnapshot,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsTableData(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('subtotal: $subtotal, ')
          ..write('productSnapshot: $productSnapshot, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orderId,
    productId,
    quantity,
    unitPrice,
    subtotal,
    productSnapshot,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemsTableData &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.subtotal == this.subtotal &&
          other.productSnapshot == this.productSnapshot &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class OrderItemsTableCompanion extends UpdateCompanion<OrderItemsTableData> {
  final Value<String> id;
  final Value<String> orderId;
  final Value<String> productId;
  final Value<int> quantity;
  final Value<double> unitPrice;
  final Value<double> subtotal;
  final Value<String?> productSnapshot;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const OrderItemsTableCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.productSnapshot = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrderItemsTableCompanion.insert({
    required String id,
    required String orderId,
    required String productId,
    required int quantity,
    required double unitPrice,
    required double subtotal,
    this.productSnapshot = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       orderId = Value(orderId),
       productId = Value(productId),
       quantity = Value(quantity),
       unitPrice = Value(unitPrice),
       subtotal = Value(subtotal),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<OrderItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? orderId,
    Expression<String>? productId,
    Expression<int>? quantity,
    Expression<double>? unitPrice,
    Expression<double>? subtotal,
    Expression<String>? productSnapshot,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (subtotal != null) 'subtotal': subtotal,
      if (productSnapshot != null) 'product_snapshot': productSnapshot,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrderItemsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? orderId,
    Value<String>? productId,
    Value<int>? quantity,
    Value<double>? unitPrice,
    Value<double>? subtotal,
    Value<String?>? productSnapshot,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return OrderItemsTableCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      subtotal: subtotal ?? this.subtotal,
      productSnapshot: productSnapshot ?? this.productSnapshot,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (productSnapshot.present) {
      map['product_snapshot'] = Variable<String>(productSnapshot.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('subtotal: $subtotal, ')
          ..write('productSnapshot: $productSnapshot, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocationTracksTableTable extends LocationTracksTable
    with TableInfo<$LocationTracksTableTable, LocationTracksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationTracksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _driverIdMeta = const VerificationMeta(
    'driverId',
  );
  @override
  late final GeneratedColumn<String> driverId = GeneratedColumn<String>(
    'driver_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<String> orderId = GeneratedColumn<String>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES orders (id)',
    ),
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accuracyMetersMeta = const VerificationMeta(
    'accuracyMeters',
  );
  @override
  late final GeneratedColumn<double> accuracyMeters = GeneratedColumn<double>(
    'accuracy_meters',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speedKmhMeta = const VerificationMeta(
    'speedKmh',
  );
  @override
  late final GeneratedColumn<double> speedKmh = GeneratedColumn<double>(
    'speed_kmh',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _headingDegreesMeta = const VerificationMeta(
    'headingDegrees',
  );
  @override
  late final GeneratedColumn<double> headingDegrees = GeneratedColumn<double>(
    'heading_degrees',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    driverId,
    orderId,
    latitude,
    longitude,
    accuracyMeters,
    speedKmh,
    headingDegrees,
    recordedAt,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_tracks';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationTracksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('driver_id')) {
      context.handle(
        _driverIdMeta,
        driverId.isAcceptableOrUnknown(data['driver_id']!, _driverIdMeta),
      );
    } else if (isInserting) {
      context.missing(_driverIdMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('accuracy_meters')) {
      context.handle(
        _accuracyMetersMeta,
        accuracyMeters.isAcceptableOrUnknown(
          data['accuracy_meters']!,
          _accuracyMetersMeta,
        ),
      );
    }
    if (data.containsKey('speed_kmh')) {
      context.handle(
        _speedKmhMeta,
        speedKmh.isAcceptableOrUnknown(data['speed_kmh']!, _speedKmhMeta),
      );
    }
    if (data.containsKey('heading_degrees')) {
      context.handle(
        _headingDegreesMeta,
        headingDegrees.isAcceptableOrUnknown(
          data['heading_degrees']!,
          _headingDegreesMeta,
        ),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationTracksTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationTracksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      driverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}driver_id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_id'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      accuracyMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accuracy_meters'],
      ),
      speedKmh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed_kmh'],
      ),
      headingDegrees: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}heading_degrees'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $LocationTracksTableTable createAlias(String alias) {
    return $LocationTracksTableTable(attachedDatabase, alias);
  }
}

class LocationTracksTableData extends DataClass
    implements Insertable<LocationTracksTableData> {
  /// Identificador único del punto GPS (UUID largo).
  final String id;

  /// El repartidor o chofer que está generando la ubicación.
  /// Relaciona con la tabla 'UsersTable'.
  final String driverId;

  /// El pedido que se está entregando en esta ruta.
  /// Relaciona con la tabla 'OrdersTable'.
  final String orderId;

  /// Coordenada GPS de Latitud.
  final double latitude;

  /// Coordenada GPS de Longitud.
  final double longitude;

  /// Nivel de precisión del satélite GPS del teléfono en metros (opcional).
  /// (ej. si el margen de error es de 5 metros o de 50 metros).
  final double? accuracyMeters;

  /// Velocidad en kilómetros por hora a la que se mueve el chofer (opcional).
  final double? speedKmh;

  /// Dirección o rumbo del celular en grados (de 0 a 360, ej. 90 es el Este) - opcional.
  /// Sirve para rotar el icono del carrito en el mapa.
  final double? headingDegrees;

  /// La fecha y hora exacta en la que el sensor de GPS detectó la ubicación en el teléfono.
  /// Se registra por separado porque si el teléfono no tiene internet, puede capturar la ubicación
  /// y guardarla aquí, y el 'createdAt' se llenará después cuando se suba a la base de datos.
  final DateTime recordedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final int syncVersion;
  const LocationTracksTableData({
    required this.id,
    required this.driverId,
    required this.orderId,
    required this.latitude,
    required this.longitude,
    this.accuracyMeters,
    this.speedKmh,
    this.headingDegrees,
    required this.recordedAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['driver_id'] = Variable<String>(driverId);
    map['order_id'] = Variable<String>(orderId);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || accuracyMeters != null) {
      map['accuracy_meters'] = Variable<double>(accuracyMeters);
    }
    if (!nullToAbsent || speedKmh != null) {
      map['speed_kmh'] = Variable<double>(speedKmh);
    }
    if (!nullToAbsent || headingDegrees != null) {
      map['heading_degrees'] = Variable<double>(headingDegrees);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  LocationTracksTableCompanion toCompanion(bool nullToAbsent) {
    return LocationTracksTableCompanion(
      id: Value(id),
      driverId: Value(driverId),
      orderId: Value(orderId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      accuracyMeters: accuracyMeters == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracyMeters),
      speedKmh: speedKmh == null && nullToAbsent
          ? const Value.absent()
          : Value(speedKmh),
      headingDegrees: headingDegrees == null && nullToAbsent
          ? const Value.absent()
          : Value(headingDegrees),
      recordedAt: Value(recordedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory LocationTracksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationTracksTableData(
      id: serializer.fromJson<String>(json['id']),
      driverId: serializer.fromJson<String>(json['driverId']),
      orderId: serializer.fromJson<String>(json['orderId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      accuracyMeters: serializer.fromJson<double?>(json['accuracyMeters']),
      speedKmh: serializer.fromJson<double?>(json['speedKmh']),
      headingDegrees: serializer.fromJson<double?>(json['headingDegrees']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'driverId': serializer.toJson<String>(driverId),
      'orderId': serializer.toJson<String>(orderId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'accuracyMeters': serializer.toJson<double?>(accuracyMeters),
      'speedKmh': serializer.toJson<double?>(speedKmh),
      'headingDegrees': serializer.toJson<double?>(headingDegrees),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  LocationTracksTableData copyWith({
    String? id,
    String? driverId,
    String? orderId,
    double? latitude,
    double? longitude,
    Value<double?> accuracyMeters = const Value.absent(),
    Value<double?> speedKmh = const Value.absent(),
    Value<double?> headingDegrees = const Value.absent(),
    DateTime? recordedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => LocationTracksTableData(
    id: id ?? this.id,
    driverId: driverId ?? this.driverId,
    orderId: orderId ?? this.orderId,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    accuracyMeters: accuracyMeters.present
        ? accuracyMeters.value
        : this.accuracyMeters,
    speedKmh: speedKmh.present ? speedKmh.value : this.speedKmh,
    headingDegrees: headingDegrees.present
        ? headingDegrees.value
        : this.headingDegrees,
    recordedAt: recordedAt ?? this.recordedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  LocationTracksTableData copyWithCompanion(LocationTracksTableCompanion data) {
    return LocationTracksTableData(
      id: data.id.present ? data.id.value : this.id,
      driverId: data.driverId.present ? data.driverId.value : this.driverId,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      accuracyMeters: data.accuracyMeters.present
          ? data.accuracyMeters.value
          : this.accuracyMeters,
      speedKmh: data.speedKmh.present ? data.speedKmh.value : this.speedKmh,
      headingDegrees: data.headingDegrees.present
          ? data.headingDegrees.value
          : this.headingDegrees,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationTracksTableData(')
          ..write('id: $id, ')
          ..write('driverId: $driverId, ')
          ..write('orderId: $orderId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('accuracyMeters: $accuracyMeters, ')
          ..write('speedKmh: $speedKmh, ')
          ..write('headingDegrees: $headingDegrees, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    driverId,
    orderId,
    latitude,
    longitude,
    accuracyMeters,
    speedKmh,
    headingDegrees,
    recordedAt,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationTracksTableData &&
          other.id == this.id &&
          other.driverId == this.driverId &&
          other.orderId == this.orderId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.accuracyMeters == this.accuracyMeters &&
          other.speedKmh == this.speedKmh &&
          other.headingDegrees == this.headingDegrees &&
          other.recordedAt == this.recordedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class LocationTracksTableCompanion
    extends UpdateCompanion<LocationTracksTableData> {
  final Value<String> id;
  final Value<String> driverId;
  final Value<String> orderId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double?> accuracyMeters;
  final Value<double?> speedKmh;
  final Value<double?> headingDegrees;
  final Value<DateTime> recordedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const LocationTracksTableCompanion({
    this.id = const Value.absent(),
    this.driverId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.accuracyMeters = const Value.absent(),
    this.speedKmh = const Value.absent(),
    this.headingDegrees = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationTracksTableCompanion.insert({
    required String id,
    required String driverId,
    required String orderId,
    required double latitude,
    required double longitude,
    this.accuracyMeters = const Value.absent(),
    this.speedKmh = const Value.absent(),
    this.headingDegrees = const Value.absent(),
    required DateTime recordedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       driverId = Value(driverId),
       orderId = Value(orderId),
       latitude = Value(latitude),
       longitude = Value(longitude),
       recordedAt = Value(recordedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LocationTracksTableData> custom({
    Expression<String>? id,
    Expression<String>? driverId,
    Expression<String>? orderId,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? accuracyMeters,
    Expression<double>? speedKmh,
    Expression<double>? headingDegrees,
    Expression<DateTime>? recordedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (driverId != null) 'driver_id': driverId,
      if (orderId != null) 'order_id': orderId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (accuracyMeters != null) 'accuracy_meters': accuracyMeters,
      if (speedKmh != null) 'speed_kmh': speedKmh,
      if (headingDegrees != null) 'heading_degrees': headingDegrees,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationTracksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? driverId,
    Value<String>? orderId,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<double?>? accuracyMeters,
    Value<double?>? speedKmh,
    Value<double?>? headingDegrees,
    Value<DateTime>? recordedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return LocationTracksTableCompanion(
      id: id ?? this.id,
      driverId: driverId ?? this.driverId,
      orderId: orderId ?? this.orderId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      accuracyMeters: accuracyMeters ?? this.accuracyMeters,
      speedKmh: speedKmh ?? this.speedKmh,
      headingDegrees: headingDegrees ?? this.headingDegrees,
      recordedAt: recordedAt ?? this.recordedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (driverId.present) {
      map['driver_id'] = Variable<String>(driverId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (accuracyMeters.present) {
      map['accuracy_meters'] = Variable<double>(accuracyMeters.value);
    }
    if (speedKmh.present) {
      map['speed_kmh'] = Variable<double>(speedKmh.value);
    }
    if (headingDegrees.present) {
      map['heading_degrees'] = Variable<double>(headingDegrees.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationTracksTableCompanion(')
          ..write('id: $id, ')
          ..write('driverId: $driverId, ')
          ..write('orderId: $orderId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('accuracyMeters: $accuracyMeters, ')
          ..write('speedKmh: $speedKmh, ')
          ..write('headingDegrees: $headingDegrees, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdoptionRequestsTableTable extends AdoptionRequestsTable
    with TableInfo<$AdoptionRequestsTableTable, AdoptionRequestsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdoptionRequestsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _listingIdMeta = const VerificationMeta(
    'listingId',
  );
  @override
  late final GeneratedColumn<String> listingId = GeneratedColumn<String>(
    'listing_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _animalNameMeta = const VerificationMeta(
    'animalName',
  );
  @override
  late final GeneratedColumn<String> animalName = GeneratedColumn<String>(
    'animal_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _clientNameMeta = const VerificationMeta(
    'clientName',
  );
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
    'client_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientPhoneMeta = const VerificationMeta(
    'clientPhone',
  );
  @override
  late final GeneratedColumn<String> clientPhone = GeneratedColumn<String>(
    'client_phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientEmailMeta = const VerificationMeta(
    'clientEmail',
  );
  @override
  late final GeneratedColumn<String> clientEmail = GeneratedColumn<String>(
    'client_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requestTypeMeta = const VerificationMeta(
    'requestType',
  );
  @override
  late final GeneratedColumn<String> requestType = GeneratedColumn<String>(
    'request_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _adminNotesMeta = const VerificationMeta(
    'adminNotes',
  );
  @override
  late final GeneratedColumn<String> adminNotes = GeneratedColumn<String>(
    'admin_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    listingId,
    animalName,
    clientId,
    clientName,
    clientPhone,
    clientEmail,
    requestType,
    message,
    status,
    adminNotes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adoption_requests';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdoptionRequestsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('listing_id')) {
      context.handle(
        _listingIdMeta,
        listingId.isAcceptableOrUnknown(data['listing_id']!, _listingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_listingIdMeta);
    }
    if (data.containsKey('animal_name')) {
      context.handle(
        _animalNameMeta,
        animalName.isAcceptableOrUnknown(data['animal_name']!, _animalNameMeta),
      );
    } else if (isInserting) {
      context.missing(_animalNameMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('client_name')) {
      context.handle(
        _clientNameMeta,
        clientName.isAcceptableOrUnknown(data['client_name']!, _clientNameMeta),
      );
    } else if (isInserting) {
      context.missing(_clientNameMeta);
    }
    if (data.containsKey('client_phone')) {
      context.handle(
        _clientPhoneMeta,
        clientPhone.isAcceptableOrUnknown(
          data['client_phone']!,
          _clientPhoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientPhoneMeta);
    }
    if (data.containsKey('client_email')) {
      context.handle(
        _clientEmailMeta,
        clientEmail.isAcceptableOrUnknown(
          data['client_email']!,
          _clientEmailMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientEmailMeta);
    }
    if (data.containsKey('request_type')) {
      context.handle(
        _requestTypeMeta,
        requestType.isAcceptableOrUnknown(
          data['request_type']!,
          _requestTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requestTypeMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('admin_notes')) {
      context.handle(
        _adminNotesMeta,
        adminNotes.isAcceptableOrUnknown(data['admin_notes']!, _adminNotesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdoptionRequestsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdoptionRequestsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      listingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}listing_id'],
      )!,
      animalName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}animal_name'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      clientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_name'],
      )!,
      clientPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_phone'],
      )!,
      clientEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_email'],
      )!,
      requestType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_type'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      adminNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admin_notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
    );
  }

  @override
  $AdoptionRequestsTableTable createAlias(String alias) {
    return $AdoptionRequestsTableTable(attachedDatabase, alias);
  }
}

class AdoptionRequestsTableData extends DataClass
    implements Insertable<AdoptionRequestsTableData> {
  final String id;
  final String listingId;
  final String animalName;
  final String clientId;
  final String clientName;
  final String clientPhone;
  final String clientEmail;
  final String requestType;
  final String? message;
  final String status;
  final String? adminNotes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final int syncVersion;
  const AdoptionRequestsTableData({
    required this.id,
    required this.listingId,
    required this.animalName,
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    required this.clientEmail,
    required this.requestType,
    this.message,
    required this.status,
    this.adminNotes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    required this.syncVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['listing_id'] = Variable<String>(listingId);
    map['animal_name'] = Variable<String>(animalName);
    map['client_id'] = Variable<String>(clientId);
    map['client_name'] = Variable<String>(clientName);
    map['client_phone'] = Variable<String>(clientPhone);
    map['client_email'] = Variable<String>(clientEmail);
    map['request_type'] = Variable<String>(requestType);
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || adminNotes != null) {
      map['admin_notes'] = Variable<String>(adminNotes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    return map;
  }

  AdoptionRequestsTableCompanion toCompanion(bool nullToAbsent) {
    return AdoptionRequestsTableCompanion(
      id: Value(id),
      listingId: Value(listingId),
      animalName: Value(animalName),
      clientId: Value(clientId),
      clientName: Value(clientName),
      clientPhone: Value(clientPhone),
      clientEmail: Value(clientEmail),
      requestType: Value(requestType),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      status: Value(status),
      adminNotes: adminNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(adminNotes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
    );
  }

  factory AdoptionRequestsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdoptionRequestsTableData(
      id: serializer.fromJson<String>(json['id']),
      listingId: serializer.fromJson<String>(json['listingId']),
      animalName: serializer.fromJson<String>(json['animalName']),
      clientId: serializer.fromJson<String>(json['clientId']),
      clientName: serializer.fromJson<String>(json['clientName']),
      clientPhone: serializer.fromJson<String>(json['clientPhone']),
      clientEmail: serializer.fromJson<String>(json['clientEmail']),
      requestType: serializer.fromJson<String>(json['requestType']),
      message: serializer.fromJson<String?>(json['message']),
      status: serializer.fromJson<String>(json['status']),
      adminNotes: serializer.fromJson<String?>(json['adminNotes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'listingId': serializer.toJson<String>(listingId),
      'animalName': serializer.toJson<String>(animalName),
      'clientId': serializer.toJson<String>(clientId),
      'clientName': serializer.toJson<String>(clientName),
      'clientPhone': serializer.toJson<String>(clientPhone),
      'clientEmail': serializer.toJson<String>(clientEmail),
      'requestType': serializer.toJson<String>(requestType),
      'message': serializer.toJson<String?>(message),
      'status': serializer.toJson<String>(status),
      'adminNotes': serializer.toJson<String?>(adminNotes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
    };
  }

  AdoptionRequestsTableData copyWith({
    String? id,
    String? listingId,
    String? animalName,
    String? clientId,
    String? clientName,
    String? clientPhone,
    String? clientEmail,
    String? requestType,
    Value<String?> message = const Value.absent(),
    String? status,
    Value<String?> adminNotes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
  }) => AdoptionRequestsTableData(
    id: id ?? this.id,
    listingId: listingId ?? this.listingId,
    animalName: animalName ?? this.animalName,
    clientId: clientId ?? this.clientId,
    clientName: clientName ?? this.clientName,
    clientPhone: clientPhone ?? this.clientPhone,
    clientEmail: clientEmail ?? this.clientEmail,
    requestType: requestType ?? this.requestType,
    message: message.present ? message.value : this.message,
    status: status ?? this.status,
    adminNotes: adminNotes.present ? adminNotes.value : this.adminNotes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
  );
  AdoptionRequestsTableData copyWithCompanion(
    AdoptionRequestsTableCompanion data,
  ) {
    return AdoptionRequestsTableData(
      id: data.id.present ? data.id.value : this.id,
      listingId: data.listingId.present ? data.listingId.value : this.listingId,
      animalName: data.animalName.present
          ? data.animalName.value
          : this.animalName,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      clientName: data.clientName.present
          ? data.clientName.value
          : this.clientName,
      clientPhone: data.clientPhone.present
          ? data.clientPhone.value
          : this.clientPhone,
      clientEmail: data.clientEmail.present
          ? data.clientEmail.value
          : this.clientEmail,
      requestType: data.requestType.present
          ? data.requestType.value
          : this.requestType,
      message: data.message.present ? data.message.value : this.message,
      status: data.status.present ? data.status.value : this.status,
      adminNotes: data.adminNotes.present
          ? data.adminNotes.value
          : this.adminNotes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdoptionRequestsTableData(')
          ..write('id: $id, ')
          ..write('listingId: $listingId, ')
          ..write('animalName: $animalName, ')
          ..write('clientId: $clientId, ')
          ..write('clientName: $clientName, ')
          ..write('clientPhone: $clientPhone, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('requestType: $requestType, ')
          ..write('message: $message, ')
          ..write('status: $status, ')
          ..write('adminNotes: $adminNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    listingId,
    animalName,
    clientId,
    clientName,
    clientPhone,
    clientEmail,
    requestType,
    message,
    status,
    adminNotes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    syncVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdoptionRequestsTableData &&
          other.id == this.id &&
          other.listingId == this.listingId &&
          other.animalName == this.animalName &&
          other.clientId == this.clientId &&
          other.clientName == this.clientName &&
          other.clientPhone == this.clientPhone &&
          other.clientEmail == this.clientEmail &&
          other.requestType == this.requestType &&
          other.message == this.message &&
          other.status == this.status &&
          other.adminNotes == this.adminNotes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion);
}

class AdoptionRequestsTableCompanion
    extends UpdateCompanion<AdoptionRequestsTableData> {
  final Value<String> id;
  final Value<String> listingId;
  final Value<String> animalName;
  final Value<String> clientId;
  final Value<String> clientName;
  final Value<String> clientPhone;
  final Value<String> clientEmail;
  final Value<String> requestType;
  final Value<String?> message;
  final Value<String> status;
  final Value<String?> adminNotes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<int> rowid;
  const AdoptionRequestsTableCompanion({
    this.id = const Value.absent(),
    this.listingId = const Value.absent(),
    this.animalName = const Value.absent(),
    this.clientId = const Value.absent(),
    this.clientName = const Value.absent(),
    this.clientPhone = const Value.absent(),
    this.clientEmail = const Value.absent(),
    this.requestType = const Value.absent(),
    this.message = const Value.absent(),
    this.status = const Value.absent(),
    this.adminNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdoptionRequestsTableCompanion.insert({
    required String id,
    required String listingId,
    required String animalName,
    required String clientId,
    required String clientName,
    required String clientPhone,
    required String clientEmail,
    required String requestType,
    this.message = const Value.absent(),
    this.status = const Value.absent(),
    this.adminNotes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       listingId = Value(listingId),
       animalName = Value(animalName),
       clientId = Value(clientId),
       clientName = Value(clientName),
       clientPhone = Value(clientPhone),
       clientEmail = Value(clientEmail),
       requestType = Value(requestType),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<AdoptionRequestsTableData> custom({
    Expression<String>? id,
    Expression<String>? listingId,
    Expression<String>? animalName,
    Expression<String>? clientId,
    Expression<String>? clientName,
    Expression<String>? clientPhone,
    Expression<String>? clientEmail,
    Expression<String>? requestType,
    Expression<String>? message,
    Expression<String>? status,
    Expression<String>? adminNotes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (listingId != null) 'listing_id': listingId,
      if (animalName != null) 'animal_name': animalName,
      if (clientId != null) 'client_id': clientId,
      if (clientName != null) 'client_name': clientName,
      if (clientPhone != null) 'client_phone': clientPhone,
      if (clientEmail != null) 'client_email': clientEmail,
      if (requestType != null) 'request_type': requestType,
      if (message != null) 'message': message,
      if (status != null) 'status': status,
      if (adminNotes != null) 'admin_notes': adminNotes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdoptionRequestsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? listingId,
    Value<String>? animalName,
    Value<String>? clientId,
    Value<String>? clientName,
    Value<String>? clientPhone,
    Value<String>? clientEmail,
    Value<String>? requestType,
    Value<String?>? message,
    Value<String>? status,
    Value<String?>? adminNotes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<int>? rowid,
  }) {
    return AdoptionRequestsTableCompanion(
      id: id ?? this.id,
      listingId: listingId ?? this.listingId,
      animalName: animalName ?? this.animalName,
      clientId: clientId ?? this.clientId,
      clientName: clientName ?? this.clientName,
      clientPhone: clientPhone ?? this.clientPhone,
      clientEmail: clientEmail ?? this.clientEmail,
      requestType: requestType ?? this.requestType,
      message: message ?? this.message,
      status: status ?? this.status,
      adminNotes: adminNotes ?? this.adminNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (listingId.present) {
      map['listing_id'] = Variable<String>(listingId.value);
    }
    if (animalName.present) {
      map['animal_name'] = Variable<String>(animalName.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (clientPhone.present) {
      map['client_phone'] = Variable<String>(clientPhone.value);
    }
    if (clientEmail.present) {
      map['client_email'] = Variable<String>(clientEmail.value);
    }
    if (requestType.present) {
      map['request_type'] = Variable<String>(requestType.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (adminNotes.present) {
      map['admin_notes'] = Variable<String>(adminNotes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdoptionRequestsTableCompanion(')
          ..write('id: $id, ')
          ..write('listingId: $listingId, ')
          ..write('animalName: $animalName, ')
          ..write('clientId: $clientId, ')
          ..write('clientName: $clientName, ')
          ..write('clientPhone: $clientPhone, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('requestType: $requestType, ')
          ..write('message: $message, ')
          ..write('status: $status, ')
          ..write('adminNotes: $adminNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChatRoomsTableTable extends ChatRoomsTable
    with TableInfo<$ChatRoomsTableTable, ChatRoom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatRoomsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientNameMeta = const VerificationMeta(
    'clientName',
  );
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
    'client_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastMessageMeta = const VerificationMeta(
    'lastMessage',
  );
  @override
  late final GeneratedColumn<String> lastMessage = GeneratedColumn<String>(
    'last_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastMessageTypeMeta = const VerificationMeta(
    'lastMessageType',
  );
  @override
  late final GeneratedColumn<String> lastMessageType = GeneratedColumn<String>(
    'last_message_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastMessageAtMeta = const VerificationMeta(
    'lastMessageAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastMessageAt =
      GeneratedColumn<DateTime>(
        'last_message_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _unreadByAdminMeta = const VerificationMeta(
    'unreadByAdmin',
  );
  @override
  late final GeneratedColumn<int> unreadByAdmin = GeneratedColumn<int>(
    'unread_by_admin',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _unreadByClientMeta = const VerificationMeta(
    'unreadByClient',
  );
  @override
  late final GeneratedColumn<int> unreadByClient = GeneratedColumn<int>(
    'unread_by_client',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientName,
    lastMessage,
    lastMessageType,
    lastMessageAt,
    unreadByAdmin,
    unreadByClient,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_rooms_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatRoom> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('client_name')) {
      context.handle(
        _clientNameMeta,
        clientName.isAcceptableOrUnknown(data['client_name']!, _clientNameMeta),
      );
    } else if (isInserting) {
      context.missing(_clientNameMeta);
    }
    if (data.containsKey('last_message')) {
      context.handle(
        _lastMessageMeta,
        lastMessage.isAcceptableOrUnknown(
          data['last_message']!,
          _lastMessageMeta,
        ),
      );
    }
    if (data.containsKey('last_message_type')) {
      context.handle(
        _lastMessageTypeMeta,
        lastMessageType.isAcceptableOrUnknown(
          data['last_message_type']!,
          _lastMessageTypeMeta,
        ),
      );
    }
    if (data.containsKey('last_message_at')) {
      context.handle(
        _lastMessageAtMeta,
        lastMessageAt.isAcceptableOrUnknown(
          data['last_message_at']!,
          _lastMessageAtMeta,
        ),
      );
    }
    if (data.containsKey('unread_by_admin')) {
      context.handle(
        _unreadByAdminMeta,
        unreadByAdmin.isAcceptableOrUnknown(
          data['unread_by_admin']!,
          _unreadByAdminMeta,
        ),
      );
    }
    if (data.containsKey('unread_by_client')) {
      context.handle(
        _unreadByClientMeta,
        unreadByClient.isAcceptableOrUnknown(
          data['unread_by_client']!,
          _unreadByClientMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatRoom map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatRoom(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      clientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_name'],
      )!,
      lastMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_message'],
      ),
      lastMessageType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_message_type'],
      ),
      lastMessageAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_message_at'],
      ),
      unreadByAdmin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unread_by_admin'],
      )!,
      unreadByClient: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unread_by_client'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ChatRoomsTableTable createAlias(String alias) {
    return $ChatRoomsTableTable(attachedDatabase, alias);
  }
}

class ChatRoom extends DataClass implements Insertable<ChatRoom> {
  final String id;
  final String clientName;
  final String? lastMessage;
  final String? lastMessageType;
  final DateTime? lastMessageAt;
  final int unreadByAdmin;
  final int unreadByClient;
  final DateTime updatedAt;
  const ChatRoom({
    required this.id,
    required this.clientName,
    this.lastMessage,
    this.lastMessageType,
    this.lastMessageAt,
    required this.unreadByAdmin,
    required this.unreadByClient,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['client_name'] = Variable<String>(clientName);
    if (!nullToAbsent || lastMessage != null) {
      map['last_message'] = Variable<String>(lastMessage);
    }
    if (!nullToAbsent || lastMessageType != null) {
      map['last_message_type'] = Variable<String>(lastMessageType);
    }
    if (!nullToAbsent || lastMessageAt != null) {
      map['last_message_at'] = Variable<DateTime>(lastMessageAt);
    }
    map['unread_by_admin'] = Variable<int>(unreadByAdmin);
    map['unread_by_client'] = Variable<int>(unreadByClient);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ChatRoomsTableCompanion toCompanion(bool nullToAbsent) {
    return ChatRoomsTableCompanion(
      id: Value(id),
      clientName: Value(clientName),
      lastMessage: lastMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMessage),
      lastMessageType: lastMessageType == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMessageType),
      lastMessageAt: lastMessageAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMessageAt),
      unreadByAdmin: Value(unreadByAdmin),
      unreadByClient: Value(unreadByClient),
      updatedAt: Value(updatedAt),
    );
  }

  factory ChatRoom.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatRoom(
      id: serializer.fromJson<String>(json['id']),
      clientName: serializer.fromJson<String>(json['clientName']),
      lastMessage: serializer.fromJson<String?>(json['lastMessage']),
      lastMessageType: serializer.fromJson<String?>(json['lastMessageType']),
      lastMessageAt: serializer.fromJson<DateTime?>(json['lastMessageAt']),
      unreadByAdmin: serializer.fromJson<int>(json['unreadByAdmin']),
      unreadByClient: serializer.fromJson<int>(json['unreadByClient']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientName': serializer.toJson<String>(clientName),
      'lastMessage': serializer.toJson<String?>(lastMessage),
      'lastMessageType': serializer.toJson<String?>(lastMessageType),
      'lastMessageAt': serializer.toJson<DateTime?>(lastMessageAt),
      'unreadByAdmin': serializer.toJson<int>(unreadByAdmin),
      'unreadByClient': serializer.toJson<int>(unreadByClient),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ChatRoom copyWith({
    String? id,
    String? clientName,
    Value<String?> lastMessage = const Value.absent(),
    Value<String?> lastMessageType = const Value.absent(),
    Value<DateTime?> lastMessageAt = const Value.absent(),
    int? unreadByAdmin,
    int? unreadByClient,
    DateTime? updatedAt,
  }) => ChatRoom(
    id: id ?? this.id,
    clientName: clientName ?? this.clientName,
    lastMessage: lastMessage.present ? lastMessage.value : this.lastMessage,
    lastMessageType: lastMessageType.present
        ? lastMessageType.value
        : this.lastMessageType,
    lastMessageAt: lastMessageAt.present
        ? lastMessageAt.value
        : this.lastMessageAt,
    unreadByAdmin: unreadByAdmin ?? this.unreadByAdmin,
    unreadByClient: unreadByClient ?? this.unreadByClient,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ChatRoom copyWithCompanion(ChatRoomsTableCompanion data) {
    return ChatRoom(
      id: data.id.present ? data.id.value : this.id,
      clientName: data.clientName.present
          ? data.clientName.value
          : this.clientName,
      lastMessage: data.lastMessage.present
          ? data.lastMessage.value
          : this.lastMessage,
      lastMessageType: data.lastMessageType.present
          ? data.lastMessageType.value
          : this.lastMessageType,
      lastMessageAt: data.lastMessageAt.present
          ? data.lastMessageAt.value
          : this.lastMessageAt,
      unreadByAdmin: data.unreadByAdmin.present
          ? data.unreadByAdmin.value
          : this.unreadByAdmin,
      unreadByClient: data.unreadByClient.present
          ? data.unreadByClient.value
          : this.unreadByClient,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatRoom(')
          ..write('id: $id, ')
          ..write('clientName: $clientName, ')
          ..write('lastMessage: $lastMessage, ')
          ..write('lastMessageType: $lastMessageType, ')
          ..write('lastMessageAt: $lastMessageAt, ')
          ..write('unreadByAdmin: $unreadByAdmin, ')
          ..write('unreadByClient: $unreadByClient, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientName,
    lastMessage,
    lastMessageType,
    lastMessageAt,
    unreadByAdmin,
    unreadByClient,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatRoom &&
          other.id == this.id &&
          other.clientName == this.clientName &&
          other.lastMessage == this.lastMessage &&
          other.lastMessageType == this.lastMessageType &&
          other.lastMessageAt == this.lastMessageAt &&
          other.unreadByAdmin == this.unreadByAdmin &&
          other.unreadByClient == this.unreadByClient &&
          other.updatedAt == this.updatedAt);
}

class ChatRoomsTableCompanion extends UpdateCompanion<ChatRoom> {
  final Value<String> id;
  final Value<String> clientName;
  final Value<String?> lastMessage;
  final Value<String?> lastMessageType;
  final Value<DateTime?> lastMessageAt;
  final Value<int> unreadByAdmin;
  final Value<int> unreadByClient;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ChatRoomsTableCompanion({
    this.id = const Value.absent(),
    this.clientName = const Value.absent(),
    this.lastMessage = const Value.absent(),
    this.lastMessageType = const Value.absent(),
    this.lastMessageAt = const Value.absent(),
    this.unreadByAdmin = const Value.absent(),
    this.unreadByClient = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatRoomsTableCompanion.insert({
    required String id,
    required String clientName,
    this.lastMessage = const Value.absent(),
    this.lastMessageType = const Value.absent(),
    this.lastMessageAt = const Value.absent(),
    this.unreadByAdmin = const Value.absent(),
    this.unreadByClient = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       clientName = Value(clientName),
       updatedAt = Value(updatedAt);
  static Insertable<ChatRoom> custom({
    Expression<String>? id,
    Expression<String>? clientName,
    Expression<String>? lastMessage,
    Expression<String>? lastMessageType,
    Expression<DateTime>? lastMessageAt,
    Expression<int>? unreadByAdmin,
    Expression<int>? unreadByClient,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientName != null) 'client_name': clientName,
      if (lastMessage != null) 'last_message': lastMessage,
      if (lastMessageType != null) 'last_message_type': lastMessageType,
      if (lastMessageAt != null) 'last_message_at': lastMessageAt,
      if (unreadByAdmin != null) 'unread_by_admin': unreadByAdmin,
      if (unreadByClient != null) 'unread_by_client': unreadByClient,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatRoomsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? clientName,
    Value<String?>? lastMessage,
    Value<String?>? lastMessageType,
    Value<DateTime?>? lastMessageAt,
    Value<int>? unreadByAdmin,
    Value<int>? unreadByClient,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ChatRoomsTableCompanion(
      id: id ?? this.id,
      clientName: clientName ?? this.clientName,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageType: lastMessageType ?? this.lastMessageType,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      unreadByAdmin: unreadByAdmin ?? this.unreadByAdmin,
      unreadByClient: unreadByClient ?? this.unreadByClient,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (lastMessage.present) {
      map['last_message'] = Variable<String>(lastMessage.value);
    }
    if (lastMessageType.present) {
      map['last_message_type'] = Variable<String>(lastMessageType.value);
    }
    if (lastMessageAt.present) {
      map['last_message_at'] = Variable<DateTime>(lastMessageAt.value);
    }
    if (unreadByAdmin.present) {
      map['unread_by_admin'] = Variable<int>(unreadByAdmin.value);
    }
    if (unreadByClient.present) {
      map['unread_by_client'] = Variable<int>(unreadByClient.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatRoomsTableCompanion(')
          ..write('id: $id, ')
          ..write('clientName: $clientName, ')
          ..write('lastMessage: $lastMessage, ')
          ..write('lastMessageType: $lastMessageType, ')
          ..write('lastMessageAt: $lastMessageAt, ')
          ..write('unreadByAdmin: $unreadByAdmin, ')
          ..write('unreadByClient: $unreadByClient, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChatMessagesTableTable extends ChatMessagesTable
    with TableInfo<$ChatMessagesTableTable, ChatMessageEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatMessagesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
    'room_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chat_rooms_table (id)',
    ),
  );
  static const VerificationMeta _senderIdMeta = const VerificationMeta(
    'senderId',
  );
  @override
  late final GeneratedColumn<String> senderId = GeneratedColumn<String>(
    'sender_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _senderRoleMeta = const VerificationMeta(
    'senderRole',
  );
  @override
  late final GeneratedColumn<String> senderRole = GeneratedColumn<String>(
    'sender_role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageLocalPathMeta = const VerificationMeta(
    'imageLocalPath',
  );
  @override
  late final GeneratedColumn<String> imageLocalPath = GeneratedColumn<String>(
    'image_local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageRemoteUrlMeta = const VerificationMeta(
    'imageRemoteUrl',
  );
  @override
  late final GeneratedColumn<String> imageRemoteUrl = GeneratedColumn<String>(
    'image_remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cardPayloadMeta = const VerificationMeta(
    'cardPayload',
  );
  @override
  late final GeneratedColumn<String> cardPayload = GeneratedColumn<String>(
    'card_payload',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roomId,
    senderId,
    senderRole,
    type,
    content,
    imageLocalPath,
    imageRemoteUrl,
    cardPayload,
    isRead,
    createdAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_messages_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatMessageEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(
        _senderIdMeta,
        senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('sender_role')) {
      context.handle(
        _senderRoleMeta,
        senderRole.isAcceptableOrUnknown(data['sender_role']!, _senderRoleMeta),
      );
    } else if (isInserting) {
      context.missing(_senderRoleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('image_local_path')) {
      context.handle(
        _imageLocalPathMeta,
        imageLocalPath.isAcceptableOrUnknown(
          data['image_local_path']!,
          _imageLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('image_remote_url')) {
      context.handle(
        _imageRemoteUrlMeta,
        imageRemoteUrl.isAcceptableOrUnknown(
          data['image_remote_url']!,
          _imageRemoteUrlMeta,
        ),
      );
    }
    if (data.containsKey('card_payload')) {
      context.handle(
        _cardPayloadMeta,
        cardPayload.isAcceptableOrUnknown(
          data['card_payload']!,
          _cardPayloadMeta,
        ),
      );
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatMessageEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatMessageEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_id'],
      )!,
      senderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender_id'],
      )!,
      senderRole: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender_role'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      imageLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_local_path'],
      ),
      imageRemoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_remote_url'],
      ),
      cardPayload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_payload'],
      ),
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ChatMessagesTableTable createAlias(String alias) {
    return $ChatMessagesTableTable(attachedDatabase, alias);
  }
}

class ChatMessageEntity extends DataClass
    implements Insertable<ChatMessageEntity> {
  final String id;
  final String roomId;
  final String senderId;
  final String senderRole;
  final String type;
  final String? content;
  final String? imageLocalPath;
  final String? imageRemoteUrl;
  final String? cardPayload;
  final bool isRead;
  final DateTime createdAt;
  final String syncStatus;
  const ChatMessageEntity({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.senderRole,
    required this.type,
    this.content,
    this.imageLocalPath,
    this.imageRemoteUrl,
    this.cardPayload,
    required this.isRead,
    required this.createdAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_id'] = Variable<String>(roomId);
    map['sender_id'] = Variable<String>(senderId);
    map['sender_role'] = Variable<String>(senderRole);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || imageLocalPath != null) {
      map['image_local_path'] = Variable<String>(imageLocalPath);
    }
    if (!nullToAbsent || imageRemoteUrl != null) {
      map['image_remote_url'] = Variable<String>(imageRemoteUrl);
    }
    if (!nullToAbsent || cardPayload != null) {
      map['card_payload'] = Variable<String>(cardPayload);
    }
    map['is_read'] = Variable<bool>(isRead);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ChatMessagesTableCompanion toCompanion(bool nullToAbsent) {
    return ChatMessagesTableCompanion(
      id: Value(id),
      roomId: Value(roomId),
      senderId: Value(senderId),
      senderRole: Value(senderRole),
      type: Value(type),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      imageLocalPath: imageLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(imageLocalPath),
      imageRemoteUrl: imageRemoteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageRemoteUrl),
      cardPayload: cardPayload == null && nullToAbsent
          ? const Value.absent()
          : Value(cardPayload),
      isRead: Value(isRead),
      createdAt: Value(createdAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ChatMessageEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatMessageEntity(
      id: serializer.fromJson<String>(json['id']),
      roomId: serializer.fromJson<String>(json['roomId']),
      senderId: serializer.fromJson<String>(json['senderId']),
      senderRole: serializer.fromJson<String>(json['senderRole']),
      type: serializer.fromJson<String>(json['type']),
      content: serializer.fromJson<String?>(json['content']),
      imageLocalPath: serializer.fromJson<String?>(json['imageLocalPath']),
      imageRemoteUrl: serializer.fromJson<String?>(json['imageRemoteUrl']),
      cardPayload: serializer.fromJson<String?>(json['cardPayload']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roomId': serializer.toJson<String>(roomId),
      'senderId': serializer.toJson<String>(senderId),
      'senderRole': serializer.toJson<String>(senderRole),
      'type': serializer.toJson<String>(type),
      'content': serializer.toJson<String?>(content),
      'imageLocalPath': serializer.toJson<String?>(imageLocalPath),
      'imageRemoteUrl': serializer.toJson<String?>(imageRemoteUrl),
      'cardPayload': serializer.toJson<String?>(cardPayload),
      'isRead': serializer.toJson<bool>(isRead),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ChatMessageEntity copyWith({
    String? id,
    String? roomId,
    String? senderId,
    String? senderRole,
    String? type,
    Value<String?> content = const Value.absent(),
    Value<String?> imageLocalPath = const Value.absent(),
    Value<String?> imageRemoteUrl = const Value.absent(),
    Value<String?> cardPayload = const Value.absent(),
    bool? isRead,
    DateTime? createdAt,
    String? syncStatus,
  }) => ChatMessageEntity(
    id: id ?? this.id,
    roomId: roomId ?? this.roomId,
    senderId: senderId ?? this.senderId,
    senderRole: senderRole ?? this.senderRole,
    type: type ?? this.type,
    content: content.present ? content.value : this.content,
    imageLocalPath: imageLocalPath.present
        ? imageLocalPath.value
        : this.imageLocalPath,
    imageRemoteUrl: imageRemoteUrl.present
        ? imageRemoteUrl.value
        : this.imageRemoteUrl,
    cardPayload: cardPayload.present ? cardPayload.value : this.cardPayload,
    isRead: isRead ?? this.isRead,
    createdAt: createdAt ?? this.createdAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ChatMessageEntity copyWithCompanion(ChatMessagesTableCompanion data) {
    return ChatMessageEntity(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      senderId: data.senderId.present ? data.senderId.value : this.senderId,
      senderRole: data.senderRole.present
          ? data.senderRole.value
          : this.senderRole,
      type: data.type.present ? data.type.value : this.type,
      content: data.content.present ? data.content.value : this.content,
      imageLocalPath: data.imageLocalPath.present
          ? data.imageLocalPath.value
          : this.imageLocalPath,
      imageRemoteUrl: data.imageRemoteUrl.present
          ? data.imageRemoteUrl.value
          : this.imageRemoteUrl,
      cardPayload: data.cardPayload.present
          ? data.cardPayload.value
          : this.cardPayload,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessageEntity(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('senderId: $senderId, ')
          ..write('senderRole: $senderRole, ')
          ..write('type: $type, ')
          ..write('content: $content, ')
          ..write('imageLocalPath: $imageLocalPath, ')
          ..write('imageRemoteUrl: $imageRemoteUrl, ')
          ..write('cardPayload: $cardPayload, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    roomId,
    senderId,
    senderRole,
    type,
    content,
    imageLocalPath,
    imageRemoteUrl,
    cardPayload,
    isRead,
    createdAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatMessageEntity &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.senderId == this.senderId &&
          other.senderRole == this.senderRole &&
          other.type == this.type &&
          other.content == this.content &&
          other.imageLocalPath == this.imageLocalPath &&
          other.imageRemoteUrl == this.imageRemoteUrl &&
          other.cardPayload == this.cardPayload &&
          other.isRead == this.isRead &&
          other.createdAt == this.createdAt &&
          other.syncStatus == this.syncStatus);
}

class ChatMessagesTableCompanion extends UpdateCompanion<ChatMessageEntity> {
  final Value<String> id;
  final Value<String> roomId;
  final Value<String> senderId;
  final Value<String> senderRole;
  final Value<String> type;
  final Value<String?> content;
  final Value<String?> imageLocalPath;
  final Value<String?> imageRemoteUrl;
  final Value<String?> cardPayload;
  final Value<bool> isRead;
  final Value<DateTime> createdAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ChatMessagesTableCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.senderId = const Value.absent(),
    this.senderRole = const Value.absent(),
    this.type = const Value.absent(),
    this.content = const Value.absent(),
    this.imageLocalPath = const Value.absent(),
    this.imageRemoteUrl = const Value.absent(),
    this.cardPayload = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatMessagesTableCompanion.insert({
    required String id,
    required String roomId,
    required String senderId,
    required String senderRole,
    required String type,
    this.content = const Value.absent(),
    this.imageLocalPath = const Value.absent(),
    this.imageRemoteUrl = const Value.absent(),
    this.cardPayload = const Value.absent(),
    this.isRead = const Value.absent(),
    required DateTime createdAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roomId = Value(roomId),
       senderId = Value(senderId),
       senderRole = Value(senderRole),
       type = Value(type),
       createdAt = Value(createdAt);
  static Insertable<ChatMessageEntity> custom({
    Expression<String>? id,
    Expression<String>? roomId,
    Expression<String>? senderId,
    Expression<String>? senderRole,
    Expression<String>? type,
    Expression<String>? content,
    Expression<String>? imageLocalPath,
    Expression<String>? imageRemoteUrl,
    Expression<String>? cardPayload,
    Expression<bool>? isRead,
    Expression<DateTime>? createdAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (senderId != null) 'sender_id': senderId,
      if (senderRole != null) 'sender_role': senderRole,
      if (type != null) 'type': type,
      if (content != null) 'content': content,
      if (imageLocalPath != null) 'image_local_path': imageLocalPath,
      if (imageRemoteUrl != null) 'image_remote_url': imageRemoteUrl,
      if (cardPayload != null) 'card_payload': cardPayload,
      if (isRead != null) 'is_read': isRead,
      if (createdAt != null) 'created_at': createdAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatMessagesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? roomId,
    Value<String>? senderId,
    Value<String>? senderRole,
    Value<String>? type,
    Value<String?>? content,
    Value<String?>? imageLocalPath,
    Value<String?>? imageRemoteUrl,
    Value<String?>? cardPayload,
    Value<bool>? isRead,
    Value<DateTime>? createdAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return ChatMessagesTableCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      senderId: senderId ?? this.senderId,
      senderRole: senderRole ?? this.senderRole,
      type: type ?? this.type,
      content: content ?? this.content,
      imageLocalPath: imageLocalPath ?? this.imageLocalPath,
      imageRemoteUrl: imageRemoteUrl ?? this.imageRemoteUrl,
      cardPayload: cardPayload ?? this.cardPayload,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<String>(senderId.value);
    }
    if (senderRole.present) {
      map['sender_role'] = Variable<String>(senderRole.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (imageLocalPath.present) {
      map['image_local_path'] = Variable<String>(imageLocalPath.value);
    }
    if (imageRemoteUrl.present) {
      map['image_remote_url'] = Variable<String>(imageRemoteUrl.value);
    }
    if (cardPayload.present) {
      map['card_payload'] = Variable<String>(cardPayload.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessagesTableCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('senderId: $senderId, ')
          ..write('senderRole: $senderRole, ')
          ..write('type: $type, ')
          ..write('content: $content, ')
          ..write('imageLocalPath: $imageLocalPath, ')
          ..write('imageRemoteUrl: $imageRemoteUrl, ')
          ..write('cardPayload: $cardPayload, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $PetsTableTable petsTable = $PetsTableTable(this);
  late final $AppointmentsTableTable appointmentsTable =
      $AppointmentsTableTable(this);
  late final $MedicalRecordsTableTable medicalRecordsTable =
      $MedicalRecordsTableTable(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  late final $OrdersTableTable ordersTable = $OrdersTableTable(this);
  late final $OrderItemsTableTable orderItemsTable = $OrderItemsTableTable(
    this,
  );
  late final $LocationTracksTableTable locationTracksTable =
      $LocationTracksTableTable(this);
  late final $AdoptionRequestsTableTable adoptionRequestsTable =
      $AdoptionRequestsTableTable(this);
  late final $ChatRoomsTableTable chatRoomsTable = $ChatRoomsTableTable(this);
  late final $ChatMessagesTableTable chatMessagesTable =
      $ChatMessagesTableTable(this);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  late final PetsDao petsDao = PetsDao(this as AppDatabase);
  late final AppointmentsDao appointmentsDao = AppointmentsDao(
    this as AppDatabase,
  );
  late final MedicalRecordsDao medicalRecordsDao = MedicalRecordsDao(
    this as AppDatabase,
  );
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  late final OrdersDao ordersDao = OrdersDao(this as AppDatabase);
  late final LocationTracksDao locationTracksDao = LocationTracksDao(
    this as AppDatabase,
  );
  late final AdoptionRequestsDao adoptionRequestsDao = AdoptionRequestsDao(
    this as AppDatabase,
  );
  late final ChatDao chatDao = ChatDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usersTable,
    petsTable,
    appointmentsTable,
    medicalRecordsTable,
    productsTable,
    ordersTable,
    orderItemsTable,
    locationTracksTable,
    adoptionRequestsTable,
    chatRoomsTable,
    chatMessagesTable,
  ];
}

typedef $$UsersTableTableCreateCompanionBuilder =
    UsersTableCompanion Function({
      required String id,
      Value<String?> firebaseUid,
      required String email,
      required String displayName,
      Value<String?> photoUrl,
      Value<String> role,
      Value<bool> isEmailVerified,
      Value<bool> isActive,
      Value<String?> phoneNumber,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$UsersTableTableUpdateCompanionBuilder =
    UsersTableCompanion Function({
      Value<String> id,
      Value<String?> firebaseUid,
      Value<String> email,
      Value<String> displayName,
      Value<String?> photoUrl,
      Value<String> role,
      Value<bool> isEmailVerified,
      Value<bool> isActive,
      Value<String?> phoneNumber,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$UsersTableTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData> {
  $$UsersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PetsTableTable, List<PetsTableData>>
  _petsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.petsTable,
    aliasName: $_aliasNameGenerator(db.usersTable.id, db.petsTable.ownerId),
  );

  $$PetsTableTableProcessedTableManager get petsTableRefs {
    final manager = $$PetsTableTableTableManager(
      $_db,
      $_db.petsTable,
    ).filter((f) => f.ownerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_petsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MedicalRecordsTableTable,
    List<MedicalRecordsTableData>
  >
  _medicalRecordsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.medicalRecordsTable,
        aliasName: $_aliasNameGenerator(
          db.usersTable.id,
          db.medicalRecordsTable.vetId,
        ),
      );

  $$MedicalRecordsTableTableProcessedTableManager get medicalRecordsTableRefs {
    final manager = $$MedicalRecordsTableTableTableManager(
      $_db,
      $_db.medicalRecordsTable,
    ).filter((f) => f.vetId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _medicalRecordsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $LocationTracksTableTable,
    List<LocationTracksTableData>
  >
  _locationTracksTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.locationTracksTable,
        aliasName: $_aliasNameGenerator(
          db.usersTable.id,
          db.locationTracksTable.driverId,
        ),
      );

  $$LocationTracksTableTableProcessedTableManager get locationTracksTableRefs {
    final manager = $$LocationTracksTableTableTableManager(
      $_db,
      $_db.locationTracksTable,
    ).filter((f) => f.driverId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _locationTracksTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $AdoptionRequestsTableTable,
    List<AdoptionRequestsTableData>
  >
  _adoptionRequestsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.adoptionRequestsTable,
        aliasName: $_aliasNameGenerator(
          db.usersTable.id,
          db.adoptionRequestsTable.clientId,
        ),
      );

  $$AdoptionRequestsTableTableProcessedTableManager
  get adoptionRequestsTableRefs {
    final manager = $$AdoptionRequestsTableTableTableManager(
      $_db,
      $_db.adoptionRequestsTable,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _adoptionRequestsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEmailVerified => $composableBuilder(
    column: $table.isEmailVerified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> petsTableRefs(
    Expression<bool> Function($$PetsTableTableFilterComposer f) f,
  ) {
    final $$PetsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.petsTable,
      getReferencedColumn: (t) => t.ownerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableTableFilterComposer(
            $db: $db,
            $table: $db.petsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicalRecordsTableRefs(
    Expression<bool> Function($$MedicalRecordsTableTableFilterComposer f) f,
  ) {
    final $$MedicalRecordsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicalRecordsTable,
      getReferencedColumn: (t) => t.vetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicalRecordsTableTableFilterComposer(
            $db: $db,
            $table: $db.medicalRecordsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> locationTracksTableRefs(
    Expression<bool> Function($$LocationTracksTableTableFilterComposer f) f,
  ) {
    final $$LocationTracksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.locationTracksTable,
      getReferencedColumn: (t) => t.driverId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTracksTableTableFilterComposer(
            $db: $db,
            $table: $db.locationTracksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> adoptionRequestsTableRefs(
    Expression<bool> Function($$AdoptionRequestsTableTableFilterComposer f) f,
  ) {
    final $$AdoptionRequestsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.adoptionRequestsTable,
          getReferencedColumn: (t) => t.clientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AdoptionRequestsTableTableFilterComposer(
                $db: $db,
                $table: $db.adoptionRequestsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEmailVerified => $composableBuilder(
    column: $table.isEmailVerified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<bool> get isEmailVerified => $composableBuilder(
    column: $table.isEmailVerified,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  Expression<T> petsTableRefs<T extends Object>(
    Expression<T> Function($$PetsTableTableAnnotationComposer a) f,
  ) {
    final $$PetsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.petsTable,
      getReferencedColumn: (t) => t.ownerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.petsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> medicalRecordsTableRefs<T extends Object>(
    Expression<T> Function($$MedicalRecordsTableTableAnnotationComposer a) f,
  ) {
    final $$MedicalRecordsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.medicalRecordsTable,
          getReferencedColumn: (t) => t.vetId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MedicalRecordsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.medicalRecordsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> locationTracksTableRefs<T extends Object>(
    Expression<T> Function($$LocationTracksTableTableAnnotationComposer a) f,
  ) {
    final $$LocationTracksTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.locationTracksTable,
          getReferencedColumn: (t) => t.driverId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LocationTracksTableTableAnnotationComposer(
                $db: $db,
                $table: $db.locationTracksTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> adoptionRequestsTableRefs<T extends Object>(
    Expression<T> Function($$AdoptionRequestsTableTableAnnotationComposer a) f,
  ) {
    final $$AdoptionRequestsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.adoptionRequestsTable,
          getReferencedColumn: (t) => t.clientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AdoptionRequestsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.adoptionRequestsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTableTable,
          UsersTableData,
          $$UsersTableTableFilterComposer,
          $$UsersTableTableOrderingComposer,
          $$UsersTableTableAnnotationComposer,
          $$UsersTableTableCreateCompanionBuilder,
          $$UsersTableTableUpdateCompanionBuilder,
          (UsersTableData, $$UsersTableTableReferences),
          UsersTableData,
          PrefetchHooks Function({
            bool petsTableRefs,
            bool medicalRecordsTableRefs,
            bool locationTracksTableRefs,
            bool adoptionRequestsTableRefs,
          })
        > {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> firebaseUid = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<bool> isEmailVerified = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersTableCompanion(
                id: id,
                firebaseUid: firebaseUid,
                email: email,
                displayName: displayName,
                photoUrl: photoUrl,
                role: role,
                isEmailVerified: isEmailVerified,
                isActive: isActive,
                phoneNumber: phoneNumber,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> firebaseUid = const Value.absent(),
                required String email,
                required String displayName,
                Value<String?> photoUrl = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<bool> isEmailVerified = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersTableCompanion.insert(
                id: id,
                firebaseUid: firebaseUid,
                email: email,
                displayName: displayName,
                photoUrl: photoUrl,
                role: role,
                isEmailVerified: isEmailVerified,
                isActive: isActive,
                phoneNumber: phoneNumber,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UsersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                petsTableRefs = false,
                medicalRecordsTableRefs = false,
                locationTracksTableRefs = false,
                adoptionRequestsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (petsTableRefs) db.petsTable,
                    if (medicalRecordsTableRefs) db.medicalRecordsTable,
                    if (locationTracksTableRefs) db.locationTracksTable,
                    if (adoptionRequestsTableRefs) db.adoptionRequestsTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (petsTableRefs)
                        await $_getPrefetchedData<
                          UsersTableData,
                          $UsersTableTable,
                          PetsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableTableReferences
                              ._petsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).petsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicalRecordsTableRefs)
                        await $_getPrefetchedData<
                          UsersTableData,
                          $UsersTableTable,
                          MedicalRecordsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableTableReferences
                              ._medicalRecordsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).medicalRecordsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vetId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (locationTracksTableRefs)
                        await $_getPrefetchedData<
                          UsersTableData,
                          $UsersTableTable,
                          LocationTracksTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableTableReferences
                              ._locationTracksTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).locationTracksTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.driverId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (adoptionRequestsTableRefs)
                        await $_getPrefetchedData<
                          UsersTableData,
                          $UsersTableTable,
                          AdoptionRequestsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableTableReferences
                              ._adoptionRequestsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).adoptionRequestsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.clientId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTableTable,
      UsersTableData,
      $$UsersTableTableFilterComposer,
      $$UsersTableTableOrderingComposer,
      $$UsersTableTableAnnotationComposer,
      $$UsersTableTableCreateCompanionBuilder,
      $$UsersTableTableUpdateCompanionBuilder,
      (UsersTableData, $$UsersTableTableReferences),
      UsersTableData,
      PrefetchHooks Function({
        bool petsTableRefs,
        bool medicalRecordsTableRefs,
        bool locationTracksTableRefs,
        bool adoptionRequestsTableRefs,
      })
    >;
typedef $$PetsTableTableCreateCompanionBuilder =
    PetsTableCompanion Function({
      required String id,
      required String ownerId,
      required String name,
      required String species,
      Value<String?> breed,
      Value<String?> gender,
      Value<DateTime?> birthDate,
      Value<double?> weightKg,
      Value<String?> colorDesc,
      Value<bool> isNeutered,
      Value<bool> isForSale,
      Value<bool> isForAdoption,
      Value<double?> salePrice,
      Value<String?> photoLocalPath,
      Value<String?> photoRemoteUrl,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$PetsTableTableUpdateCompanionBuilder =
    PetsTableCompanion Function({
      Value<String> id,
      Value<String> ownerId,
      Value<String> name,
      Value<String> species,
      Value<String?> breed,
      Value<String?> gender,
      Value<DateTime?> birthDate,
      Value<double?> weightKg,
      Value<String?> colorDesc,
      Value<bool> isNeutered,
      Value<bool> isForSale,
      Value<bool> isForAdoption,
      Value<double?> salePrice,
      Value<String?> photoLocalPath,
      Value<String?> photoRemoteUrl,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$PetsTableTableReferences
    extends BaseReferences<_$AppDatabase, $PetsTableTable, PetsTableData> {
  $$PetsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTableTable _ownerIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(db.petsTable.ownerId, db.usersTable.id),
      );

  $$UsersTableTableProcessedTableManager get ownerId {
    final $_column = $_itemColumn<String>('owner_id')!;

    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $AppointmentsTableTable,
    List<AppointmentsTableData>
  >
  _appointmentsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.appointmentsTable,
        aliasName: $_aliasNameGenerator(
          db.petsTable.id,
          db.appointmentsTable.petId,
        ),
      );

  $$AppointmentsTableTableProcessedTableManager get appointmentsTableRefs {
    final manager = $$AppointmentsTableTableTableManager(
      $_db,
      $_db.appointmentsTable,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _appointmentsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MedicalRecordsTableTable,
    List<MedicalRecordsTableData>
  >
  _medicalRecordsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.medicalRecordsTable,
        aliasName: $_aliasNameGenerator(
          db.petsTable.id,
          db.medicalRecordsTable.petId,
        ),
      );

  $$MedicalRecordsTableTableProcessedTableManager get medicalRecordsTableRefs {
    final manager = $$MedicalRecordsTableTableTableManager(
      $_db,
      $_db.medicalRecordsTable,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _medicalRecordsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PetsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PetsTableTable> {
  $$PetsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorDesc => $composableBuilder(
    column: $table.colorDesc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNeutered => $composableBuilder(
    column: $table.isNeutered,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isForSale => $composableBuilder(
    column: $table.isForSale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isForAdoption => $composableBuilder(
    column: $table.isForAdoption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoLocalPath => $composableBuilder(
    column: $table.photoLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoRemoteUrl => $composableBuilder(
    column: $table.photoRemoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableTableFilterComposer get ownerId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> appointmentsTableRefs(
    Expression<bool> Function($$AppointmentsTableTableFilterComposer f) f,
  ) {
    final $$AppointmentsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appointmentsTable,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentsTableTableFilterComposer(
            $db: $db,
            $table: $db.appointmentsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicalRecordsTableRefs(
    Expression<bool> Function($$MedicalRecordsTableTableFilterComposer f) f,
  ) {
    final $$MedicalRecordsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicalRecordsTable,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicalRecordsTableTableFilterComposer(
            $db: $db,
            $table: $db.medicalRecordsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PetsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PetsTableTable> {
  $$PetsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorDesc => $composableBuilder(
    column: $table.colorDesc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNeutered => $composableBuilder(
    column: $table.isNeutered,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isForSale => $composableBuilder(
    column: $table.isForSale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isForAdoption => $composableBuilder(
    column: $table.isForAdoption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoLocalPath => $composableBuilder(
    column: $table.photoLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoRemoteUrl => $composableBuilder(
    column: $table.photoRemoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableTableOrderingComposer get ownerId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PetsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetsTableTable> {
  $$PetsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<String> get colorDesc =>
      $composableBuilder(column: $table.colorDesc, builder: (column) => column);

  GeneratedColumn<bool> get isNeutered => $composableBuilder(
    column: $table.isNeutered,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isForSale =>
      $composableBuilder(column: $table.isForSale, builder: (column) => column);

  GeneratedColumn<bool> get isForAdoption => $composableBuilder(
    column: $table.isForAdoption,
    builder: (column) => column,
  );

  GeneratedColumn<double> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<String> get photoLocalPath => $composableBuilder(
    column: $table.photoLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoRemoteUrl => $composableBuilder(
    column: $table.photoRemoteUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  $$UsersTableTableAnnotationComposer get ownerId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> appointmentsTableRefs<T extends Object>(
    Expression<T> Function($$AppointmentsTableTableAnnotationComposer a) f,
  ) {
    final $$AppointmentsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.appointmentsTable,
          getReferencedColumn: (t) => t.petId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AppointmentsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.appointmentsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> medicalRecordsTableRefs<T extends Object>(
    Expression<T> Function($$MedicalRecordsTableTableAnnotationComposer a) f,
  ) {
    final $$MedicalRecordsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.medicalRecordsTable,
          getReferencedColumn: (t) => t.petId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MedicalRecordsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.medicalRecordsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PetsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PetsTableTable,
          PetsTableData,
          $$PetsTableTableFilterComposer,
          $$PetsTableTableOrderingComposer,
          $$PetsTableTableAnnotationComposer,
          $$PetsTableTableCreateCompanionBuilder,
          $$PetsTableTableUpdateCompanionBuilder,
          (PetsTableData, $$PetsTableTableReferences),
          PetsTableData,
          PrefetchHooks Function({
            bool ownerId,
            bool appointmentsTableRefs,
            bool medicalRecordsTableRefs,
          })
        > {
  $$PetsTableTableTableManager(_$AppDatabase db, $PetsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PetsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PetsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PetsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<String?> breed = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<String?> colorDesc = const Value.absent(),
                Value<bool> isNeutered = const Value.absent(),
                Value<bool> isForSale = const Value.absent(),
                Value<bool> isForAdoption = const Value.absent(),
                Value<double?> salePrice = const Value.absent(),
                Value<String?> photoLocalPath = const Value.absent(),
                Value<String?> photoRemoteUrl = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetsTableCompanion(
                id: id,
                ownerId: ownerId,
                name: name,
                species: species,
                breed: breed,
                gender: gender,
                birthDate: birthDate,
                weightKg: weightKg,
                colorDesc: colorDesc,
                isNeutered: isNeutered,
                isForSale: isForSale,
                isForAdoption: isForAdoption,
                salePrice: salePrice,
                photoLocalPath: photoLocalPath,
                photoRemoteUrl: photoRemoteUrl,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerId,
                required String name,
                required String species,
                Value<String?> breed = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<String?> colorDesc = const Value.absent(),
                Value<bool> isNeutered = const Value.absent(),
                Value<bool> isForSale = const Value.absent(),
                Value<bool> isForAdoption = const Value.absent(),
                Value<double?> salePrice = const Value.absent(),
                Value<String?> photoLocalPath = const Value.absent(),
                Value<String?> photoRemoteUrl = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetsTableCompanion.insert(
                id: id,
                ownerId: ownerId,
                name: name,
                species: species,
                breed: breed,
                gender: gender,
                birthDate: birthDate,
                weightKg: weightKg,
                colorDesc: colorDesc,
                isNeutered: isNeutered,
                isForSale: isForSale,
                isForAdoption: isForAdoption,
                salePrice: salePrice,
                photoLocalPath: photoLocalPath,
                photoRemoteUrl: photoRemoteUrl,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PetsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ownerId = false,
                appointmentsTableRefs = false,
                medicalRecordsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (appointmentsTableRefs) db.appointmentsTable,
                    if (medicalRecordsTableRefs) db.medicalRecordsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerId,
                                    referencedTable: $$PetsTableTableReferences
                                        ._ownerIdTable(db),
                                    referencedColumn: $$PetsTableTableReferences
                                        ._ownerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (appointmentsTableRefs)
                        await $_getPrefetchedData<
                          PetsTableData,
                          $PetsTableTable,
                          AppointmentsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$PetsTableTableReferences
                              ._appointmentsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PetsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).appointmentsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicalRecordsTableRefs)
                        await $_getPrefetchedData<
                          PetsTableData,
                          $PetsTableTable,
                          MedicalRecordsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$PetsTableTableReferences
                              ._medicalRecordsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PetsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).medicalRecordsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PetsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PetsTableTable,
      PetsTableData,
      $$PetsTableTableFilterComposer,
      $$PetsTableTableOrderingComposer,
      $$PetsTableTableAnnotationComposer,
      $$PetsTableTableCreateCompanionBuilder,
      $$PetsTableTableUpdateCompanionBuilder,
      (PetsTableData, $$PetsTableTableReferences),
      PetsTableData,
      PrefetchHooks Function({
        bool ownerId,
        bool appointmentsTableRefs,
        bool medicalRecordsTableRefs,
      })
    >;
typedef $$AppointmentsTableTableCreateCompanionBuilder =
    AppointmentsTableCompanion Function({
      required String id,
      required String petId,
      required String clientId,
      Value<String?> staffId,
      required String serviceType,
      Value<String> status,
      required DateTime scheduledAt,
      Value<int> durationMinutes,
      Value<double?> price,
      Value<String?> notes,
      Value<bool> reminderSent,
      Value<bool> whatsappSent,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$AppointmentsTableTableUpdateCompanionBuilder =
    AppointmentsTableCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> clientId,
      Value<String?> staffId,
      Value<String> serviceType,
      Value<String> status,
      Value<DateTime> scheduledAt,
      Value<int> durationMinutes,
      Value<double?> price,
      Value<String?> notes,
      Value<bool> reminderSent,
      Value<bool> whatsappSent,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$AppointmentsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AppointmentsTableTable,
          AppointmentsTableData
        > {
  $$AppointmentsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PetsTableTable _petIdTable(_$AppDatabase db) =>
      db.petsTable.createAlias(
        $_aliasNameGenerator(db.appointmentsTable.petId, db.petsTable.id),
      );

  $$PetsTableTableProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $$PetsTableTableTableManager(
      $_db,
      $_db.petsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTableTable _clientIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(db.appointmentsTable.clientId, db.usersTable.id),
      );

  $$UsersTableTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<String>('client_id')!;

    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTableTable _staffIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(db.appointmentsTable.staffId, db.usersTable.id),
      );

  $$UsersTableTableProcessedTableManager? get staffId {
    final $_column = $_itemColumn<String>('staff_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_staffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AppointmentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppointmentsTableTable> {
  $$AppointmentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceType => $composableBuilder(
    column: $table.serviceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reminderSent => $composableBuilder(
    column: $table.reminderSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get whatsappSent => $composableBuilder(
    column: $table.whatsappSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$PetsTableTableFilterComposer get petId {
    final $$PetsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.petsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableTableFilterComposer(
            $db: $db,
            $table: $db.petsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableFilterComposer get clientId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableFilterComposer get staffId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppointmentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppointmentsTableTable> {
  $$AppointmentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceType => $composableBuilder(
    column: $table.serviceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reminderSent => $composableBuilder(
    column: $table.reminderSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get whatsappSent => $composableBuilder(
    column: $table.whatsappSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$PetsTableTableOrderingComposer get petId {
    final $$PetsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.petsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableTableOrderingComposer(
            $db: $db,
            $table: $db.petsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableOrderingComposer get clientId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableOrderingComposer get staffId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppointmentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppointmentsTableTable> {
  $$AppointmentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get serviceType => $composableBuilder(
    column: $table.serviceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get reminderSent => $composableBuilder(
    column: $table.reminderSent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get whatsappSent => $composableBuilder(
    column: $table.whatsappSent,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  $$PetsTableTableAnnotationComposer get petId {
    final $$PetsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.petsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.petsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableAnnotationComposer get clientId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableAnnotationComposer get staffId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.staffId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppointmentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppointmentsTableTable,
          AppointmentsTableData,
          $$AppointmentsTableTableFilterComposer,
          $$AppointmentsTableTableOrderingComposer,
          $$AppointmentsTableTableAnnotationComposer,
          $$AppointmentsTableTableCreateCompanionBuilder,
          $$AppointmentsTableTableUpdateCompanionBuilder,
          (AppointmentsTableData, $$AppointmentsTableTableReferences),
          AppointmentsTableData,
          PrefetchHooks Function({bool petId, bool clientId, bool staffId})
        > {
  $$AppointmentsTableTableTableManager(
    _$AppDatabase db,
    $AppointmentsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppointmentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppointmentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppointmentsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String?> staffId = const Value.absent(),
                Value<String> serviceType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
                Value<double?> price = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> reminderSent = const Value.absent(),
                Value<bool> whatsappSent = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppointmentsTableCompanion(
                id: id,
                petId: petId,
                clientId: clientId,
                staffId: staffId,
                serviceType: serviceType,
                status: status,
                scheduledAt: scheduledAt,
                durationMinutes: durationMinutes,
                price: price,
                notes: notes,
                reminderSent: reminderSent,
                whatsappSent: whatsappSent,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String clientId,
                Value<String?> staffId = const Value.absent(),
                required String serviceType,
                Value<String> status = const Value.absent(),
                required DateTime scheduledAt,
                Value<int> durationMinutes = const Value.absent(),
                Value<double?> price = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> reminderSent = const Value.absent(),
                Value<bool> whatsappSent = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppointmentsTableCompanion.insert(
                id: id,
                petId: petId,
                clientId: clientId,
                staffId: staffId,
                serviceType: serviceType,
                status: status,
                scheduledAt: scheduledAt,
                durationMinutes: durationMinutes,
                price: price,
                notes: notes,
                reminderSent: reminderSent,
                whatsappSent: whatsappSent,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppointmentsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({petId = false, clientId = false, staffId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (petId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.petId,
                                    referencedTable:
                                        $$AppointmentsTableTableReferences
                                            ._petIdTable(db),
                                    referencedColumn:
                                        $$AppointmentsTableTableReferences
                                            ._petIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (clientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.clientId,
                                    referencedTable:
                                        $$AppointmentsTableTableReferences
                                            ._clientIdTable(db),
                                    referencedColumn:
                                        $$AppointmentsTableTableReferences
                                            ._clientIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (staffId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.staffId,
                                    referencedTable:
                                        $$AppointmentsTableTableReferences
                                            ._staffIdTable(db),
                                    referencedColumn:
                                        $$AppointmentsTableTableReferences
                                            ._staffIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AppointmentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppointmentsTableTable,
      AppointmentsTableData,
      $$AppointmentsTableTableFilterComposer,
      $$AppointmentsTableTableOrderingComposer,
      $$AppointmentsTableTableAnnotationComposer,
      $$AppointmentsTableTableCreateCompanionBuilder,
      $$AppointmentsTableTableUpdateCompanionBuilder,
      (AppointmentsTableData, $$AppointmentsTableTableReferences),
      AppointmentsTableData,
      PrefetchHooks Function({bool petId, bool clientId, bool staffId})
    >;
typedef $$MedicalRecordsTableTableCreateCompanionBuilder =
    MedicalRecordsTableCompanion Function({
      required String id,
      required String petId,
      required String vetId,
      required String recordType,
      required String title,
      required String description,
      Value<double?> weightKg,
      Value<String?> medicationName,
      Value<String?> dosage,
      Value<DateTime?> nextDueDate,
      Value<String?> attachmentLocalPath,
      Value<String?> attachmentRemoteUrl,
      Value<String?> conflictNotes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$MedicalRecordsTableTableUpdateCompanionBuilder =
    MedicalRecordsTableCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> vetId,
      Value<String> recordType,
      Value<String> title,
      Value<String> description,
      Value<double?> weightKg,
      Value<String?> medicationName,
      Value<String?> dosage,
      Value<DateTime?> nextDueDate,
      Value<String?> attachmentLocalPath,
      Value<String?> attachmentRemoteUrl,
      Value<String?> conflictNotes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$MedicalRecordsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MedicalRecordsTableTable,
          MedicalRecordsTableData
        > {
  $$MedicalRecordsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PetsTableTable _petIdTable(_$AppDatabase db) =>
      db.petsTable.createAlias(
        $_aliasNameGenerator(db.medicalRecordsTable.petId, db.petsTable.id),
      );

  $$PetsTableTableProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $$PetsTableTableTableManager(
      $_db,
      $_db.petsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTableTable _vetIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(db.medicalRecordsTable.vetId, db.usersTable.id),
      );

  $$UsersTableTableProcessedTableManager get vetId {
    final $_column = $_itemColumn<String>('vet_id')!;

    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MedicalRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MedicalRecordsTableTable> {
  $$MedicalRecordsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attachmentLocalPath => $composableBuilder(
    column: $table.attachmentLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attachmentRemoteUrl => $composableBuilder(
    column: $table.attachmentRemoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictNotes => $composableBuilder(
    column: $table.conflictNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$PetsTableTableFilterComposer get petId {
    final $$PetsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.petsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableTableFilterComposer(
            $db: $db,
            $table: $db.petsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableFilterComposer get vetId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vetId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicalRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicalRecordsTableTable> {
  $$MedicalRecordsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attachmentLocalPath => $composableBuilder(
    column: $table.attachmentLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attachmentRemoteUrl => $composableBuilder(
    column: $table.attachmentRemoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictNotes => $composableBuilder(
    column: $table.conflictNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$PetsTableTableOrderingComposer get petId {
    final $$PetsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.petsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableTableOrderingComposer(
            $db: $db,
            $table: $db.petsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableOrderingComposer get vetId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vetId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicalRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicalRecordsTableTable> {
  $$MedicalRecordsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attachmentLocalPath => $composableBuilder(
    column: $table.attachmentLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attachmentRemoteUrl => $composableBuilder(
    column: $table.attachmentRemoteUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conflictNotes => $composableBuilder(
    column: $table.conflictNotes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  $$PetsTableTableAnnotationComposer get petId {
    final $$PetsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.petsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.petsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableAnnotationComposer get vetId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vetId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicalRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicalRecordsTableTable,
          MedicalRecordsTableData,
          $$MedicalRecordsTableTableFilterComposer,
          $$MedicalRecordsTableTableOrderingComposer,
          $$MedicalRecordsTableTableAnnotationComposer,
          $$MedicalRecordsTableTableCreateCompanionBuilder,
          $$MedicalRecordsTableTableUpdateCompanionBuilder,
          (MedicalRecordsTableData, $$MedicalRecordsTableTableReferences),
          MedicalRecordsTableData,
          PrefetchHooks Function({bool petId, bool vetId})
        > {
  $$MedicalRecordsTableTableTableManager(
    _$AppDatabase db,
    $MedicalRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicalRecordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicalRecordsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MedicalRecordsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> vetId = const Value.absent(),
                Value<String> recordType = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<String?> medicationName = const Value.absent(),
                Value<String?> dosage = const Value.absent(),
                Value<DateTime?> nextDueDate = const Value.absent(),
                Value<String?> attachmentLocalPath = const Value.absent(),
                Value<String?> attachmentRemoteUrl = const Value.absent(),
                Value<String?> conflictNotes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicalRecordsTableCompanion(
                id: id,
                petId: petId,
                vetId: vetId,
                recordType: recordType,
                title: title,
                description: description,
                weightKg: weightKg,
                medicationName: medicationName,
                dosage: dosage,
                nextDueDate: nextDueDate,
                attachmentLocalPath: attachmentLocalPath,
                attachmentRemoteUrl: attachmentRemoteUrl,
                conflictNotes: conflictNotes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String vetId,
                required String recordType,
                required String title,
                required String description,
                Value<double?> weightKg = const Value.absent(),
                Value<String?> medicationName = const Value.absent(),
                Value<String?> dosage = const Value.absent(),
                Value<DateTime?> nextDueDate = const Value.absent(),
                Value<String?> attachmentLocalPath = const Value.absent(),
                Value<String?> attachmentRemoteUrl = const Value.absent(),
                Value<String?> conflictNotes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicalRecordsTableCompanion.insert(
                id: id,
                petId: petId,
                vetId: vetId,
                recordType: recordType,
                title: title,
                description: description,
                weightKg: weightKg,
                medicationName: medicationName,
                dosage: dosage,
                nextDueDate: nextDueDate,
                attachmentLocalPath: attachmentLocalPath,
                attachmentRemoteUrl: attachmentRemoteUrl,
                conflictNotes: conflictNotes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicalRecordsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({petId = false, vetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (petId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.petId,
                                referencedTable:
                                    $$MedicalRecordsTableTableReferences
                                        ._petIdTable(db),
                                referencedColumn:
                                    $$MedicalRecordsTableTableReferences
                                        ._petIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (vetId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vetId,
                                referencedTable:
                                    $$MedicalRecordsTableTableReferences
                                        ._vetIdTable(db),
                                referencedColumn:
                                    $$MedicalRecordsTableTableReferences
                                        ._vetIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MedicalRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicalRecordsTableTable,
      MedicalRecordsTableData,
      $$MedicalRecordsTableTableFilterComposer,
      $$MedicalRecordsTableTableOrderingComposer,
      $$MedicalRecordsTableTableAnnotationComposer,
      $$MedicalRecordsTableTableCreateCompanionBuilder,
      $$MedicalRecordsTableTableUpdateCompanionBuilder,
      (MedicalRecordsTableData, $$MedicalRecordsTableTableReferences),
      MedicalRecordsTableData,
      PrefetchHooks Function({bool petId, bool vetId})
    >;
typedef $$ProductsTableTableCreateCompanionBuilder =
    ProductsTableCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      required String category,
      Value<String?> brand,
      Value<String?> sku,
      required double price,
      Value<double> discountPct,
      Value<int> stockQty,
      Value<int> stockMinAlert,
      Value<bool> isActive,
      Value<String?> imageLocalPath,
      Value<String?> imageRemoteUrl,
      Value<String?> targetSpecies,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$ProductsTableTableUpdateCompanionBuilder =
    ProductsTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String> category,
      Value<String?> brand,
      Value<String?> sku,
      Value<double> price,
      Value<double> discountPct,
      Value<int> stockQty,
      Value<int> stockMinAlert,
      Value<bool> isActive,
      Value<String?> imageLocalPath,
      Value<String?> imageRemoteUrl,
      Value<String?> targetSpecies,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$ProductsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProductsTableTable, ProductsTableData> {
  $$ProductsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$OrderItemsTableTable, List<OrderItemsTableData>>
  _orderItemsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.orderItemsTable,
    aliasName: $_aliasNameGenerator(
      db.productsTable.id,
      db.orderItemsTable.productId,
    ),
  );

  $$OrderItemsTableTableProcessedTableManager get orderItemsTableRefs {
    final manager = $$OrderItemsTableTableTableManager(
      $_db,
      $_db.orderItemsTable,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _orderItemsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPct => $composableBuilder(
    column: $table.discountPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stockQty => $composableBuilder(
    column: $table.stockQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stockMinAlert => $composableBuilder(
    column: $table.stockMinAlert,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageRemoteUrl => $composableBuilder(
    column: $table.imageRemoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetSpecies => $composableBuilder(
    column: $table.targetSpecies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> orderItemsTableRefs(
    Expression<bool> Function($$OrderItemsTableTableFilterComposer f) f,
  ) {
    final $$OrderItemsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderItemsTable,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderItemsTableTableFilterComposer(
            $db: $db,
            $table: $db.orderItemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPct => $composableBuilder(
    column: $table.discountPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stockQty => $composableBuilder(
    column: $table.stockQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stockMinAlert => $composableBuilder(
    column: $table.stockMinAlert,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageRemoteUrl => $composableBuilder(
    column: $table.imageRemoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetSpecies => $composableBuilder(
    column: $table.targetSpecies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get discountPct => $composableBuilder(
    column: $table.discountPct,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stockQty =>
      $composableBuilder(column: $table.stockQty, builder: (column) => column);

  GeneratedColumn<int> get stockMinAlert => $composableBuilder(
    column: $table.stockMinAlert,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageRemoteUrl => $composableBuilder(
    column: $table.imageRemoteUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetSpecies => $composableBuilder(
    column: $table.targetSpecies,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  Expression<T> orderItemsTableRefs<T extends Object>(
    Expression<T> Function($$OrderItemsTableTableAnnotationComposer a) f,
  ) {
    final $$OrderItemsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderItemsTable,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderItemsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.orderItemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTableTable,
          ProductsTableData,
          $$ProductsTableTableFilterComposer,
          $$ProductsTableTableOrderingComposer,
          $$ProductsTableTableAnnotationComposer,
          $$ProductsTableTableCreateCompanionBuilder,
          $$ProductsTableTableUpdateCompanionBuilder,
          (ProductsTableData, $$ProductsTableTableReferences),
          ProductsTableData,
          PrefetchHooks Function({bool orderItemsTableRefs})
        > {
  $$ProductsTableTableTableManager(_$AppDatabase db, $ProductsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> sku = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> discountPct = const Value.absent(),
                Value<int> stockQty = const Value.absent(),
                Value<int> stockMinAlert = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> imageLocalPath = const Value.absent(),
                Value<String?> imageRemoteUrl = const Value.absent(),
                Value<String?> targetSpecies = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsTableCompanion(
                id: id,
                name: name,
                description: description,
                category: category,
                brand: brand,
                sku: sku,
                price: price,
                discountPct: discountPct,
                stockQty: stockQty,
                stockMinAlert: stockMinAlert,
                isActive: isActive,
                imageLocalPath: imageLocalPath,
                imageRemoteUrl: imageRemoteUrl,
                targetSpecies: targetSpecies,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                required String category,
                Value<String?> brand = const Value.absent(),
                Value<String?> sku = const Value.absent(),
                required double price,
                Value<double> discountPct = const Value.absent(),
                Value<int> stockQty = const Value.absent(),
                Value<int> stockMinAlert = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> imageLocalPath = const Value.absent(),
                Value<String?> imageRemoteUrl = const Value.absent(),
                Value<String?> targetSpecies = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                category: category,
                brand: brand,
                sku: sku,
                price: price,
                discountPct: discountPct,
                stockQty: stockQty,
                stockMinAlert: stockMinAlert,
                isActive: isActive,
                imageLocalPath: imageLocalPath,
                imageRemoteUrl: imageRemoteUrl,
                targetSpecies: targetSpecies,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({orderItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (orderItemsTableRefs) db.orderItemsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (orderItemsTableRefs)
                    await $_getPrefetchedData<
                      ProductsTableData,
                      $ProductsTableTable,
                      OrderItemsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableTableReferences
                          ._orderItemsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProductsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).orderItemsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.productId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTableTable,
      ProductsTableData,
      $$ProductsTableTableFilterComposer,
      $$ProductsTableTableOrderingComposer,
      $$ProductsTableTableAnnotationComposer,
      $$ProductsTableTableCreateCompanionBuilder,
      $$ProductsTableTableUpdateCompanionBuilder,
      (ProductsTableData, $$ProductsTableTableReferences),
      ProductsTableData,
      PrefetchHooks Function({bool orderItemsTableRefs})
    >;
typedef $$OrdersTableTableCreateCompanionBuilder =
    OrdersTableCompanion Function({
      required String id,
      required String clientId,
      Value<String?> driverId,
      Value<String> status,
      Value<double> subtotal,
      Value<double> deliveryFee,
      Value<double> totalAmount,
      Value<String?> deliveryAddress,
      Value<double?> deliveryLat,
      Value<double?> deliveryLng,
      Value<String?> paymentMethod,
      Value<String> paymentStatus,
      Value<String?> clientNotes,
      Value<DateTime?> placedAt,
      Value<DateTime?> deliveredAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$OrdersTableTableUpdateCompanionBuilder =
    OrdersTableCompanion Function({
      Value<String> id,
      Value<String> clientId,
      Value<String?> driverId,
      Value<String> status,
      Value<double> subtotal,
      Value<double> deliveryFee,
      Value<double> totalAmount,
      Value<String?> deliveryAddress,
      Value<double?> deliveryLat,
      Value<double?> deliveryLng,
      Value<String?> paymentMethod,
      Value<String> paymentStatus,
      Value<String?> clientNotes,
      Value<DateTime?> placedAt,
      Value<DateTime?> deliveredAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$OrdersTableTableReferences
    extends BaseReferences<_$AppDatabase, $OrdersTableTable, OrdersTableData> {
  $$OrdersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTableTable _clientIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(db.ordersTable.clientId, db.usersTable.id),
      );

  $$UsersTableTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<String>('client_id')!;

    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTableTable _driverIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(db.ordersTable.driverId, db.usersTable.id),
      );

  $$UsersTableTableProcessedTableManager? get driverId {
    final $_column = $_itemColumn<String>('driver_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_driverIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$OrderItemsTableTable, List<OrderItemsTableData>>
  _orderItemsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.orderItemsTable,
    aliasName: $_aliasNameGenerator(
      db.ordersTable.id,
      db.orderItemsTable.orderId,
    ),
  );

  $$OrderItemsTableTableProcessedTableManager get orderItemsTableRefs {
    final manager = $$OrderItemsTableTableTableManager(
      $_db,
      $_db.orderItemsTable,
    ).filter((f) => f.orderId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _orderItemsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $LocationTracksTableTable,
    List<LocationTracksTableData>
  >
  _locationTracksTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.locationTracksTable,
        aliasName: $_aliasNameGenerator(
          db.ordersTable.id,
          db.locationTracksTable.orderId,
        ),
      );

  $$LocationTracksTableTableProcessedTableManager get locationTracksTableRefs {
    final manager = $$LocationTracksTableTableTableManager(
      $_db,
      $_db.locationTracksTable,
    ).filter((f) => f.orderId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _locationTracksTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OrdersTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrdersTableTable> {
  $$OrdersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get deliveryFee => $composableBuilder(
    column: $table.deliveryFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliveryAddress => $composableBuilder(
    column: $table.deliveryAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get deliveryLat => $composableBuilder(
    column: $table.deliveryLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get deliveryLng => $composableBuilder(
    column: $table.deliveryLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientNotes => $composableBuilder(
    column: $table.clientNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get placedAt => $composableBuilder(
    column: $table.placedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deliveredAt => $composableBuilder(
    column: $table.deliveredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableTableFilterComposer get clientId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableFilterComposer get driverId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> orderItemsTableRefs(
    Expression<bool> Function($$OrderItemsTableTableFilterComposer f) f,
  ) {
    final $$OrderItemsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderItemsTable,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderItemsTableTableFilterComposer(
            $db: $db,
            $table: $db.orderItemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> locationTracksTableRefs(
    Expression<bool> Function($$LocationTracksTableTableFilterComposer f) f,
  ) {
    final $$LocationTracksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.locationTracksTable,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTracksTableTableFilterComposer(
            $db: $db,
            $table: $db.locationTracksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrdersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdersTableTable> {
  $$OrdersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get deliveryFee => $composableBuilder(
    column: $table.deliveryFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliveryAddress => $composableBuilder(
    column: $table.deliveryAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get deliveryLat => $composableBuilder(
    column: $table.deliveryLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get deliveryLng => $composableBuilder(
    column: $table.deliveryLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientNotes => $composableBuilder(
    column: $table.clientNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get placedAt => $composableBuilder(
    column: $table.placedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deliveredAt => $composableBuilder(
    column: $table.deliveredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableTableOrderingComposer get clientId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableOrderingComposer get driverId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrdersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdersTableTable> {
  $$OrdersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get deliveryFee => $composableBuilder(
    column: $table.deliveryFee,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deliveryAddress => $composableBuilder(
    column: $table.deliveryAddress,
    builder: (column) => column,
  );

  GeneratedColumn<double> get deliveryLat => $composableBuilder(
    column: $table.deliveryLat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get deliveryLng => $composableBuilder(
    column: $table.deliveryLng,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientNotes => $composableBuilder(
    column: $table.clientNotes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get placedAt =>
      $composableBuilder(column: $table.placedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deliveredAt => $composableBuilder(
    column: $table.deliveredAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  $$UsersTableTableAnnotationComposer get clientId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableTableAnnotationComposer get driverId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> orderItemsTableRefs<T extends Object>(
    Expression<T> Function($$OrderItemsTableTableAnnotationComposer a) f,
  ) {
    final $$OrderItemsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderItemsTable,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderItemsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.orderItemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> locationTracksTableRefs<T extends Object>(
    Expression<T> Function($$LocationTracksTableTableAnnotationComposer a) f,
  ) {
    final $$LocationTracksTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.locationTracksTable,
          getReferencedColumn: (t) => t.orderId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LocationTracksTableTableAnnotationComposer(
                $db: $db,
                $table: $db.locationTracksTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$OrdersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrdersTableTable,
          OrdersTableData,
          $$OrdersTableTableFilterComposer,
          $$OrdersTableTableOrderingComposer,
          $$OrdersTableTableAnnotationComposer,
          $$OrdersTableTableCreateCompanionBuilder,
          $$OrdersTableTableUpdateCompanionBuilder,
          (OrdersTableData, $$OrdersTableTableReferences),
          OrdersTableData,
          PrefetchHooks Function({
            bool clientId,
            bool driverId,
            bool orderItemsTableRefs,
            bool locationTracksTableRefs,
          })
        > {
  $$OrdersTableTableTableManager(_$AppDatabase db, $OrdersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String?> driverId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> deliveryFee = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<String?> deliveryAddress = const Value.absent(),
                Value<double?> deliveryLat = const Value.absent(),
                Value<double?> deliveryLng = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String?> clientNotes = const Value.absent(),
                Value<DateTime?> placedAt = const Value.absent(),
                Value<DateTime?> deliveredAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrdersTableCompanion(
                id: id,
                clientId: clientId,
                driverId: driverId,
                status: status,
                subtotal: subtotal,
                deliveryFee: deliveryFee,
                totalAmount: totalAmount,
                deliveryAddress: deliveryAddress,
                deliveryLat: deliveryLat,
                deliveryLng: deliveryLng,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
                clientNotes: clientNotes,
                placedAt: placedAt,
                deliveredAt: deliveredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String clientId,
                Value<String?> driverId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> deliveryFee = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<String?> deliveryAddress = const Value.absent(),
                Value<double?> deliveryLat = const Value.absent(),
                Value<double?> deliveryLng = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String?> clientNotes = const Value.absent(),
                Value<DateTime?> placedAt = const Value.absent(),
                Value<DateTime?> deliveredAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrdersTableCompanion.insert(
                id: id,
                clientId: clientId,
                driverId: driverId,
                status: status,
                subtotal: subtotal,
                deliveryFee: deliveryFee,
                totalAmount: totalAmount,
                deliveryAddress: deliveryAddress,
                deliveryLat: deliveryLat,
                deliveryLng: deliveryLng,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
                clientNotes: clientNotes,
                placedAt: placedAt,
                deliveredAt: deliveredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OrdersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                clientId = false,
                driverId = false,
                orderItemsTableRefs = false,
                locationTracksTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (orderItemsTableRefs) db.orderItemsTable,
                    if (locationTracksTableRefs) db.locationTracksTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (clientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.clientId,
                                    referencedTable:
                                        $$OrdersTableTableReferences
                                            ._clientIdTable(db),
                                    referencedColumn:
                                        $$OrdersTableTableReferences
                                            ._clientIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (driverId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.driverId,
                                    referencedTable:
                                        $$OrdersTableTableReferences
                                            ._driverIdTable(db),
                                    referencedColumn:
                                        $$OrdersTableTableReferences
                                            ._driverIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (orderItemsTableRefs)
                        await $_getPrefetchedData<
                          OrdersTableData,
                          $OrdersTableTable,
                          OrderItemsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$OrdersTableTableReferences
                              ._orderItemsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).orderItemsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (locationTracksTableRefs)
                        await $_getPrefetchedData<
                          OrdersTableData,
                          $OrdersTableTable,
                          LocationTracksTableData
                        >(
                          currentTable: table,
                          referencedTable: $$OrdersTableTableReferences
                              ._locationTracksTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdersTableTableReferences(
                                db,
                                table,
                                p0,
                              ).locationTracksTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$OrdersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrdersTableTable,
      OrdersTableData,
      $$OrdersTableTableFilterComposer,
      $$OrdersTableTableOrderingComposer,
      $$OrdersTableTableAnnotationComposer,
      $$OrdersTableTableCreateCompanionBuilder,
      $$OrdersTableTableUpdateCompanionBuilder,
      (OrdersTableData, $$OrdersTableTableReferences),
      OrdersTableData,
      PrefetchHooks Function({
        bool clientId,
        bool driverId,
        bool orderItemsTableRefs,
        bool locationTracksTableRefs,
      })
    >;
typedef $$OrderItemsTableTableCreateCompanionBuilder =
    OrderItemsTableCompanion Function({
      required String id,
      required String orderId,
      required String productId,
      required int quantity,
      required double unitPrice,
      required double subtotal,
      Value<String?> productSnapshot,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$OrderItemsTableTableUpdateCompanionBuilder =
    OrderItemsTableCompanion Function({
      Value<String> id,
      Value<String> orderId,
      Value<String> productId,
      Value<int> quantity,
      Value<double> unitPrice,
      Value<double> subtotal,
      Value<String?> productSnapshot,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$OrderItemsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $OrderItemsTableTable,
          OrderItemsTableData
        > {
  $$OrderItemsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $OrdersTableTable _orderIdTable(_$AppDatabase db) =>
      db.ordersTable.createAlias(
        $_aliasNameGenerator(db.orderItemsTable.orderId, db.ordersTable.id),
      );

  $$OrdersTableTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<String>('order_id')!;

    final manager = $$OrdersTableTableTableManager(
      $_db,
      $_db.ordersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTableTable _productIdTable(_$AppDatabase db) =>
      db.productsTable.createAlias(
        $_aliasNameGenerator(db.orderItemsTable.productId, db.productsTable.id),
      );

  $$ProductsTableTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableTableManager(
      $_db,
      $_db.productsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OrderItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemsTableTable> {
  $$OrderItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productSnapshot => $composableBuilder(
    column: $table.productSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$OrdersTableTableFilterComposer get orderId {
    final $$OrdersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.ordersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableTableFilterComposer(
            $db: $db,
            $table: $db.ordersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableTableFilterComposer get productId {
    final $$ProductsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.productsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableTableFilterComposer(
            $db: $db,
            $table: $db.productsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemsTableTable> {
  $$OrderItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productSnapshot => $composableBuilder(
    column: $table.productSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$OrdersTableTableOrderingComposer get orderId {
    final $$OrdersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.ordersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableTableOrderingComposer(
            $db: $db,
            $table: $db.ordersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableTableOrderingComposer get productId {
    final $$ProductsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.productsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableTableOrderingComposer(
            $db: $db,
            $table: $db.productsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemsTableTable> {
  $$OrderItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<String> get productSnapshot => $composableBuilder(
    column: $table.productSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  $$OrdersTableTableAnnotationComposer get orderId {
    final $$OrdersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.ordersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.ordersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableTableAnnotationComposer get productId {
    final $$ProductsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.productsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.productsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderItemsTableTable,
          OrderItemsTableData,
          $$OrderItemsTableTableFilterComposer,
          $$OrderItemsTableTableOrderingComposer,
          $$OrderItemsTableTableAnnotationComposer,
          $$OrderItemsTableTableCreateCompanionBuilder,
          $$OrderItemsTableTableUpdateCompanionBuilder,
          (OrderItemsTableData, $$OrderItemsTableTableReferences),
          OrderItemsTableData,
          PrefetchHooks Function({bool orderId, bool productId})
        > {
  $$OrderItemsTableTableTableManager(
    _$AppDatabase db,
    $OrderItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> orderId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<String?> productSnapshot = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrderItemsTableCompanion(
                id: id,
                orderId: orderId,
                productId: productId,
                quantity: quantity,
                unitPrice: unitPrice,
                subtotal: subtotal,
                productSnapshot: productSnapshot,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String orderId,
                required String productId,
                required int quantity,
                required double unitPrice,
                required double subtotal,
                Value<String?> productSnapshot = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrderItemsTableCompanion.insert(
                id: id,
                orderId: orderId,
                productId: productId,
                quantity: quantity,
                unitPrice: unitPrice,
                subtotal: subtotal,
                productSnapshot: productSnapshot,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OrderItemsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({orderId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (orderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.orderId,
                                referencedTable:
                                    $$OrderItemsTableTableReferences
                                        ._orderIdTable(db),
                                referencedColumn:
                                    $$OrderItemsTableTableReferences
                                        ._orderIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$OrderItemsTableTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$OrderItemsTableTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OrderItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderItemsTableTable,
      OrderItemsTableData,
      $$OrderItemsTableTableFilterComposer,
      $$OrderItemsTableTableOrderingComposer,
      $$OrderItemsTableTableAnnotationComposer,
      $$OrderItemsTableTableCreateCompanionBuilder,
      $$OrderItemsTableTableUpdateCompanionBuilder,
      (OrderItemsTableData, $$OrderItemsTableTableReferences),
      OrderItemsTableData,
      PrefetchHooks Function({bool orderId, bool productId})
    >;
typedef $$LocationTracksTableTableCreateCompanionBuilder =
    LocationTracksTableCompanion Function({
      required String id,
      required String driverId,
      required String orderId,
      required double latitude,
      required double longitude,
      Value<double?> accuracyMeters,
      Value<double?> speedKmh,
      Value<double?> headingDegrees,
      required DateTime recordedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$LocationTracksTableTableUpdateCompanionBuilder =
    LocationTracksTableCompanion Function({
      Value<String> id,
      Value<String> driverId,
      Value<String> orderId,
      Value<double> latitude,
      Value<double> longitude,
      Value<double?> accuracyMeters,
      Value<double?> speedKmh,
      Value<double?> headingDegrees,
      Value<DateTime> recordedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$LocationTracksTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LocationTracksTableTable,
          LocationTracksTableData
        > {
  $$LocationTracksTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTableTable _driverIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(db.locationTracksTable.driverId, db.usersTable.id),
      );

  $$UsersTableTableProcessedTableManager get driverId {
    final $_column = $_itemColumn<String>('driver_id')!;

    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_driverIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OrdersTableTable _orderIdTable(_$AppDatabase db) =>
      db.ordersTable.createAlias(
        $_aliasNameGenerator(db.locationTracksTable.orderId, db.ordersTable.id),
      );

  $$OrdersTableTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<String>('order_id')!;

    final manager = $$OrdersTableTableTableManager(
      $_db,
      $_db.ordersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LocationTracksTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocationTracksTableTable> {
  $$LocationTracksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accuracyMeters => $composableBuilder(
    column: $table.accuracyMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speedKmh => $composableBuilder(
    column: $table.speedKmh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get headingDegrees => $composableBuilder(
    column: $table.headingDegrees,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableTableFilterComposer get driverId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrdersTableTableFilterComposer get orderId {
    final $$OrdersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.ordersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableTableFilterComposer(
            $db: $db,
            $table: $db.ordersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocationTracksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationTracksTableTable> {
  $$LocationTracksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accuracyMeters => $composableBuilder(
    column: $table.accuracyMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speedKmh => $composableBuilder(
    column: $table.speedKmh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get headingDegrees => $composableBuilder(
    column: $table.headingDegrees,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableTableOrderingComposer get driverId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrdersTableTableOrderingComposer get orderId {
    final $$OrdersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.ordersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableTableOrderingComposer(
            $db: $db,
            $table: $db.ordersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocationTracksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationTracksTableTable> {
  $$LocationTracksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get accuracyMeters => $composableBuilder(
    column: $table.accuracyMeters,
    builder: (column) => column,
  );

  GeneratedColumn<double> get speedKmh =>
      $composableBuilder(column: $table.speedKmh, builder: (column) => column);

  GeneratedColumn<double> get headingDegrees => $composableBuilder(
    column: $table.headingDegrees,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  $$UsersTableTableAnnotationComposer get driverId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.driverId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrdersTableTableAnnotationComposer get orderId {
    final $$OrdersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.ordersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.ordersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocationTracksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationTracksTableTable,
          LocationTracksTableData,
          $$LocationTracksTableTableFilterComposer,
          $$LocationTracksTableTableOrderingComposer,
          $$LocationTracksTableTableAnnotationComposer,
          $$LocationTracksTableTableCreateCompanionBuilder,
          $$LocationTracksTableTableUpdateCompanionBuilder,
          (LocationTracksTableData, $$LocationTracksTableTableReferences),
          LocationTracksTableData,
          PrefetchHooks Function({bool driverId, bool orderId})
        > {
  $$LocationTracksTableTableTableManager(
    _$AppDatabase db,
    $LocationTracksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationTracksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationTracksTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocationTracksTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> driverId = const Value.absent(),
                Value<String> orderId = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<double?> accuracyMeters = const Value.absent(),
                Value<double?> speedKmh = const Value.absent(),
                Value<double?> headingDegrees = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationTracksTableCompanion(
                id: id,
                driverId: driverId,
                orderId: orderId,
                latitude: latitude,
                longitude: longitude,
                accuracyMeters: accuracyMeters,
                speedKmh: speedKmh,
                headingDegrees: headingDegrees,
                recordedAt: recordedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String driverId,
                required String orderId,
                required double latitude,
                required double longitude,
                Value<double?> accuracyMeters = const Value.absent(),
                Value<double?> speedKmh = const Value.absent(),
                Value<double?> headingDegrees = const Value.absent(),
                required DateTime recordedAt,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationTracksTableCompanion.insert(
                id: id,
                driverId: driverId,
                orderId: orderId,
                latitude: latitude,
                longitude: longitude,
                accuracyMeters: accuracyMeters,
                speedKmh: speedKmh,
                headingDegrees: headingDegrees,
                recordedAt: recordedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocationTracksTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({driverId = false, orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (driverId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.driverId,
                                referencedTable:
                                    $$LocationTracksTableTableReferences
                                        ._driverIdTable(db),
                                referencedColumn:
                                    $$LocationTracksTableTableReferences
                                        ._driverIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (orderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.orderId,
                                referencedTable:
                                    $$LocationTracksTableTableReferences
                                        ._orderIdTable(db),
                                referencedColumn:
                                    $$LocationTracksTableTableReferences
                                        ._orderIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LocationTracksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationTracksTableTable,
      LocationTracksTableData,
      $$LocationTracksTableTableFilterComposer,
      $$LocationTracksTableTableOrderingComposer,
      $$LocationTracksTableTableAnnotationComposer,
      $$LocationTracksTableTableCreateCompanionBuilder,
      $$LocationTracksTableTableUpdateCompanionBuilder,
      (LocationTracksTableData, $$LocationTracksTableTableReferences),
      LocationTracksTableData,
      PrefetchHooks Function({bool driverId, bool orderId})
    >;
typedef $$AdoptionRequestsTableTableCreateCompanionBuilder =
    AdoptionRequestsTableCompanion Function({
      required String id,
      required String listingId,
      required String animalName,
      required String clientId,
      required String clientName,
      required String clientPhone,
      required String clientEmail,
      required String requestType,
      Value<String?> message,
      Value<String> status,
      Value<String?> adminNotes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });
typedef $$AdoptionRequestsTableTableUpdateCompanionBuilder =
    AdoptionRequestsTableCompanion Function({
      Value<String> id,
      Value<String> listingId,
      Value<String> animalName,
      Value<String> clientId,
      Value<String> clientName,
      Value<String> clientPhone,
      Value<String> clientEmail,
      Value<String> requestType,
      Value<String?> message,
      Value<String> status,
      Value<String?> adminNotes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<int> rowid,
    });

final class $$AdoptionRequestsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AdoptionRequestsTableTable,
          AdoptionRequestsTableData
        > {
  $$AdoptionRequestsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTableTable _clientIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
        $_aliasNameGenerator(
          db.adoptionRequestsTable.clientId,
          db.usersTable.id,
        ),
      );

  $$UsersTableTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<String>('client_id')!;

    final manager = $$UsersTableTableTableManager(
      $_db,
      $_db.usersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AdoptionRequestsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AdoptionRequestsTableTable> {
  $$AdoptionRequestsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get listingId => $composableBuilder(
    column: $table.listingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get animalName => $composableBuilder(
    column: $table.animalName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requestType => $composableBuilder(
    column: $table.requestType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adminNotes => $composableBuilder(
    column: $table.adminNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableTableFilterComposer get clientId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableFilterComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdoptionRequestsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AdoptionRequestsTableTable> {
  $$AdoptionRequestsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get listingId => $composableBuilder(
    column: $table.listingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get animalName => $composableBuilder(
    column: $table.animalName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestType => $composableBuilder(
    column: $table.requestType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adminNotes => $composableBuilder(
    column: $table.adminNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableTableOrderingComposer get clientId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableOrderingComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdoptionRequestsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdoptionRequestsTableTable> {
  $$AdoptionRequestsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get listingId =>
      $composableBuilder(column: $table.listingId, builder: (column) => column);

  GeneratedColumn<String> get animalName => $composableBuilder(
    column: $table.animalName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requestType => $composableBuilder(
    column: $table.requestType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get adminNotes => $composableBuilder(
    column: $table.adminNotes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  $$UsersTableTableAnnotationComposer get clientId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.usersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.usersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdoptionRequestsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdoptionRequestsTableTable,
          AdoptionRequestsTableData,
          $$AdoptionRequestsTableTableFilterComposer,
          $$AdoptionRequestsTableTableOrderingComposer,
          $$AdoptionRequestsTableTableAnnotationComposer,
          $$AdoptionRequestsTableTableCreateCompanionBuilder,
          $$AdoptionRequestsTableTableUpdateCompanionBuilder,
          (AdoptionRequestsTableData, $$AdoptionRequestsTableTableReferences),
          AdoptionRequestsTableData,
          PrefetchHooks Function({bool clientId})
        > {
  $$AdoptionRequestsTableTableTableManager(
    _$AppDatabase db,
    $AdoptionRequestsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdoptionRequestsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AdoptionRequestsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AdoptionRequestsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> listingId = const Value.absent(),
                Value<String> animalName = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String> clientName = const Value.absent(),
                Value<String> clientPhone = const Value.absent(),
                Value<String> clientEmail = const Value.absent(),
                Value<String> requestType = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> adminNotes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdoptionRequestsTableCompanion(
                id: id,
                listingId: listingId,
                animalName: animalName,
                clientId: clientId,
                clientName: clientName,
                clientPhone: clientPhone,
                clientEmail: clientEmail,
                requestType: requestType,
                message: message,
                status: status,
                adminNotes: adminNotes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String listingId,
                required String animalName,
                required String clientId,
                required String clientName,
                required String clientPhone,
                required String clientEmail,
                required String requestType,
                Value<String?> message = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> adminNotes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdoptionRequestsTableCompanion.insert(
                id: id,
                listingId: listingId,
                animalName: animalName,
                clientId: clientId,
                clientName: clientName,
                clientPhone: clientPhone,
                clientEmail: clientEmail,
                requestType: requestType,
                message: message,
                status: status,
                adminNotes: adminNotes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AdoptionRequestsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({clientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (clientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.clientId,
                                referencedTable:
                                    $$AdoptionRequestsTableTableReferences
                                        ._clientIdTable(db),
                                referencedColumn:
                                    $$AdoptionRequestsTableTableReferences
                                        ._clientIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AdoptionRequestsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdoptionRequestsTableTable,
      AdoptionRequestsTableData,
      $$AdoptionRequestsTableTableFilterComposer,
      $$AdoptionRequestsTableTableOrderingComposer,
      $$AdoptionRequestsTableTableAnnotationComposer,
      $$AdoptionRequestsTableTableCreateCompanionBuilder,
      $$AdoptionRequestsTableTableUpdateCompanionBuilder,
      (AdoptionRequestsTableData, $$AdoptionRequestsTableTableReferences),
      AdoptionRequestsTableData,
      PrefetchHooks Function({bool clientId})
    >;
typedef $$ChatRoomsTableTableCreateCompanionBuilder =
    ChatRoomsTableCompanion Function({
      required String id,
      required String clientName,
      Value<String?> lastMessage,
      Value<String?> lastMessageType,
      Value<DateTime?> lastMessageAt,
      Value<int> unreadByAdmin,
      Value<int> unreadByClient,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ChatRoomsTableTableUpdateCompanionBuilder =
    ChatRoomsTableCompanion Function({
      Value<String> id,
      Value<String> clientName,
      Value<String?> lastMessage,
      Value<String?> lastMessageType,
      Value<DateTime?> lastMessageAt,
      Value<int> unreadByAdmin,
      Value<int> unreadByClient,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ChatRoomsTableTableReferences
    extends BaseReferences<_$AppDatabase, $ChatRoomsTableTable, ChatRoom> {
  $$ChatRoomsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ChatMessagesTableTable, List<ChatMessageEntity>>
  _chatMessagesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.chatMessagesTable,
        aliasName: $_aliasNameGenerator(
          db.chatRoomsTable.id,
          db.chatMessagesTable.roomId,
        ),
      );

  $$ChatMessagesTableTableProcessedTableManager get chatMessagesTableRefs {
    final manager = $$ChatMessagesTableTableTableManager(
      $_db,
      $_db.chatMessagesTable,
    ).filter((f) => f.roomId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _chatMessagesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChatRoomsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChatRoomsTableTable> {
  $$ChatRoomsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastMessage => $composableBuilder(
    column: $table.lastMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastMessageType => $composableBuilder(
    column: $table.lastMessageType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastMessageAt => $composableBuilder(
    column: $table.lastMessageAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unreadByAdmin => $composableBuilder(
    column: $table.unreadByAdmin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unreadByClient => $composableBuilder(
    column: $table.unreadByClient,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> chatMessagesTableRefs(
    Expression<bool> Function($$ChatMessagesTableTableFilterComposer f) f,
  ) {
    final $$ChatMessagesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chatMessagesTable,
      getReferencedColumn: (t) => t.roomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatMessagesTableTableFilterComposer(
            $db: $db,
            $table: $db.chatMessagesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChatRoomsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatRoomsTableTable> {
  $$ChatRoomsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastMessage => $composableBuilder(
    column: $table.lastMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastMessageType => $composableBuilder(
    column: $table.lastMessageType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastMessageAt => $composableBuilder(
    column: $table.lastMessageAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unreadByAdmin => $composableBuilder(
    column: $table.unreadByAdmin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unreadByClient => $composableBuilder(
    column: $table.unreadByClient,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatRoomsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatRoomsTableTable> {
  $$ChatRoomsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastMessage => $composableBuilder(
    column: $table.lastMessage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastMessageType => $composableBuilder(
    column: $table.lastMessageType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastMessageAt => $composableBuilder(
    column: $table.lastMessageAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unreadByAdmin => $composableBuilder(
    column: $table.unreadByAdmin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unreadByClient => $composableBuilder(
    column: $table.unreadByClient,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> chatMessagesTableRefs<T extends Object>(
    Expression<T> Function($$ChatMessagesTableTableAnnotationComposer a) f,
  ) {
    final $$ChatMessagesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.chatMessagesTable,
          getReferencedColumn: (t) => t.roomId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ChatMessagesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.chatMessagesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ChatRoomsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatRoomsTableTable,
          ChatRoom,
          $$ChatRoomsTableTableFilterComposer,
          $$ChatRoomsTableTableOrderingComposer,
          $$ChatRoomsTableTableAnnotationComposer,
          $$ChatRoomsTableTableCreateCompanionBuilder,
          $$ChatRoomsTableTableUpdateCompanionBuilder,
          (ChatRoom, $$ChatRoomsTableTableReferences),
          ChatRoom,
          PrefetchHooks Function({bool chatMessagesTableRefs})
        > {
  $$ChatRoomsTableTableTableManager(
    _$AppDatabase db,
    $ChatRoomsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatRoomsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatRoomsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatRoomsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> clientName = const Value.absent(),
                Value<String?> lastMessage = const Value.absent(),
                Value<String?> lastMessageType = const Value.absent(),
                Value<DateTime?> lastMessageAt = const Value.absent(),
                Value<int> unreadByAdmin = const Value.absent(),
                Value<int> unreadByClient = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatRoomsTableCompanion(
                id: id,
                clientName: clientName,
                lastMessage: lastMessage,
                lastMessageType: lastMessageType,
                lastMessageAt: lastMessageAt,
                unreadByAdmin: unreadByAdmin,
                unreadByClient: unreadByClient,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String clientName,
                Value<String?> lastMessage = const Value.absent(),
                Value<String?> lastMessageType = const Value.absent(),
                Value<DateTime?> lastMessageAt = const Value.absent(),
                Value<int> unreadByAdmin = const Value.absent(),
                Value<int> unreadByClient = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ChatRoomsTableCompanion.insert(
                id: id,
                clientName: clientName,
                lastMessage: lastMessage,
                lastMessageType: lastMessageType,
                lastMessageAt: lastMessageAt,
                unreadByAdmin: unreadByAdmin,
                unreadByClient: unreadByClient,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChatRoomsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({chatMessagesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (chatMessagesTableRefs) db.chatMessagesTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (chatMessagesTableRefs)
                    await $_getPrefetchedData<
                      ChatRoom,
                      $ChatRoomsTableTable,
                      ChatMessageEntity
                    >(
                      currentTable: table,
                      referencedTable: $$ChatRoomsTableTableReferences
                          ._chatMessagesTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ChatRoomsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).chatMessagesTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.roomId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChatRoomsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatRoomsTableTable,
      ChatRoom,
      $$ChatRoomsTableTableFilterComposer,
      $$ChatRoomsTableTableOrderingComposer,
      $$ChatRoomsTableTableAnnotationComposer,
      $$ChatRoomsTableTableCreateCompanionBuilder,
      $$ChatRoomsTableTableUpdateCompanionBuilder,
      (ChatRoom, $$ChatRoomsTableTableReferences),
      ChatRoom,
      PrefetchHooks Function({bool chatMessagesTableRefs})
    >;
typedef $$ChatMessagesTableTableCreateCompanionBuilder =
    ChatMessagesTableCompanion Function({
      required String id,
      required String roomId,
      required String senderId,
      required String senderRole,
      required String type,
      Value<String?> content,
      Value<String?> imageLocalPath,
      Value<String?> imageRemoteUrl,
      Value<String?> cardPayload,
      Value<bool> isRead,
      required DateTime createdAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$ChatMessagesTableTableUpdateCompanionBuilder =
    ChatMessagesTableCompanion Function({
      Value<String> id,
      Value<String> roomId,
      Value<String> senderId,
      Value<String> senderRole,
      Value<String> type,
      Value<String?> content,
      Value<String?> imageLocalPath,
      Value<String?> imageRemoteUrl,
      Value<String?> cardPayload,
      Value<bool> isRead,
      Value<DateTime> createdAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

final class $$ChatMessagesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ChatMessagesTableTable,
          ChatMessageEntity
        > {
  $$ChatMessagesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ChatRoomsTableTable _roomIdTable(_$AppDatabase db) =>
      db.chatRoomsTable.createAlias(
        $_aliasNameGenerator(db.chatMessagesTable.roomId, db.chatRoomsTable.id),
      );

  $$ChatRoomsTableTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<String>('room_id')!;

    final manager = $$ChatRoomsTableTableTableManager(
      $_db,
      $_db.chatRoomsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChatMessagesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChatMessagesTableTable> {
  $$ChatMessagesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderId => $composableBuilder(
    column: $table.senderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderRole => $composableBuilder(
    column: $table.senderRole,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageRemoteUrl => $composableBuilder(
    column: $table.imageRemoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cardPayload => $composableBuilder(
    column: $table.cardPayload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$ChatRoomsTableTableFilterComposer get roomId {
    final $$ChatRoomsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.chatRoomsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatRoomsTableTableFilterComposer(
            $db: $db,
            $table: $db.chatRoomsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChatMessagesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatMessagesTableTable> {
  $$ChatMessagesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderId => $composableBuilder(
    column: $table.senderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderRole => $composableBuilder(
    column: $table.senderRole,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageRemoteUrl => $composableBuilder(
    column: $table.imageRemoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardPayload => $composableBuilder(
    column: $table.cardPayload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChatRoomsTableTableOrderingComposer get roomId {
    final $$ChatRoomsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.chatRoomsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatRoomsTableTableOrderingComposer(
            $db: $db,
            $table: $db.chatRoomsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChatMessagesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatMessagesTableTable> {
  $$ChatMessagesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get senderId =>
      $composableBuilder(column: $table.senderId, builder: (column) => column);

  GeneratedColumn<String> get senderRole => $composableBuilder(
    column: $table.senderRole,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageRemoteUrl => $composableBuilder(
    column: $table.imageRemoteUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cardPayload => $composableBuilder(
    column: $table.cardPayload,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  $$ChatRoomsTableTableAnnotationComposer get roomId {
    final $$ChatRoomsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.chatRoomsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatRoomsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.chatRoomsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChatMessagesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatMessagesTableTable,
          ChatMessageEntity,
          $$ChatMessagesTableTableFilterComposer,
          $$ChatMessagesTableTableOrderingComposer,
          $$ChatMessagesTableTableAnnotationComposer,
          $$ChatMessagesTableTableCreateCompanionBuilder,
          $$ChatMessagesTableTableUpdateCompanionBuilder,
          (ChatMessageEntity, $$ChatMessagesTableTableReferences),
          ChatMessageEntity,
          PrefetchHooks Function({bool roomId})
        > {
  $$ChatMessagesTableTableTableManager(
    _$AppDatabase db,
    $ChatMessagesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatMessagesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatMessagesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatMessagesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roomId = const Value.absent(),
                Value<String> senderId = const Value.absent(),
                Value<String> senderRole = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> imageLocalPath = const Value.absent(),
                Value<String?> imageRemoteUrl = const Value.absent(),
                Value<String?> cardPayload = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatMessagesTableCompanion(
                id: id,
                roomId: roomId,
                senderId: senderId,
                senderRole: senderRole,
                type: type,
                content: content,
                imageLocalPath: imageLocalPath,
                imageRemoteUrl: imageRemoteUrl,
                cardPayload: cardPayload,
                isRead: isRead,
                createdAt: createdAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roomId,
                required String senderId,
                required String senderRole,
                required String type,
                Value<String?> content = const Value.absent(),
                Value<String?> imageLocalPath = const Value.absent(),
                Value<String?> imageRemoteUrl = const Value.absent(),
                Value<String?> cardPayload = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                required DateTime createdAt,
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatMessagesTableCompanion.insert(
                id: id,
                roomId: roomId,
                senderId: senderId,
                senderRole: senderRole,
                type: type,
                content: content,
                imageLocalPath: imageLocalPath,
                imageRemoteUrl: imageRemoteUrl,
                cardPayload: cardPayload,
                isRead: isRead,
                createdAt: createdAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChatMessagesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roomId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roomId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roomId,
                                referencedTable:
                                    $$ChatMessagesTableTableReferences
                                        ._roomIdTable(db),
                                referencedColumn:
                                    $$ChatMessagesTableTableReferences
                                        ._roomIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChatMessagesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatMessagesTableTable,
      ChatMessageEntity,
      $$ChatMessagesTableTableFilterComposer,
      $$ChatMessagesTableTableOrderingComposer,
      $$ChatMessagesTableTableAnnotationComposer,
      $$ChatMessagesTableTableCreateCompanionBuilder,
      $$ChatMessagesTableTableUpdateCompanionBuilder,
      (ChatMessageEntity, $$ChatMessagesTableTableReferences),
      ChatMessageEntity,
      PrefetchHooks Function({bool roomId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$PetsTableTableTableManager get petsTable =>
      $$PetsTableTableTableManager(_db, _db.petsTable);
  $$AppointmentsTableTableTableManager get appointmentsTable =>
      $$AppointmentsTableTableTableManager(_db, _db.appointmentsTable);
  $$MedicalRecordsTableTableTableManager get medicalRecordsTable =>
      $$MedicalRecordsTableTableTableManager(_db, _db.medicalRecordsTable);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db, _db.productsTable);
  $$OrdersTableTableTableManager get ordersTable =>
      $$OrdersTableTableTableManager(_db, _db.ordersTable);
  $$OrderItemsTableTableTableManager get orderItemsTable =>
      $$OrderItemsTableTableTableManager(_db, _db.orderItemsTable);
  $$LocationTracksTableTableTableManager get locationTracksTable =>
      $$LocationTracksTableTableTableManager(_db, _db.locationTracksTable);
  $$AdoptionRequestsTableTableTableManager get adoptionRequestsTable =>
      $$AdoptionRequestsTableTableTableManager(_db, _db.adoptionRequestsTable);
  $$ChatRoomsTableTableTableManager get chatRoomsTable =>
      $$ChatRoomsTableTableTableManager(_db, _db.chatRoomsTable);
  $$ChatMessagesTableTableTableManager get chatMessagesTable =>
      $$ChatMessagesTableTableTableManager(_db, _db.chatMessagesTable);
}
