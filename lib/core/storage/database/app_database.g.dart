// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LoadsTable extends Loads with TableInfo<$LoadsTable, Load> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoadsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loadNumberMeta = const VerificationMeta(
    'loadNumber',
  );
  @override
  late final GeneratedColumn<String> loadNumber = GeneratedColumn<String>(
    'load_number',
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assignedDriverIdMeta = const VerificationMeta(
    'assignedDriverId',
  );
  @override
  late final GeneratedColumn<String> assignedDriverId = GeneratedColumn<String>(
    'assigned_driver_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _assignedDriverNameMeta =
      const VerificationMeta('assignedDriverName');
  @override
  late final GeneratedColumn<String> assignedDriverName =
      GeneratedColumn<String>(
        'assigned_driver_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _pickupAddressMeta = const VerificationMeta(
    'pickupAddress',
  );
  @override
  late final GeneratedColumn<String> pickupAddress = GeneratedColumn<String>(
    'pickup_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deliveryAddressMeta = const VerificationMeta(
    'deliveryAddress',
  );
  @override
  late final GeneratedColumn<String> deliveryAddress = GeneratedColumn<String>(
    'delivery_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pickupDateMeta = const VerificationMeta(
    'pickupDate',
  );
  @override
  late final GeneratedColumn<DateTime> pickupDate = GeneratedColumn<DateTime>(
    'pickup_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deliveryDateMeta = const VerificationMeta(
    'deliveryDate',
  );
  @override
  late final GeneratedColumn<DateTime> deliveryDate = GeneratedColumn<DateTime>(
    'delivery_date',
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
  static const VerificationMeta _rawDataMeta = const VerificationMeta(
    'rawData',
  );
  @override
  late final GeneratedColumn<String> rawData = GeneratedColumn<String>(
    'raw_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    loadNumber,
    status,
    assignedDriverId,
    assignedDriverName,
    pickupAddress,
    deliveryAddress,
    pickupDate,
    deliveryDate,
    createdAt,
    rawData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loads';
  @override
  VerificationContext validateIntegrity(
    Insertable<Load> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('load_number')) {
      context.handle(
        _loadNumberMeta,
        loadNumber.isAcceptableOrUnknown(data['load_number']!, _loadNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_loadNumberMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('assigned_driver_id')) {
      context.handle(
        _assignedDriverIdMeta,
        assignedDriverId.isAcceptableOrUnknown(
          data['assigned_driver_id']!,
          _assignedDriverIdMeta,
        ),
      );
    }
    if (data.containsKey('assigned_driver_name')) {
      context.handle(
        _assignedDriverNameMeta,
        assignedDriverName.isAcceptableOrUnknown(
          data['assigned_driver_name']!,
          _assignedDriverNameMeta,
        ),
      );
    }
    if (data.containsKey('pickup_address')) {
      context.handle(
        _pickupAddressMeta,
        pickupAddress.isAcceptableOrUnknown(
          data['pickup_address']!,
          _pickupAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pickupAddressMeta);
    }
    if (data.containsKey('delivery_address')) {
      context.handle(
        _deliveryAddressMeta,
        deliveryAddress.isAcceptableOrUnknown(
          data['delivery_address']!,
          _deliveryAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deliveryAddressMeta);
    }
    if (data.containsKey('pickup_date')) {
      context.handle(
        _pickupDateMeta,
        pickupDate.isAcceptableOrUnknown(data['pickup_date']!, _pickupDateMeta),
      );
    } else if (isInserting) {
      context.missing(_pickupDateMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
        _deliveryDateMeta,
        deliveryDate.isAcceptableOrUnknown(
          data['delivery_date']!,
          _deliveryDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deliveryDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('raw_data')) {
      context.handle(
        _rawDataMeta,
        rawData.isAcceptableOrUnknown(data['raw_data']!, _rawDataMeta),
      );
    } else if (isInserting) {
      context.missing(_rawDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Load map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Load(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      loadNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}load_number'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      assignedDriverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assigned_driver_id'],
      ),
      assignedDriverName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assigned_driver_name'],
      ),
      pickupAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pickup_address'],
      )!,
      deliveryAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}delivery_address'],
      )!,
      pickupDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}pickup_date'],
      )!,
      deliveryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}delivery_date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      rawData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_data'],
      )!,
    );
  }

  @override
  $LoadsTable createAlias(String alias) {
    return $LoadsTable(attachedDatabase, alias);
  }
}

class Load extends DataClass implements Insertable<Load> {
  final String id;
  final String loadNumber;
  final String status;
  final String? assignedDriverId;
  final String? assignedDriverName;
  final String pickupAddress;
  final String deliveryAddress;
  final DateTime pickupDate;
  final DateTime deliveryDate;
  final DateTime createdAt;
  final String rawData;
  const Load({
    required this.id,
    required this.loadNumber,
    required this.status,
    this.assignedDriverId,
    this.assignedDriverName,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.pickupDate,
    required this.deliveryDate,
    required this.createdAt,
    required this.rawData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['load_number'] = Variable<String>(loadNumber);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || assignedDriverId != null) {
      map['assigned_driver_id'] = Variable<String>(assignedDriverId);
    }
    if (!nullToAbsent || assignedDriverName != null) {
      map['assigned_driver_name'] = Variable<String>(assignedDriverName);
    }
    map['pickup_address'] = Variable<String>(pickupAddress);
    map['delivery_address'] = Variable<String>(deliveryAddress);
    map['pickup_date'] = Variable<DateTime>(pickupDate);
    map['delivery_date'] = Variable<DateTime>(deliveryDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['raw_data'] = Variable<String>(rawData);
    return map;
  }

  LoadsCompanion toCompanion(bool nullToAbsent) {
    return LoadsCompanion(
      id: Value(id),
      loadNumber: Value(loadNumber),
      status: Value(status),
      assignedDriverId: assignedDriverId == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedDriverId),
      assignedDriverName: assignedDriverName == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedDriverName),
      pickupAddress: Value(pickupAddress),
      deliveryAddress: Value(deliveryAddress),
      pickupDate: Value(pickupDate),
      deliveryDate: Value(deliveryDate),
      createdAt: Value(createdAt),
      rawData: Value(rawData),
    );
  }

  factory Load.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Load(
      id: serializer.fromJson<String>(json['id']),
      loadNumber: serializer.fromJson<String>(json['loadNumber']),
      status: serializer.fromJson<String>(json['status']),
      assignedDriverId: serializer.fromJson<String?>(json['assignedDriverId']),
      assignedDriverName: serializer.fromJson<String?>(
        json['assignedDriverName'],
      ),
      pickupAddress: serializer.fromJson<String>(json['pickupAddress']),
      deliveryAddress: serializer.fromJson<String>(json['deliveryAddress']),
      pickupDate: serializer.fromJson<DateTime>(json['pickupDate']),
      deliveryDate: serializer.fromJson<DateTime>(json['deliveryDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      rawData: serializer.fromJson<String>(json['rawData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loadNumber': serializer.toJson<String>(loadNumber),
      'status': serializer.toJson<String>(status),
      'assignedDriverId': serializer.toJson<String?>(assignedDriverId),
      'assignedDriverName': serializer.toJson<String?>(assignedDriverName),
      'pickupAddress': serializer.toJson<String>(pickupAddress),
      'deliveryAddress': serializer.toJson<String>(deliveryAddress),
      'pickupDate': serializer.toJson<DateTime>(pickupDate),
      'deliveryDate': serializer.toJson<DateTime>(deliveryDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'rawData': serializer.toJson<String>(rawData),
    };
  }

  Load copyWith({
    String? id,
    String? loadNumber,
    String? status,
    Value<String?> assignedDriverId = const Value.absent(),
    Value<String?> assignedDriverName = const Value.absent(),
    String? pickupAddress,
    String? deliveryAddress,
    DateTime? pickupDate,
    DateTime? deliveryDate,
    DateTime? createdAt,
    String? rawData,
  }) => Load(
    id: id ?? this.id,
    loadNumber: loadNumber ?? this.loadNumber,
    status: status ?? this.status,
    assignedDriverId: assignedDriverId.present
        ? assignedDriverId.value
        : this.assignedDriverId,
    assignedDriverName: assignedDriverName.present
        ? assignedDriverName.value
        : this.assignedDriverName,
    pickupAddress: pickupAddress ?? this.pickupAddress,
    deliveryAddress: deliveryAddress ?? this.deliveryAddress,
    pickupDate: pickupDate ?? this.pickupDate,
    deliveryDate: deliveryDate ?? this.deliveryDate,
    createdAt: createdAt ?? this.createdAt,
    rawData: rawData ?? this.rawData,
  );
  Load copyWithCompanion(LoadsCompanion data) {
    return Load(
      id: data.id.present ? data.id.value : this.id,
      loadNumber: data.loadNumber.present
          ? data.loadNumber.value
          : this.loadNumber,
      status: data.status.present ? data.status.value : this.status,
      assignedDriverId: data.assignedDriverId.present
          ? data.assignedDriverId.value
          : this.assignedDriverId,
      assignedDriverName: data.assignedDriverName.present
          ? data.assignedDriverName.value
          : this.assignedDriverName,
      pickupAddress: data.pickupAddress.present
          ? data.pickupAddress.value
          : this.pickupAddress,
      deliveryAddress: data.deliveryAddress.present
          ? data.deliveryAddress.value
          : this.deliveryAddress,
      pickupDate: data.pickupDate.present
          ? data.pickupDate.value
          : this.pickupDate,
      deliveryDate: data.deliveryDate.present
          ? data.deliveryDate.value
          : this.deliveryDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      rawData: data.rawData.present ? data.rawData.value : this.rawData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Load(')
          ..write('id: $id, ')
          ..write('loadNumber: $loadNumber, ')
          ..write('status: $status, ')
          ..write('assignedDriverId: $assignedDriverId, ')
          ..write('assignedDriverName: $assignedDriverName, ')
          ..write('pickupAddress: $pickupAddress, ')
          ..write('deliveryAddress: $deliveryAddress, ')
          ..write('pickupDate: $pickupDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('rawData: $rawData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    loadNumber,
    status,
    assignedDriverId,
    assignedDriverName,
    pickupAddress,
    deliveryAddress,
    pickupDate,
    deliveryDate,
    createdAt,
    rawData,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Load &&
          other.id == this.id &&
          other.loadNumber == this.loadNumber &&
          other.status == this.status &&
          other.assignedDriverId == this.assignedDriverId &&
          other.assignedDriverName == this.assignedDriverName &&
          other.pickupAddress == this.pickupAddress &&
          other.deliveryAddress == this.deliveryAddress &&
          other.pickupDate == this.pickupDate &&
          other.deliveryDate == this.deliveryDate &&
          other.createdAt == this.createdAt &&
          other.rawData == this.rawData);
}

class LoadsCompanion extends UpdateCompanion<Load> {
  final Value<String> id;
  final Value<String> loadNumber;
  final Value<String> status;
  final Value<String?> assignedDriverId;
  final Value<String?> assignedDriverName;
  final Value<String> pickupAddress;
  final Value<String> deliveryAddress;
  final Value<DateTime> pickupDate;
  final Value<DateTime> deliveryDate;
  final Value<DateTime> createdAt;
  final Value<String> rawData;
  final Value<int> rowid;
  const LoadsCompanion({
    this.id = const Value.absent(),
    this.loadNumber = const Value.absent(),
    this.status = const Value.absent(),
    this.assignedDriverId = const Value.absent(),
    this.assignedDriverName = const Value.absent(),
    this.pickupAddress = const Value.absent(),
    this.deliveryAddress = const Value.absent(),
    this.pickupDate = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rawData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoadsCompanion.insert({
    required String id,
    required String loadNumber,
    required String status,
    this.assignedDriverId = const Value.absent(),
    this.assignedDriverName = const Value.absent(),
    required String pickupAddress,
    required String deliveryAddress,
    required DateTime pickupDate,
    required DateTime deliveryDate,
    required DateTime createdAt,
    required String rawData,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       loadNumber = Value(loadNumber),
       status = Value(status),
       pickupAddress = Value(pickupAddress),
       deliveryAddress = Value(deliveryAddress),
       pickupDate = Value(pickupDate),
       deliveryDate = Value(deliveryDate),
       createdAt = Value(createdAt),
       rawData = Value(rawData);
  static Insertable<Load> custom({
    Expression<String>? id,
    Expression<String>? loadNumber,
    Expression<String>? status,
    Expression<String>? assignedDriverId,
    Expression<String>? assignedDriverName,
    Expression<String>? pickupAddress,
    Expression<String>? deliveryAddress,
    Expression<DateTime>? pickupDate,
    Expression<DateTime>? deliveryDate,
    Expression<DateTime>? createdAt,
    Expression<String>? rawData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loadNumber != null) 'load_number': loadNumber,
      if (status != null) 'status': status,
      if (assignedDriverId != null) 'assigned_driver_id': assignedDriverId,
      if (assignedDriverName != null)
        'assigned_driver_name': assignedDriverName,
      if (pickupAddress != null) 'pickup_address': pickupAddress,
      if (deliveryAddress != null) 'delivery_address': deliveryAddress,
      if (pickupDate != null) 'pickup_date': pickupDate,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (createdAt != null) 'created_at': createdAt,
      if (rawData != null) 'raw_data': rawData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoadsCompanion copyWith({
    Value<String>? id,
    Value<String>? loadNumber,
    Value<String>? status,
    Value<String?>? assignedDriverId,
    Value<String?>? assignedDriverName,
    Value<String>? pickupAddress,
    Value<String>? deliveryAddress,
    Value<DateTime>? pickupDate,
    Value<DateTime>? deliveryDate,
    Value<DateTime>? createdAt,
    Value<String>? rawData,
    Value<int>? rowid,
  }) {
    return LoadsCompanion(
      id: id ?? this.id,
      loadNumber: loadNumber ?? this.loadNumber,
      status: status ?? this.status,
      assignedDriverId: assignedDriverId ?? this.assignedDriverId,
      assignedDriverName: assignedDriverName ?? this.assignedDriverName,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      pickupDate: pickupDate ?? this.pickupDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      createdAt: createdAt ?? this.createdAt,
      rawData: rawData ?? this.rawData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loadNumber.present) {
      map['load_number'] = Variable<String>(loadNumber.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (assignedDriverId.present) {
      map['assigned_driver_id'] = Variable<String>(assignedDriverId.value);
    }
    if (assignedDriverName.present) {
      map['assigned_driver_name'] = Variable<String>(assignedDriverName.value);
    }
    if (pickupAddress.present) {
      map['pickup_address'] = Variable<String>(pickupAddress.value);
    }
    if (deliveryAddress.present) {
      map['delivery_address'] = Variable<String>(deliveryAddress.value);
    }
    if (pickupDate.present) {
      map['pickup_date'] = Variable<DateTime>(pickupDate.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rawData.present) {
      map['raw_data'] = Variable<String>(rawData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoadsCompanion(')
          ..write('id: $id, ')
          ..write('loadNumber: $loadNumber, ')
          ..write('status: $status, ')
          ..write('assignedDriverId: $assignedDriverId, ')
          ..write('assignedDriverName: $assignedDriverName, ')
          ..write('pickupAddress: $pickupAddress, ')
          ..write('deliveryAddress: $deliveryAddress, ')
          ..write('pickupDate: $pickupDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('rawData: $rawData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StopsTable extends Stops with TableInfo<$StopsTable, Stop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StopsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loadIdMeta = const VerificationMeta('loadId');
  @override
  late final GeneratedColumn<String> loadId = GeneratedColumn<String>(
    'load_id',
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
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _geofenceRadiusMeta = const VerificationMeta(
    'geofenceRadius',
  );
  @override
  late final GeneratedColumn<double> geofenceRadius = GeneratedColumn<double>(
    'geofence_radius',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expectedArrivalMeta = const VerificationMeta(
    'expectedArrival',
  );
  @override
  late final GeneratedColumn<DateTime> expectedArrival =
      GeneratedColumn<DateTime>(
        'expected_arrival',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _actualArrivalMeta = const VerificationMeta(
    'actualArrival',
  );
  @override
  late final GeneratedColumn<DateTime> actualArrival =
      GeneratedColumn<DateTime>(
        'actual_arrival',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _actualDepartureMeta = const VerificationMeta(
    'actualDeparture',
  );
  @override
  late final GeneratedColumn<DateTime> actualDeparture =
      GeneratedColumn<DateTime>(
        'actual_departure',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
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
  static const VerificationMeta _rawDataMeta = const VerificationMeta(
    'rawData',
  );
  @override
  late final GeneratedColumn<String> rawData = GeneratedColumn<String>(
    'raw_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    loadId,
    type,
    address,
    latitude,
    longitude,
    geofenceRadius,
    status,
    expectedArrival,
    actualArrival,
    actualDeparture,
    notes,
    rawData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stops';
  @override
  VerificationContext validateIntegrity(
    Insertable<Stop> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('load_id')) {
      context.handle(
        _loadIdMeta,
        loadId.isAcceptableOrUnknown(data['load_id']!, _loadIdMeta),
      );
    } else if (isInserting) {
      context.missing(_loadIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
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
    if (data.containsKey('geofence_radius')) {
      context.handle(
        _geofenceRadiusMeta,
        geofenceRadius.isAcceptableOrUnknown(
          data['geofence_radius']!,
          _geofenceRadiusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_geofenceRadiusMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('expected_arrival')) {
      context.handle(
        _expectedArrivalMeta,
        expectedArrival.isAcceptableOrUnknown(
          data['expected_arrival']!,
          _expectedArrivalMeta,
        ),
      );
    }
    if (data.containsKey('actual_arrival')) {
      context.handle(
        _actualArrivalMeta,
        actualArrival.isAcceptableOrUnknown(
          data['actual_arrival']!,
          _actualArrivalMeta,
        ),
      );
    }
    if (data.containsKey('actual_departure')) {
      context.handle(
        _actualDepartureMeta,
        actualDeparture.isAcceptableOrUnknown(
          data['actual_departure']!,
          _actualDepartureMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('raw_data')) {
      context.handle(
        _rawDataMeta,
        rawData.isAcceptableOrUnknown(data['raw_data']!, _rawDataMeta),
      );
    } else if (isInserting) {
      context.missing(_rawDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stop(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      loadId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}load_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      geofenceRadius: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}geofence_radius'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      expectedArrival: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expected_arrival'],
      ),
      actualArrival: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actual_arrival'],
      ),
      actualDeparture: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actual_departure'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      rawData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_data'],
      )!,
    );
  }

  @override
  $StopsTable createAlias(String alias) {
    return $StopsTable(attachedDatabase, alias);
  }
}

class Stop extends DataClass implements Insertable<Stop> {
  final String id;
  final String loadId;
  final String type;
  final String address;
  final double latitude;
  final double longitude;
  final double geofenceRadius;
  final String status;
  final DateTime? expectedArrival;
  final DateTime? actualArrival;
  final DateTime? actualDeparture;
  final String? notes;
  final String rawData;
  const Stop({
    required this.id,
    required this.loadId,
    required this.type,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.geofenceRadius,
    required this.status,
    this.expectedArrival,
    this.actualArrival,
    this.actualDeparture,
    this.notes,
    required this.rawData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['load_id'] = Variable<String>(loadId);
    map['type'] = Variable<String>(type);
    map['address'] = Variable<String>(address);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['geofence_radius'] = Variable<double>(geofenceRadius);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || expectedArrival != null) {
      map['expected_arrival'] = Variable<DateTime>(expectedArrival);
    }
    if (!nullToAbsent || actualArrival != null) {
      map['actual_arrival'] = Variable<DateTime>(actualArrival);
    }
    if (!nullToAbsent || actualDeparture != null) {
      map['actual_departure'] = Variable<DateTime>(actualDeparture);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['raw_data'] = Variable<String>(rawData);
    return map;
  }

  StopsCompanion toCompanion(bool nullToAbsent) {
    return StopsCompanion(
      id: Value(id),
      loadId: Value(loadId),
      type: Value(type),
      address: Value(address),
      latitude: Value(latitude),
      longitude: Value(longitude),
      geofenceRadius: Value(geofenceRadius),
      status: Value(status),
      expectedArrival: expectedArrival == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedArrival),
      actualArrival: actualArrival == null && nullToAbsent
          ? const Value.absent()
          : Value(actualArrival),
      actualDeparture: actualDeparture == null && nullToAbsent
          ? const Value.absent()
          : Value(actualDeparture),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      rawData: Value(rawData),
    );
  }

  factory Stop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stop(
      id: serializer.fromJson<String>(json['id']),
      loadId: serializer.fromJson<String>(json['loadId']),
      type: serializer.fromJson<String>(json['type']),
      address: serializer.fromJson<String>(json['address']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      geofenceRadius: serializer.fromJson<double>(json['geofenceRadius']),
      status: serializer.fromJson<String>(json['status']),
      expectedArrival: serializer.fromJson<DateTime?>(json['expectedArrival']),
      actualArrival: serializer.fromJson<DateTime?>(json['actualArrival']),
      actualDeparture: serializer.fromJson<DateTime?>(json['actualDeparture']),
      notes: serializer.fromJson<String?>(json['notes']),
      rawData: serializer.fromJson<String>(json['rawData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loadId': serializer.toJson<String>(loadId),
      'type': serializer.toJson<String>(type),
      'address': serializer.toJson<String>(address),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'geofenceRadius': serializer.toJson<double>(geofenceRadius),
      'status': serializer.toJson<String>(status),
      'expectedArrival': serializer.toJson<DateTime?>(expectedArrival),
      'actualArrival': serializer.toJson<DateTime?>(actualArrival),
      'actualDeparture': serializer.toJson<DateTime?>(actualDeparture),
      'notes': serializer.toJson<String?>(notes),
      'rawData': serializer.toJson<String>(rawData),
    };
  }

  Stop copyWith({
    String? id,
    String? loadId,
    String? type,
    String? address,
    double? latitude,
    double? longitude,
    double? geofenceRadius,
    String? status,
    Value<DateTime?> expectedArrival = const Value.absent(),
    Value<DateTime?> actualArrival = const Value.absent(),
    Value<DateTime?> actualDeparture = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? rawData,
  }) => Stop(
    id: id ?? this.id,
    loadId: loadId ?? this.loadId,
    type: type ?? this.type,
    address: address ?? this.address,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    geofenceRadius: geofenceRadius ?? this.geofenceRadius,
    status: status ?? this.status,
    expectedArrival: expectedArrival.present
        ? expectedArrival.value
        : this.expectedArrival,
    actualArrival: actualArrival.present
        ? actualArrival.value
        : this.actualArrival,
    actualDeparture: actualDeparture.present
        ? actualDeparture.value
        : this.actualDeparture,
    notes: notes.present ? notes.value : this.notes,
    rawData: rawData ?? this.rawData,
  );
  Stop copyWithCompanion(StopsCompanion data) {
    return Stop(
      id: data.id.present ? data.id.value : this.id,
      loadId: data.loadId.present ? data.loadId.value : this.loadId,
      type: data.type.present ? data.type.value : this.type,
      address: data.address.present ? data.address.value : this.address,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      geofenceRadius: data.geofenceRadius.present
          ? data.geofenceRadius.value
          : this.geofenceRadius,
      status: data.status.present ? data.status.value : this.status,
      expectedArrival: data.expectedArrival.present
          ? data.expectedArrival.value
          : this.expectedArrival,
      actualArrival: data.actualArrival.present
          ? data.actualArrival.value
          : this.actualArrival,
      actualDeparture: data.actualDeparture.present
          ? data.actualDeparture.value
          : this.actualDeparture,
      notes: data.notes.present ? data.notes.value : this.notes,
      rawData: data.rawData.present ? data.rawData.value : this.rawData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Stop(')
          ..write('id: $id, ')
          ..write('loadId: $loadId, ')
          ..write('type: $type, ')
          ..write('address: $address, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('geofenceRadius: $geofenceRadius, ')
          ..write('status: $status, ')
          ..write('expectedArrival: $expectedArrival, ')
          ..write('actualArrival: $actualArrival, ')
          ..write('actualDeparture: $actualDeparture, ')
          ..write('notes: $notes, ')
          ..write('rawData: $rawData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    loadId,
    type,
    address,
    latitude,
    longitude,
    geofenceRadius,
    status,
    expectedArrival,
    actualArrival,
    actualDeparture,
    notes,
    rawData,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stop &&
          other.id == this.id &&
          other.loadId == this.loadId &&
          other.type == this.type &&
          other.address == this.address &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.geofenceRadius == this.geofenceRadius &&
          other.status == this.status &&
          other.expectedArrival == this.expectedArrival &&
          other.actualArrival == this.actualArrival &&
          other.actualDeparture == this.actualDeparture &&
          other.notes == this.notes &&
          other.rawData == this.rawData);
}

class StopsCompanion extends UpdateCompanion<Stop> {
  final Value<String> id;
  final Value<String> loadId;
  final Value<String> type;
  final Value<String> address;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double> geofenceRadius;
  final Value<String> status;
  final Value<DateTime?> expectedArrival;
  final Value<DateTime?> actualArrival;
  final Value<DateTime?> actualDeparture;
  final Value<String?> notes;
  final Value<String> rawData;
  final Value<int> rowid;
  const StopsCompanion({
    this.id = const Value.absent(),
    this.loadId = const Value.absent(),
    this.type = const Value.absent(),
    this.address = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.geofenceRadius = const Value.absent(),
    this.status = const Value.absent(),
    this.expectedArrival = const Value.absent(),
    this.actualArrival = const Value.absent(),
    this.actualDeparture = const Value.absent(),
    this.notes = const Value.absent(),
    this.rawData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StopsCompanion.insert({
    required String id,
    required String loadId,
    required String type,
    required String address,
    required double latitude,
    required double longitude,
    required double geofenceRadius,
    required String status,
    this.expectedArrival = const Value.absent(),
    this.actualArrival = const Value.absent(),
    this.actualDeparture = const Value.absent(),
    this.notes = const Value.absent(),
    required String rawData,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       loadId = Value(loadId),
       type = Value(type),
       address = Value(address),
       latitude = Value(latitude),
       longitude = Value(longitude),
       geofenceRadius = Value(geofenceRadius),
       status = Value(status),
       rawData = Value(rawData);
  static Insertable<Stop> custom({
    Expression<String>? id,
    Expression<String>? loadId,
    Expression<String>? type,
    Expression<String>? address,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? geofenceRadius,
    Expression<String>? status,
    Expression<DateTime>? expectedArrival,
    Expression<DateTime>? actualArrival,
    Expression<DateTime>? actualDeparture,
    Expression<String>? notes,
    Expression<String>? rawData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loadId != null) 'load_id': loadId,
      if (type != null) 'type': type,
      if (address != null) 'address': address,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (geofenceRadius != null) 'geofence_radius': geofenceRadius,
      if (status != null) 'status': status,
      if (expectedArrival != null) 'expected_arrival': expectedArrival,
      if (actualArrival != null) 'actual_arrival': actualArrival,
      if (actualDeparture != null) 'actual_departure': actualDeparture,
      if (notes != null) 'notes': notes,
      if (rawData != null) 'raw_data': rawData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StopsCompanion copyWith({
    Value<String>? id,
    Value<String>? loadId,
    Value<String>? type,
    Value<String>? address,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<double>? geofenceRadius,
    Value<String>? status,
    Value<DateTime?>? expectedArrival,
    Value<DateTime?>? actualArrival,
    Value<DateTime?>? actualDeparture,
    Value<String?>? notes,
    Value<String>? rawData,
    Value<int>? rowid,
  }) {
    return StopsCompanion(
      id: id ?? this.id,
      loadId: loadId ?? this.loadId,
      type: type ?? this.type,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      geofenceRadius: geofenceRadius ?? this.geofenceRadius,
      status: status ?? this.status,
      expectedArrival: expectedArrival ?? this.expectedArrival,
      actualArrival: actualArrival ?? this.actualArrival,
      actualDeparture: actualDeparture ?? this.actualDeparture,
      notes: notes ?? this.notes,
      rawData: rawData ?? this.rawData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loadId.present) {
      map['load_id'] = Variable<String>(loadId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (geofenceRadius.present) {
      map['geofence_radius'] = Variable<double>(geofenceRadius.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (expectedArrival.present) {
      map['expected_arrival'] = Variable<DateTime>(expectedArrival.value);
    }
    if (actualArrival.present) {
      map['actual_arrival'] = Variable<DateTime>(actualArrival.value);
    }
    if (actualDeparture.present) {
      map['actual_departure'] = Variable<DateTime>(actualDeparture.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rawData.present) {
      map['raw_data'] = Variable<String>(rawData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StopsCompanion(')
          ..write('id: $id, ')
          ..write('loadId: $loadId, ')
          ..write('type: $type, ')
          ..write('address: $address, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('geofenceRadius: $geofenceRadius, ')
          ..write('status: $status, ')
          ..write('expectedArrival: $expectedArrival, ')
          ..write('actualArrival: $actualArrival, ')
          ..write('actualDeparture: $actualDeparture, ')
          ..write('notes: $notes, ')
          ..write('rawData: $rawData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PodsTable extends Pods with TableInfo<$PodsTable, Pod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopIdMeta = const VerificationMeta('stopId');
  @override
  late final GeneratedColumn<String> stopId = GeneratedColumn<String>(
    'stop_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loadIdMeta = const VerificationMeta('loadId');
  @override
  late final GeneratedColumn<String> loadId = GeneratedColumn<String>(
    'load_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receiverNameMeta = const VerificationMeta(
    'receiverName',
  );
  @override
  late final GeneratedColumn<String> receiverName = GeneratedColumn<String>(
    'receiver_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _signaturePathMeta = const VerificationMeta(
    'signaturePath',
  );
  @override
  late final GeneratedColumn<String> signaturePath = GeneratedColumn<String>(
    'signature_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photosMeta = const VerificationMeta('photos');
  @override
  late final GeneratedColumn<String> photos = GeneratedColumn<String>(
    'photos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _packageScansMeta = const VerificationMeta(
    'packageScans',
  );
  @override
  late final GeneratedColumn<String> packageScans = GeneratedColumn<String>(
    'package_scans',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rawDataMeta = const VerificationMeta(
    'rawData',
  );
  @override
  late final GeneratedColumn<String> rawData = GeneratedColumn<String>(
    'raw_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    stopId,
    loadId,
    receiverName,
    signaturePath,
    photos,
    notes,
    packageScans,
    latitude,
    longitude,
    createdAt,
    isSynced,
    rawData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pods';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('stop_id')) {
      context.handle(
        _stopIdMeta,
        stopId.isAcceptableOrUnknown(data['stop_id']!, _stopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stopIdMeta);
    }
    if (data.containsKey('load_id')) {
      context.handle(
        _loadIdMeta,
        loadId.isAcceptableOrUnknown(data['load_id']!, _loadIdMeta),
      );
    } else if (isInserting) {
      context.missing(_loadIdMeta);
    }
    if (data.containsKey('receiver_name')) {
      context.handle(
        _receiverNameMeta,
        receiverName.isAcceptableOrUnknown(
          data['receiver_name']!,
          _receiverNameMeta,
        ),
      );
    }
    if (data.containsKey('signature_path')) {
      context.handle(
        _signaturePathMeta,
        signaturePath.isAcceptableOrUnknown(
          data['signature_path']!,
          _signaturePathMeta,
        ),
      );
    }
    if (data.containsKey('photos')) {
      context.handle(
        _photosMeta,
        photos.isAcceptableOrUnknown(data['photos']!, _photosMeta),
      );
    } else if (isInserting) {
      context.missing(_photosMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('package_scans')) {
      context.handle(
        _packageScansMeta,
        packageScans.isAcceptableOrUnknown(
          data['package_scans']!,
          _packageScansMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_packageScansMeta);
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('raw_data')) {
      context.handle(
        _rawDataMeta,
        rawData.isAcceptableOrUnknown(data['raw_data']!, _rawDataMeta),
      );
    } else if (isInserting) {
      context.missing(_rawDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pod(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      stopId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stop_id'],
      )!,
      loadId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}load_id'],
      )!,
      receiverName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receiver_name'],
      ),
      signaturePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature_path'],
      ),
      photos: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photos'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      packageScans: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}package_scans'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      rawData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_data'],
      )!,
    );
  }

  @override
  $PodsTable createAlias(String alias) {
    return $PodsTable(attachedDatabase, alias);
  }
}

class Pod extends DataClass implements Insertable<Pod> {
  final String id;
  final String stopId;
  final String loadId;
  final String? receiverName;
  final String? signaturePath;
  final String photos;
  final String? notes;
  final String packageScans;
  final double latitude;
  final double longitude;
  final DateTime createdAt;
  final bool isSynced;
  final String rawData;
  const Pod({
    required this.id,
    required this.stopId,
    required this.loadId,
    this.receiverName,
    this.signaturePath,
    required this.photos,
    this.notes,
    required this.packageScans,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.isSynced,
    required this.rawData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['stop_id'] = Variable<String>(stopId);
    map['load_id'] = Variable<String>(loadId);
    if (!nullToAbsent || receiverName != null) {
      map['receiver_name'] = Variable<String>(receiverName);
    }
    if (!nullToAbsent || signaturePath != null) {
      map['signature_path'] = Variable<String>(signaturePath);
    }
    map['photos'] = Variable<String>(photos);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['package_scans'] = Variable<String>(packageScans);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['raw_data'] = Variable<String>(rawData);
    return map;
  }

  PodsCompanion toCompanion(bool nullToAbsent) {
    return PodsCompanion(
      id: Value(id),
      stopId: Value(stopId),
      loadId: Value(loadId),
      receiverName: receiverName == null && nullToAbsent
          ? const Value.absent()
          : Value(receiverName),
      signaturePath: signaturePath == null && nullToAbsent
          ? const Value.absent()
          : Value(signaturePath),
      photos: Value(photos),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      packageScans: Value(packageScans),
      latitude: Value(latitude),
      longitude: Value(longitude),
      createdAt: Value(createdAt),
      isSynced: Value(isSynced),
      rawData: Value(rawData),
    );
  }

  factory Pod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pod(
      id: serializer.fromJson<String>(json['id']),
      stopId: serializer.fromJson<String>(json['stopId']),
      loadId: serializer.fromJson<String>(json['loadId']),
      receiverName: serializer.fromJson<String?>(json['receiverName']),
      signaturePath: serializer.fromJson<String?>(json['signaturePath']),
      photos: serializer.fromJson<String>(json['photos']),
      notes: serializer.fromJson<String?>(json['notes']),
      packageScans: serializer.fromJson<String>(json['packageScans']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      rawData: serializer.fromJson<String>(json['rawData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'stopId': serializer.toJson<String>(stopId),
      'loadId': serializer.toJson<String>(loadId),
      'receiverName': serializer.toJson<String?>(receiverName),
      'signaturePath': serializer.toJson<String?>(signaturePath),
      'photos': serializer.toJson<String>(photos),
      'notes': serializer.toJson<String?>(notes),
      'packageScans': serializer.toJson<String>(packageScans),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'rawData': serializer.toJson<String>(rawData),
    };
  }

  Pod copyWith({
    String? id,
    String? stopId,
    String? loadId,
    Value<String?> receiverName = const Value.absent(),
    Value<String?> signaturePath = const Value.absent(),
    String? photos,
    Value<String?> notes = const Value.absent(),
    String? packageScans,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    bool? isSynced,
    String? rawData,
  }) => Pod(
    id: id ?? this.id,
    stopId: stopId ?? this.stopId,
    loadId: loadId ?? this.loadId,
    receiverName: receiverName.present ? receiverName.value : this.receiverName,
    signaturePath: signaturePath.present
        ? signaturePath.value
        : this.signaturePath,
    photos: photos ?? this.photos,
    notes: notes.present ? notes.value : this.notes,
    packageScans: packageScans ?? this.packageScans,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    createdAt: createdAt ?? this.createdAt,
    isSynced: isSynced ?? this.isSynced,
    rawData: rawData ?? this.rawData,
  );
  Pod copyWithCompanion(PodsCompanion data) {
    return Pod(
      id: data.id.present ? data.id.value : this.id,
      stopId: data.stopId.present ? data.stopId.value : this.stopId,
      loadId: data.loadId.present ? data.loadId.value : this.loadId,
      receiverName: data.receiverName.present
          ? data.receiverName.value
          : this.receiverName,
      signaturePath: data.signaturePath.present
          ? data.signaturePath.value
          : this.signaturePath,
      photos: data.photos.present ? data.photos.value : this.photos,
      notes: data.notes.present ? data.notes.value : this.notes,
      packageScans: data.packageScans.present
          ? data.packageScans.value
          : this.packageScans,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      rawData: data.rawData.present ? data.rawData.value : this.rawData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pod(')
          ..write('id: $id, ')
          ..write('stopId: $stopId, ')
          ..write('loadId: $loadId, ')
          ..write('receiverName: $receiverName, ')
          ..write('signaturePath: $signaturePath, ')
          ..write('photos: $photos, ')
          ..write('notes: $notes, ')
          ..write('packageScans: $packageScans, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createdAt: $createdAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rawData: $rawData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    stopId,
    loadId,
    receiverName,
    signaturePath,
    photos,
    notes,
    packageScans,
    latitude,
    longitude,
    createdAt,
    isSynced,
    rawData,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pod &&
          other.id == this.id &&
          other.stopId == this.stopId &&
          other.loadId == this.loadId &&
          other.receiverName == this.receiverName &&
          other.signaturePath == this.signaturePath &&
          other.photos == this.photos &&
          other.notes == this.notes &&
          other.packageScans == this.packageScans &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.createdAt == this.createdAt &&
          other.isSynced == this.isSynced &&
          other.rawData == this.rawData);
}

class PodsCompanion extends UpdateCompanion<Pod> {
  final Value<String> id;
  final Value<String> stopId;
  final Value<String> loadId;
  final Value<String?> receiverName;
  final Value<String?> signaturePath;
  final Value<String> photos;
  final Value<String?> notes;
  final Value<String> packageScans;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> createdAt;
  final Value<bool> isSynced;
  final Value<String> rawData;
  final Value<int> rowid;
  const PodsCompanion({
    this.id = const Value.absent(),
    this.stopId = const Value.absent(),
    this.loadId = const Value.absent(),
    this.receiverName = const Value.absent(),
    this.signaturePath = const Value.absent(),
    this.photos = const Value.absent(),
    this.notes = const Value.absent(),
    this.packageScans = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rawData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PodsCompanion.insert({
    required String id,
    required String stopId,
    required String loadId,
    this.receiverName = const Value.absent(),
    this.signaturePath = const Value.absent(),
    required String photos,
    this.notes = const Value.absent(),
    required String packageScans,
    required double latitude,
    required double longitude,
    required DateTime createdAt,
    this.isSynced = const Value.absent(),
    required String rawData,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       stopId = Value(stopId),
       loadId = Value(loadId),
       photos = Value(photos),
       packageScans = Value(packageScans),
       latitude = Value(latitude),
       longitude = Value(longitude),
       createdAt = Value(createdAt),
       rawData = Value(rawData);
  static Insertable<Pod> custom({
    Expression<String>? id,
    Expression<String>? stopId,
    Expression<String>? loadId,
    Expression<String>? receiverName,
    Expression<String>? signaturePath,
    Expression<String>? photos,
    Expression<String>? notes,
    Expression<String>? packageScans,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? createdAt,
    Expression<bool>? isSynced,
    Expression<String>? rawData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stopId != null) 'stop_id': stopId,
      if (loadId != null) 'load_id': loadId,
      if (receiverName != null) 'receiver_name': receiverName,
      if (signaturePath != null) 'signature_path': signaturePath,
      if (photos != null) 'photos': photos,
      if (notes != null) 'notes': notes,
      if (packageScans != null) 'package_scans': packageScans,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (createdAt != null) 'created_at': createdAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rawData != null) 'raw_data': rawData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PodsCompanion copyWith({
    Value<String>? id,
    Value<String>? stopId,
    Value<String>? loadId,
    Value<String?>? receiverName,
    Value<String?>? signaturePath,
    Value<String>? photos,
    Value<String?>? notes,
    Value<String>? packageScans,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<DateTime>? createdAt,
    Value<bool>? isSynced,
    Value<String>? rawData,
    Value<int>? rowid,
  }) {
    return PodsCompanion(
      id: id ?? this.id,
      stopId: stopId ?? this.stopId,
      loadId: loadId ?? this.loadId,
      receiverName: receiverName ?? this.receiverName,
      signaturePath: signaturePath ?? this.signaturePath,
      photos: photos ?? this.photos,
      notes: notes ?? this.notes,
      packageScans: packageScans ?? this.packageScans,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      isSynced: isSynced ?? this.isSynced,
      rawData: rawData ?? this.rawData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (stopId.present) {
      map['stop_id'] = Variable<String>(stopId.value);
    }
    if (loadId.present) {
      map['load_id'] = Variable<String>(loadId.value);
    }
    if (receiverName.present) {
      map['receiver_name'] = Variable<String>(receiverName.value);
    }
    if (signaturePath.present) {
      map['signature_path'] = Variable<String>(signaturePath.value);
    }
    if (photos.present) {
      map['photos'] = Variable<String>(photos.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (packageScans.present) {
      map['package_scans'] = Variable<String>(packageScans.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rawData.present) {
      map['raw_data'] = Variable<String>(rawData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodsCompanion(')
          ..write('id: $id, ')
          ..write('stopId: $stopId, ')
          ..write('loadId: $loadId, ')
          ..write('receiverName: $receiverName, ')
          ..write('signaturePath: $signaturePath, ')
          ..write('photos: $photos, ')
          ..write('notes: $notes, ')
          ..write('packageScans: $packageScans, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createdAt: $createdAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rawData: $rawData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IncidentsTable extends Incidents
    with TableInfo<$IncidentsTable, Incident> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncidentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loadIdMeta = const VerificationMeta('loadId');
  @override
  late final GeneratedColumn<String> loadId = GeneratedColumn<String>(
    'load_id',
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
  static const VerificationMeta _photosMeta = const VerificationMeta('photos');
  @override
  late final GeneratedColumn<String> photos = GeneratedColumn<String>(
    'photos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _voiceNotePathMeta = const VerificationMeta(
    'voiceNotePath',
  );
  @override
  late final GeneratedColumn<String> voiceNotePath = GeneratedColumn<String>(
    'voice_note_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _isResolvedMeta = const VerificationMeta(
    'isResolved',
  );
  @override
  late final GeneratedColumn<bool> isResolved = GeneratedColumn<bool>(
    'is_resolved',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_resolved" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rawDataMeta = const VerificationMeta(
    'rawData',
  );
  @override
  late final GeneratedColumn<String> rawData = GeneratedColumn<String>(
    'raw_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    loadId,
    type,
    description,
    photos,
    voiceNotePath,
    latitude,
    longitude,
    createdAt,
    isResolved,
    isSynced,
    rawData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'incidents';
  @override
  VerificationContext validateIntegrity(
    Insertable<Incident> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('load_id')) {
      context.handle(
        _loadIdMeta,
        loadId.isAcceptableOrUnknown(data['load_id']!, _loadIdMeta),
      );
    } else if (isInserting) {
      context.missing(_loadIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
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
    if (data.containsKey('photos')) {
      context.handle(
        _photosMeta,
        photos.isAcceptableOrUnknown(data['photos']!, _photosMeta),
      );
    } else if (isInserting) {
      context.missing(_photosMeta);
    }
    if (data.containsKey('voice_note_path')) {
      context.handle(
        _voiceNotePathMeta,
        voiceNotePath.isAcceptableOrUnknown(
          data['voice_note_path']!,
          _voiceNotePathMeta,
        ),
      );
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_resolved')) {
      context.handle(
        _isResolvedMeta,
        isResolved.isAcceptableOrUnknown(data['is_resolved']!, _isResolvedMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('raw_data')) {
      context.handle(
        _rawDataMeta,
        rawData.isAcceptableOrUnknown(data['raw_data']!, _rawDataMeta),
      );
    } else if (isInserting) {
      context.missing(_rawDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Incident map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Incident(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      loadId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}load_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      photos: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photos'],
      )!,
      voiceNotePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voice_note_path'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isResolved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_resolved'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      rawData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_data'],
      )!,
    );
  }

  @override
  $IncidentsTable createAlias(String alias) {
    return $IncidentsTable(attachedDatabase, alias);
  }
}

class Incident extends DataClass implements Insertable<Incident> {
  final String id;
  final String loadId;
  final String type;
  final String description;
  final String photos;
  final String? voiceNotePath;
  final double latitude;
  final double longitude;
  final DateTime createdAt;
  final bool isResolved;
  final bool isSynced;
  final String rawData;
  const Incident({
    required this.id,
    required this.loadId,
    required this.type,
    required this.description,
    required this.photos,
    this.voiceNotePath,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.isResolved,
    required this.isSynced,
    required this.rawData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['load_id'] = Variable<String>(loadId);
    map['type'] = Variable<String>(type);
    map['description'] = Variable<String>(description);
    map['photos'] = Variable<String>(photos);
    if (!nullToAbsent || voiceNotePath != null) {
      map['voice_note_path'] = Variable<String>(voiceNotePath);
    }
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_resolved'] = Variable<bool>(isResolved);
    map['is_synced'] = Variable<bool>(isSynced);
    map['raw_data'] = Variable<String>(rawData);
    return map;
  }

  IncidentsCompanion toCompanion(bool nullToAbsent) {
    return IncidentsCompanion(
      id: Value(id),
      loadId: Value(loadId),
      type: Value(type),
      description: Value(description),
      photos: Value(photos),
      voiceNotePath: voiceNotePath == null && nullToAbsent
          ? const Value.absent()
          : Value(voiceNotePath),
      latitude: Value(latitude),
      longitude: Value(longitude),
      createdAt: Value(createdAt),
      isResolved: Value(isResolved),
      isSynced: Value(isSynced),
      rawData: Value(rawData),
    );
  }

  factory Incident.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Incident(
      id: serializer.fromJson<String>(json['id']),
      loadId: serializer.fromJson<String>(json['loadId']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String>(json['description']),
      photos: serializer.fromJson<String>(json['photos']),
      voiceNotePath: serializer.fromJson<String?>(json['voiceNotePath']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isResolved: serializer.fromJson<bool>(json['isResolved']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      rawData: serializer.fromJson<String>(json['rawData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loadId': serializer.toJson<String>(loadId),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String>(description),
      'photos': serializer.toJson<String>(photos),
      'voiceNotePath': serializer.toJson<String?>(voiceNotePath),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isResolved': serializer.toJson<bool>(isResolved),
      'isSynced': serializer.toJson<bool>(isSynced),
      'rawData': serializer.toJson<String>(rawData),
    };
  }

  Incident copyWith({
    String? id,
    String? loadId,
    String? type,
    String? description,
    String? photos,
    Value<String?> voiceNotePath = const Value.absent(),
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    bool? isResolved,
    bool? isSynced,
    String? rawData,
  }) => Incident(
    id: id ?? this.id,
    loadId: loadId ?? this.loadId,
    type: type ?? this.type,
    description: description ?? this.description,
    photos: photos ?? this.photos,
    voiceNotePath: voiceNotePath.present
        ? voiceNotePath.value
        : this.voiceNotePath,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    createdAt: createdAt ?? this.createdAt,
    isResolved: isResolved ?? this.isResolved,
    isSynced: isSynced ?? this.isSynced,
    rawData: rawData ?? this.rawData,
  );
  Incident copyWithCompanion(IncidentsCompanion data) {
    return Incident(
      id: data.id.present ? data.id.value : this.id,
      loadId: data.loadId.present ? data.loadId.value : this.loadId,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      photos: data.photos.present ? data.photos.value : this.photos,
      voiceNotePath: data.voiceNotePath.present
          ? data.voiceNotePath.value
          : this.voiceNotePath,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isResolved: data.isResolved.present
          ? data.isResolved.value
          : this.isResolved,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      rawData: data.rawData.present ? data.rawData.value : this.rawData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Incident(')
          ..write('id: $id, ')
          ..write('loadId: $loadId, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('photos: $photos, ')
          ..write('voiceNotePath: $voiceNotePath, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createdAt: $createdAt, ')
          ..write('isResolved: $isResolved, ')
          ..write('isSynced: $isSynced, ')
          ..write('rawData: $rawData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    loadId,
    type,
    description,
    photos,
    voiceNotePath,
    latitude,
    longitude,
    createdAt,
    isResolved,
    isSynced,
    rawData,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Incident &&
          other.id == this.id &&
          other.loadId == this.loadId &&
          other.type == this.type &&
          other.description == this.description &&
          other.photos == this.photos &&
          other.voiceNotePath == this.voiceNotePath &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.createdAt == this.createdAt &&
          other.isResolved == this.isResolved &&
          other.isSynced == this.isSynced &&
          other.rawData == this.rawData);
}

class IncidentsCompanion extends UpdateCompanion<Incident> {
  final Value<String> id;
  final Value<String> loadId;
  final Value<String> type;
  final Value<String> description;
  final Value<String> photos;
  final Value<String?> voiceNotePath;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> createdAt;
  final Value<bool> isResolved;
  final Value<bool> isSynced;
  final Value<String> rawData;
  final Value<int> rowid;
  const IncidentsCompanion({
    this.id = const Value.absent(),
    this.loadId = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.photos = const Value.absent(),
    this.voiceNotePath = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isResolved = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rawData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IncidentsCompanion.insert({
    required String id,
    required String loadId,
    required String type,
    required String description,
    required String photos,
    this.voiceNotePath = const Value.absent(),
    required double latitude,
    required double longitude,
    required DateTime createdAt,
    this.isResolved = const Value.absent(),
    this.isSynced = const Value.absent(),
    required String rawData,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       loadId = Value(loadId),
       type = Value(type),
       description = Value(description),
       photos = Value(photos),
       latitude = Value(latitude),
       longitude = Value(longitude),
       createdAt = Value(createdAt),
       rawData = Value(rawData);
  static Insertable<Incident> custom({
    Expression<String>? id,
    Expression<String>? loadId,
    Expression<String>? type,
    Expression<String>? description,
    Expression<String>? photos,
    Expression<String>? voiceNotePath,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? createdAt,
    Expression<bool>? isResolved,
    Expression<bool>? isSynced,
    Expression<String>? rawData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loadId != null) 'load_id': loadId,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (photos != null) 'photos': photos,
      if (voiceNotePath != null) 'voice_note_path': voiceNotePath,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (createdAt != null) 'created_at': createdAt,
      if (isResolved != null) 'is_resolved': isResolved,
      if (isSynced != null) 'is_synced': isSynced,
      if (rawData != null) 'raw_data': rawData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IncidentsCompanion copyWith({
    Value<String>? id,
    Value<String>? loadId,
    Value<String>? type,
    Value<String>? description,
    Value<String>? photos,
    Value<String?>? voiceNotePath,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<DateTime>? createdAt,
    Value<bool>? isResolved,
    Value<bool>? isSynced,
    Value<String>? rawData,
    Value<int>? rowid,
  }) {
    return IncidentsCompanion(
      id: id ?? this.id,
      loadId: loadId ?? this.loadId,
      type: type ?? this.type,
      description: description ?? this.description,
      photos: photos ?? this.photos,
      voiceNotePath: voiceNotePath ?? this.voiceNotePath,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      isResolved: isResolved ?? this.isResolved,
      isSynced: isSynced ?? this.isSynced,
      rawData: rawData ?? this.rawData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loadId.present) {
      map['load_id'] = Variable<String>(loadId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photos.present) {
      map['photos'] = Variable<String>(photos.value);
    }
    if (voiceNotePath.present) {
      map['voice_note_path'] = Variable<String>(voiceNotePath.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isResolved.present) {
      map['is_resolved'] = Variable<bool>(isResolved.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rawData.present) {
      map['raw_data'] = Variable<String>(rawData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncidentsCompanion(')
          ..write('id: $id, ')
          ..write('loadId: $loadId, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('photos: $photos, ')
          ..write('voiceNotePath: $voiceNotePath, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createdAt: $createdAt, ')
          ..write('isResolved: $isResolved, ')
          ..write('isSynced: $isSynced, ')
          ..write('rawData: $rawData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UploadTasksTable extends UploadTasks
    with TableInfo<$UploadTasksTable, UploadTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UploadTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
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
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endpointMeta = const VerificationMeta(
    'endpoint',
  );
  @override
  late final GeneratedColumn<String> endpoint = GeneratedColumn<String>(
    'endpoint',
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
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
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    entityId,
    filePath,
    endpoint,
    status,
    progress,
    retryCount,
    errorMessage,
    createdAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'upload_tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<UploadTask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('endpoint')) {
      context.handle(
        _endpointMeta,
        endpoint.isAcceptableOrUnknown(data['endpoint']!, _endpointMeta),
      );
    } else if (isInserting) {
      context.missing(_endpointMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
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
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UploadTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UploadTask(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      endpoint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}endpoint'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $UploadTasksTable createAlias(String alias) {
    return $UploadTasksTable(attachedDatabase, alias);
  }
}

class UploadTask extends DataClass implements Insertable<UploadTask> {
  final String id;
  final String type;
  final String entityId;
  final String filePath;
  final String endpoint;
  final String status;
  final double progress;
  final int retryCount;
  final String? errorMessage;
  final DateTime createdAt;
  final DateTime? completedAt;
  const UploadTask({
    required this.id,
    required this.type,
    required this.entityId,
    required this.filePath,
    required this.endpoint,
    required this.status,
    required this.progress,
    required this.retryCount,
    this.errorMessage,
    required this.createdAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['entity_id'] = Variable<String>(entityId);
    map['file_path'] = Variable<String>(filePath);
    map['endpoint'] = Variable<String>(endpoint);
    map['status'] = Variable<String>(status);
    map['progress'] = Variable<double>(progress);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  UploadTasksCompanion toCompanion(bool nullToAbsent) {
    return UploadTasksCompanion(
      id: Value(id),
      type: Value(type),
      entityId: Value(entityId),
      filePath: Value(filePath),
      endpoint: Value(endpoint),
      status: Value(status),
      progress: Value(progress),
      retryCount: Value(retryCount),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      createdAt: Value(createdAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory UploadTask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UploadTask(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      entityId: serializer.fromJson<String>(json['entityId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      endpoint: serializer.fromJson<String>(json['endpoint']),
      status: serializer.fromJson<String>(json['status']),
      progress: serializer.fromJson<double>(json['progress']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'entityId': serializer.toJson<String>(entityId),
      'filePath': serializer.toJson<String>(filePath),
      'endpoint': serializer.toJson<String>(endpoint),
      'status': serializer.toJson<String>(status),
      'progress': serializer.toJson<double>(progress),
      'retryCount': serializer.toJson<int>(retryCount),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  UploadTask copyWith({
    String? id,
    String? type,
    String? entityId,
    String? filePath,
    String? endpoint,
    String? status,
    double? progress,
    int? retryCount,
    Value<String?> errorMessage = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => UploadTask(
    id: id ?? this.id,
    type: type ?? this.type,
    entityId: entityId ?? this.entityId,
    filePath: filePath ?? this.filePath,
    endpoint: endpoint ?? this.endpoint,
    status: status ?? this.status,
    progress: progress ?? this.progress,
    retryCount: retryCount ?? this.retryCount,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    createdAt: createdAt ?? this.createdAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  UploadTask copyWithCompanion(UploadTasksCompanion data) {
    return UploadTask(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      endpoint: data.endpoint.present ? data.endpoint.value : this.endpoint,
      status: data.status.present ? data.status.value : this.status,
      progress: data.progress.present ? data.progress.value : this.progress,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UploadTask(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('entityId: $entityId, ')
          ..write('filePath: $filePath, ')
          ..write('endpoint: $endpoint, ')
          ..write('status: $status, ')
          ..write('progress: $progress, ')
          ..write('retryCount: $retryCount, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    entityId,
    filePath,
    endpoint,
    status,
    progress,
    retryCount,
    errorMessage,
    createdAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UploadTask &&
          other.id == this.id &&
          other.type == this.type &&
          other.entityId == this.entityId &&
          other.filePath == this.filePath &&
          other.endpoint == this.endpoint &&
          other.status == this.status &&
          other.progress == this.progress &&
          other.retryCount == this.retryCount &&
          other.errorMessage == this.errorMessage &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt);
}

class UploadTasksCompanion extends UpdateCompanion<UploadTask> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> entityId;
  final Value<String> filePath;
  final Value<String> endpoint;
  final Value<String> status;
  final Value<double> progress;
  final Value<int> retryCount;
  final Value<String?> errorMessage;
  final Value<DateTime> createdAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const UploadTasksCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.entityId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.endpoint = const Value.absent(),
    this.status = const Value.absent(),
    this.progress = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UploadTasksCompanion.insert({
    required String id,
    required String type,
    required String entityId,
    required String filePath,
    required String endpoint,
    required String status,
    this.progress = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.errorMessage = const Value.absent(),
    required DateTime createdAt,
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       entityId = Value(entityId),
       filePath = Value(filePath),
       endpoint = Value(endpoint),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<UploadTask> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? entityId,
    Expression<String>? filePath,
    Expression<String>? endpoint,
    Expression<String>? status,
    Expression<double>? progress,
    Expression<int>? retryCount,
    Expression<String>? errorMessage,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (entityId != null) 'entity_id': entityId,
      if (filePath != null) 'file_path': filePath,
      if (endpoint != null) 'endpoint': endpoint,
      if (status != null) 'status': status,
      if (progress != null) 'progress': progress,
      if (retryCount != null) 'retry_count': retryCount,
      if (errorMessage != null) 'error_message': errorMessage,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UploadTasksCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<String>? entityId,
    Value<String>? filePath,
    Value<String>? endpoint,
    Value<String>? status,
    Value<double>? progress,
    Value<int>? retryCount,
    Value<String?>? errorMessage,
    Value<DateTime>? createdAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return UploadTasksCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      entityId: entityId ?? this.entityId,
      filePath: filePath ?? this.filePath,
      endpoint: endpoint ?? this.endpoint,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      retryCount: retryCount ?? this.retryCount,
      errorMessage: errorMessage ?? this.errorMessage,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (endpoint.present) {
      map['endpoint'] = Variable<String>(endpoint.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UploadTasksCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('entityId: $entityId, ')
          ..write('filePath: $filePath, ')
          ..write('endpoint: $endpoint, ')
          ..write('status: $status, ')
          ..write('progress: $progress, ')
          ..write('retryCount: $retryCount, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endpointMeta = const VerificationMeta(
    'endpoint',
  );
  @override
  late final GeneratedColumn<String> endpoint = GeneratedColumn<String>(
    'endpoint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
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
  static const VerificationMeta _lastRetryAtMeta = const VerificationMeta(
    'lastRetryAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastRetryAt = GeneratedColumn<DateTime>(
    'last_retry_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    endpoint,
    method,
    payload,
    retryCount,
    lastError,
    createdAt,
    lastRetryAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('endpoint')) {
      context.handle(
        _endpointMeta,
        endpoint.isAcceptableOrUnknown(data['endpoint']!, _endpointMeta),
      );
    } else if (isInserting) {
      context.missing(_endpointMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
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
    if (data.containsKey('last_retry_at')) {
      context.handle(
        _lastRetryAtMeta,
        lastRetryAt.isAcceptableOrUnknown(
          data['last_retry_at']!,
          _lastRetryAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      endpoint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}endpoint'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastRetryAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_retry_at'],
      ),
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final String id;
  final String endpoint;
  final String method;
  final String payload;
  final int retryCount;
  final String? lastError;
  final DateTime createdAt;
  final DateTime? lastRetryAt;
  const SyncQueueData({
    required this.id,
    required this.endpoint,
    required this.method,
    required this.payload,
    required this.retryCount,
    this.lastError,
    required this.createdAt,
    this.lastRetryAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['endpoint'] = Variable<String>(endpoint);
    map['method'] = Variable<String>(method);
    map['payload'] = Variable<String>(payload);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastRetryAt != null) {
      map['last_retry_at'] = Variable<DateTime>(lastRetryAt);
    }
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      endpoint: Value(endpoint),
      method: Value(method),
      payload: Value(payload),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      lastRetryAt: lastRetryAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRetryAt),
    );
  }

  factory SyncQueueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<String>(json['id']),
      endpoint: serializer.fromJson<String>(json['endpoint']),
      method: serializer.fromJson<String>(json['method']),
      payload: serializer.fromJson<String>(json['payload']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastRetryAt: serializer.fromJson<DateTime?>(json['lastRetryAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'endpoint': serializer.toJson<String>(endpoint),
      'method': serializer.toJson<String>(method),
      'payload': serializer.toJson<String>(payload),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastRetryAt': serializer.toJson<DateTime?>(lastRetryAt),
    };
  }

  SyncQueueData copyWith({
    String? id,
    String? endpoint,
    String? method,
    String? payload,
    int? retryCount,
    Value<String?> lastError = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> lastRetryAt = const Value.absent(),
  }) => SyncQueueData(
    id: id ?? this.id,
    endpoint: endpoint ?? this.endpoint,
    method: method ?? this.method,
    payload: payload ?? this.payload,
    retryCount: retryCount ?? this.retryCount,
    lastError: lastError.present ? lastError.value : this.lastError,
    createdAt: createdAt ?? this.createdAt,
    lastRetryAt: lastRetryAt.present ? lastRetryAt.value : this.lastRetryAt,
  );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      endpoint: data.endpoint.present ? data.endpoint.value : this.endpoint,
      method: data.method.present ? data.method.value : this.method,
      payload: data.payload.present ? data.payload.value : this.payload,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastRetryAt: data.lastRetryAt.present
          ? data.lastRetryAt.value
          : this.lastRetryAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('method: $method, ')
          ..write('payload: $payload, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastRetryAt: $lastRetryAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    endpoint,
    method,
    payload,
    retryCount,
    lastError,
    createdAt,
    lastRetryAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.endpoint == this.endpoint &&
          other.method == this.method &&
          other.payload == this.payload &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.lastRetryAt == this.lastRetryAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<String> id;
  final Value<String> endpoint;
  final Value<String> method;
  final Value<String> payload;
  final Value<int> retryCount;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastRetryAt;
  final Value<int> rowid;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.endpoint = const Value.absent(),
    this.method = const Value.absent(),
    this.payload = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastRetryAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    required String id,
    required String endpoint,
    required String method,
    required String payload,
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    required DateTime createdAt,
    this.lastRetryAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       endpoint = Value(endpoint),
       method = Value(method),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<SyncQueueData> custom({
    Expression<String>? id,
    Expression<String>? endpoint,
    Expression<String>? method,
    Expression<String>? payload,
    Expression<int>? retryCount,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastRetryAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (endpoint != null) 'endpoint': endpoint,
      if (method != null) 'method': method,
      if (payload != null) 'payload': payload,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (lastRetryAt != null) 'last_retry_at': lastRetryAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncQueueCompanion copyWith({
    Value<String>? id,
    Value<String>? endpoint,
    Value<String>? method,
    Value<String>? payload,
    Value<int>? retryCount,
    Value<String?>? lastError,
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastRetryAt,
    Value<int>? rowid,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      endpoint: endpoint ?? this.endpoint,
      method: method ?? this.method,
      payload: payload ?? this.payload,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      lastRetryAt: lastRetryAt ?? this.lastRetryAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (endpoint.present) {
      map['endpoint'] = Variable<String>(endpoint.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastRetryAt.present) {
      map['last_retry_at'] = Variable<DateTime>(lastRetryAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('method: $method, ')
          ..write('payload: $payload, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastRetryAt: $lastRetryAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocationPingsTable extends LocationPings
    with TableInfo<$LocationPingsTable, LocationPing> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationPingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _accuracyMeta = const VerificationMeta(
    'accuracy',
  );
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
    'accuracy',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
    'speed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    latitude,
    longitude,
    accuracy,
    speed,
    timestamp,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_pings';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationPing> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
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
    if (data.containsKey('accuracy')) {
      context.handle(
        _accuracyMeta,
        accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta),
      );
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationPing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationPing(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      accuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accuracy'],
      ),
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $LocationPingsTable createAlias(String alias) {
    return $LocationPingsTable(attachedDatabase, alias);
  }
}

class LocationPing extends DataClass implements Insertable<LocationPing> {
  final String id;
  final double latitude;
  final double longitude;
  final double? accuracy;
  final double? speed;
  final DateTime timestamp;
  final bool isSynced;
  const LocationPing({
    required this.id,
    required this.latitude,
    required this.longitude,
    this.accuracy,
    this.speed,
    required this.timestamp,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || accuracy != null) {
      map['accuracy'] = Variable<double>(accuracy);
    }
    if (!nullToAbsent || speed != null) {
      map['speed'] = Variable<double>(speed);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  LocationPingsCompanion toCompanion(bool nullToAbsent) {
    return LocationPingsCompanion(
      id: Value(id),
      latitude: Value(latitude),
      longitude: Value(longitude),
      accuracy: accuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracy),
      speed: speed == null && nullToAbsent
          ? const Value.absent()
          : Value(speed),
      timestamp: Value(timestamp),
      isSynced: Value(isSynced),
    );
  }

  factory LocationPing.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationPing(
      id: serializer.fromJson<String>(json['id']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      accuracy: serializer.fromJson<double?>(json['accuracy']),
      speed: serializer.fromJson<double?>(json['speed']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'accuracy': serializer.toJson<double?>(accuracy),
      'speed': serializer.toJson<double?>(speed),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  LocationPing copyWith({
    String? id,
    double? latitude,
    double? longitude,
    Value<double?> accuracy = const Value.absent(),
    Value<double?> speed = const Value.absent(),
    DateTime? timestamp,
    bool? isSynced,
  }) => LocationPing(
    id: id ?? this.id,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    accuracy: accuracy.present ? accuracy.value : this.accuracy,
    speed: speed.present ? speed.value : this.speed,
    timestamp: timestamp ?? this.timestamp,
    isSynced: isSynced ?? this.isSynced,
  );
  LocationPing copyWithCompanion(LocationPingsCompanion data) {
    return LocationPing(
      id: data.id.present ? data.id.value : this.id,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      speed: data.speed.present ? data.speed.value : this.speed,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationPing(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('accuracy: $accuracy, ')
          ..write('speed: $speed, ')
          ..write('timestamp: $timestamp, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    latitude,
    longitude,
    accuracy,
    speed,
    timestamp,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationPing &&
          other.id == this.id &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.accuracy == this.accuracy &&
          other.speed == this.speed &&
          other.timestamp == this.timestamp &&
          other.isSynced == this.isSynced);
}

class LocationPingsCompanion extends UpdateCompanion<LocationPing> {
  final Value<String> id;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double?> accuracy;
  final Value<double?> speed;
  final Value<DateTime> timestamp;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const LocationPingsCompanion({
    this.id = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.speed = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationPingsCompanion.insert({
    required String id,
    required double latitude,
    required double longitude,
    this.accuracy = const Value.absent(),
    this.speed = const Value.absent(),
    required DateTime timestamp,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       latitude = Value(latitude),
       longitude = Value(longitude),
       timestamp = Value(timestamp);
  static Insertable<LocationPing> custom({
    Expression<String>? id,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? accuracy,
    Expression<double>? speed,
    Expression<DateTime>? timestamp,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (accuracy != null) 'accuracy': accuracy,
      if (speed != null) 'speed': speed,
      if (timestamp != null) 'timestamp': timestamp,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationPingsCompanion copyWith({
    Value<String>? id,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<double?>? accuracy,
    Value<double?>? speed,
    Value<DateTime>? timestamp,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return LocationPingsCompanion(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      accuracy: accuracy ?? this.accuracy,
      speed: speed ?? this.speed,
      timestamp: timestamp ?? this.timestamp,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationPingsCompanion(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('accuracy: $accuracy, ')
          ..write('speed: $speed, ')
          ..write('timestamp: $timestamp, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LoadsTable loads = $LoadsTable(this);
  late final $StopsTable stops = $StopsTable(this);
  late final $PodsTable pods = $PodsTable(this);
  late final $IncidentsTable incidents = $IncidentsTable(this);
  late final $UploadTasksTable uploadTasks = $UploadTasksTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $LocationPingsTable locationPings = $LocationPingsTable(this);
  late final LoadsDao loadsDao = LoadsDao(this as AppDatabase);
  late final StopsDao stopsDao = StopsDao(this as AppDatabase);
  late final PodsDao podsDao = PodsDao(this as AppDatabase);
  late final IncidentsDao incidentsDao = IncidentsDao(this as AppDatabase);
  late final UploadTasksDao uploadTasksDao = UploadTasksDao(
    this as AppDatabase,
  );
  late final SyncQueueDao syncQueueDao = SyncQueueDao(this as AppDatabase);
  late final LocationPingsDao locationPingsDao = LocationPingsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    loads,
    stops,
    pods,
    incidents,
    uploadTasks,
    syncQueue,
    locationPings,
  ];
}

typedef $$LoadsTableCreateCompanionBuilder =
    LoadsCompanion Function({
      required String id,
      required String loadNumber,
      required String status,
      Value<String?> assignedDriverId,
      Value<String?> assignedDriverName,
      required String pickupAddress,
      required String deliveryAddress,
      required DateTime pickupDate,
      required DateTime deliveryDate,
      required DateTime createdAt,
      required String rawData,
      Value<int> rowid,
    });
typedef $$LoadsTableUpdateCompanionBuilder =
    LoadsCompanion Function({
      Value<String> id,
      Value<String> loadNumber,
      Value<String> status,
      Value<String?> assignedDriverId,
      Value<String?> assignedDriverName,
      Value<String> pickupAddress,
      Value<String> deliveryAddress,
      Value<DateTime> pickupDate,
      Value<DateTime> deliveryDate,
      Value<DateTime> createdAt,
      Value<String> rawData,
      Value<int> rowid,
    });

class $$LoadsTableFilterComposer extends Composer<_$AppDatabase, $LoadsTable> {
  $$LoadsTableFilterComposer({
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

  ColumnFilters<String> get loadNumber => $composableBuilder(
    column: $table.loadNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignedDriverId => $composableBuilder(
    column: $table.assignedDriverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignedDriverName => $composableBuilder(
    column: $table.assignedDriverName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pickupAddress => $composableBuilder(
    column: $table.pickupAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliveryAddress => $composableBuilder(
    column: $table.deliveryAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get pickupDate => $composableBuilder(
    column: $table.pickupDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawData => $composableBuilder(
    column: $table.rawData,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LoadsTableOrderingComposer
    extends Composer<_$AppDatabase, $LoadsTable> {
  $$LoadsTableOrderingComposer({
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

  ColumnOrderings<String> get loadNumber => $composableBuilder(
    column: $table.loadNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignedDriverId => $composableBuilder(
    column: $table.assignedDriverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignedDriverName => $composableBuilder(
    column: $table.assignedDriverName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pickupAddress => $composableBuilder(
    column: $table.pickupAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliveryAddress => $composableBuilder(
    column: $table.deliveryAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get pickupDate => $composableBuilder(
    column: $table.pickupDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawData => $composableBuilder(
    column: $table.rawData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LoadsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoadsTable> {
  $$LoadsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get loadNumber => $composableBuilder(
    column: $table.loadNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get assignedDriverId => $composableBuilder(
    column: $table.assignedDriverId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assignedDriverName => $composableBuilder(
    column: $table.assignedDriverName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pickupAddress => $composableBuilder(
    column: $table.pickupAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deliveryAddress => $composableBuilder(
    column: $table.deliveryAddress,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get pickupDate => $composableBuilder(
    column: $table.pickupDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get rawData =>
      $composableBuilder(column: $table.rawData, builder: (column) => column);
}

class $$LoadsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LoadsTable,
          Load,
          $$LoadsTableFilterComposer,
          $$LoadsTableOrderingComposer,
          $$LoadsTableAnnotationComposer,
          $$LoadsTableCreateCompanionBuilder,
          $$LoadsTableUpdateCompanionBuilder,
          (Load, BaseReferences<_$AppDatabase, $LoadsTable, Load>),
          Load,
          PrefetchHooks Function()
        > {
  $$LoadsTableTableManager(_$AppDatabase db, $LoadsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoadsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoadsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoadsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> loadNumber = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> assignedDriverId = const Value.absent(),
                Value<String?> assignedDriverName = const Value.absent(),
                Value<String> pickupAddress = const Value.absent(),
                Value<String> deliveryAddress = const Value.absent(),
                Value<DateTime> pickupDate = const Value.absent(),
                Value<DateTime> deliveryDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> rawData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LoadsCompanion(
                id: id,
                loadNumber: loadNumber,
                status: status,
                assignedDriverId: assignedDriverId,
                assignedDriverName: assignedDriverName,
                pickupAddress: pickupAddress,
                deliveryAddress: deliveryAddress,
                pickupDate: pickupDate,
                deliveryDate: deliveryDate,
                createdAt: createdAt,
                rawData: rawData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String loadNumber,
                required String status,
                Value<String?> assignedDriverId = const Value.absent(),
                Value<String?> assignedDriverName = const Value.absent(),
                required String pickupAddress,
                required String deliveryAddress,
                required DateTime pickupDate,
                required DateTime deliveryDate,
                required DateTime createdAt,
                required String rawData,
                Value<int> rowid = const Value.absent(),
              }) => LoadsCompanion.insert(
                id: id,
                loadNumber: loadNumber,
                status: status,
                assignedDriverId: assignedDriverId,
                assignedDriverName: assignedDriverName,
                pickupAddress: pickupAddress,
                deliveryAddress: deliveryAddress,
                pickupDate: pickupDate,
                deliveryDate: deliveryDate,
                createdAt: createdAt,
                rawData: rawData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LoadsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LoadsTable,
      Load,
      $$LoadsTableFilterComposer,
      $$LoadsTableOrderingComposer,
      $$LoadsTableAnnotationComposer,
      $$LoadsTableCreateCompanionBuilder,
      $$LoadsTableUpdateCompanionBuilder,
      (Load, BaseReferences<_$AppDatabase, $LoadsTable, Load>),
      Load,
      PrefetchHooks Function()
    >;
typedef $$StopsTableCreateCompanionBuilder =
    StopsCompanion Function({
      required String id,
      required String loadId,
      required String type,
      required String address,
      required double latitude,
      required double longitude,
      required double geofenceRadius,
      required String status,
      Value<DateTime?> expectedArrival,
      Value<DateTime?> actualArrival,
      Value<DateTime?> actualDeparture,
      Value<String?> notes,
      required String rawData,
      Value<int> rowid,
    });
typedef $$StopsTableUpdateCompanionBuilder =
    StopsCompanion Function({
      Value<String> id,
      Value<String> loadId,
      Value<String> type,
      Value<String> address,
      Value<double> latitude,
      Value<double> longitude,
      Value<double> geofenceRadius,
      Value<String> status,
      Value<DateTime?> expectedArrival,
      Value<DateTime?> actualArrival,
      Value<DateTime?> actualDeparture,
      Value<String?> notes,
      Value<String> rawData,
      Value<int> rowid,
    });

class $$StopsTableFilterComposer extends Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableFilterComposer({
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

  ColumnFilters<String> get loadId => $composableBuilder(
    column: $table.loadId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
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

  ColumnFilters<double> get geofenceRadius => $composableBuilder(
    column: $table.geofenceRadius,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expectedArrival => $composableBuilder(
    column: $table.expectedArrival,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualArrival => $composableBuilder(
    column: $table.actualArrival,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualDeparture => $composableBuilder(
    column: $table.actualDeparture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawData => $composableBuilder(
    column: $table.rawData,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StopsTableOrderingComposer
    extends Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableOrderingComposer({
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

  ColumnOrderings<String> get loadId => $composableBuilder(
    column: $table.loadId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
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

  ColumnOrderings<double> get geofenceRadius => $composableBuilder(
    column: $table.geofenceRadius,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expectedArrival => $composableBuilder(
    column: $table.expectedArrival,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualArrival => $composableBuilder(
    column: $table.actualArrival,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualDeparture => $composableBuilder(
    column: $table.actualDeparture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawData => $composableBuilder(
    column: $table.rawData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StopsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get loadId =>
      $composableBuilder(column: $table.loadId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get geofenceRadius => $composableBuilder(
    column: $table.geofenceRadius,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get expectedArrival => $composableBuilder(
    column: $table.expectedArrival,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualArrival => $composableBuilder(
    column: $table.actualArrival,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualDeparture => $composableBuilder(
    column: $table.actualDeparture,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get rawData =>
      $composableBuilder(column: $table.rawData, builder: (column) => column);
}

class $$StopsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StopsTable,
          Stop,
          $$StopsTableFilterComposer,
          $$StopsTableOrderingComposer,
          $$StopsTableAnnotationComposer,
          $$StopsTableCreateCompanionBuilder,
          $$StopsTableUpdateCompanionBuilder,
          (Stop, BaseReferences<_$AppDatabase, $StopsTable, Stop>),
          Stop,
          PrefetchHooks Function()
        > {
  $$StopsTableTableManager(_$AppDatabase db, $StopsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StopsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StopsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StopsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> loadId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<double> geofenceRadius = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> expectedArrival = const Value.absent(),
                Value<DateTime?> actualArrival = const Value.absent(),
                Value<DateTime?> actualDeparture = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> rawData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StopsCompanion(
                id: id,
                loadId: loadId,
                type: type,
                address: address,
                latitude: latitude,
                longitude: longitude,
                geofenceRadius: geofenceRadius,
                status: status,
                expectedArrival: expectedArrival,
                actualArrival: actualArrival,
                actualDeparture: actualDeparture,
                notes: notes,
                rawData: rawData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String loadId,
                required String type,
                required String address,
                required double latitude,
                required double longitude,
                required double geofenceRadius,
                required String status,
                Value<DateTime?> expectedArrival = const Value.absent(),
                Value<DateTime?> actualArrival = const Value.absent(),
                Value<DateTime?> actualDeparture = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String rawData,
                Value<int> rowid = const Value.absent(),
              }) => StopsCompanion.insert(
                id: id,
                loadId: loadId,
                type: type,
                address: address,
                latitude: latitude,
                longitude: longitude,
                geofenceRadius: geofenceRadius,
                status: status,
                expectedArrival: expectedArrival,
                actualArrival: actualArrival,
                actualDeparture: actualDeparture,
                notes: notes,
                rawData: rawData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StopsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StopsTable,
      Stop,
      $$StopsTableFilterComposer,
      $$StopsTableOrderingComposer,
      $$StopsTableAnnotationComposer,
      $$StopsTableCreateCompanionBuilder,
      $$StopsTableUpdateCompanionBuilder,
      (Stop, BaseReferences<_$AppDatabase, $StopsTable, Stop>),
      Stop,
      PrefetchHooks Function()
    >;
typedef $$PodsTableCreateCompanionBuilder =
    PodsCompanion Function({
      required String id,
      required String stopId,
      required String loadId,
      Value<String?> receiverName,
      Value<String?> signaturePath,
      required String photos,
      Value<String?> notes,
      required String packageScans,
      required double latitude,
      required double longitude,
      required DateTime createdAt,
      Value<bool> isSynced,
      required String rawData,
      Value<int> rowid,
    });
typedef $$PodsTableUpdateCompanionBuilder =
    PodsCompanion Function({
      Value<String> id,
      Value<String> stopId,
      Value<String> loadId,
      Value<String?> receiverName,
      Value<String?> signaturePath,
      Value<String> photos,
      Value<String?> notes,
      Value<String> packageScans,
      Value<double> latitude,
      Value<double> longitude,
      Value<DateTime> createdAt,
      Value<bool> isSynced,
      Value<String> rawData,
      Value<int> rowid,
    });

class $$PodsTableFilterComposer extends Composer<_$AppDatabase, $PodsTable> {
  $$PodsTableFilterComposer({
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

  ColumnFilters<String> get stopId => $composableBuilder(
    column: $table.stopId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get loadId => $composableBuilder(
    column: $table.loadId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiverName => $composableBuilder(
    column: $table.receiverName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signaturePath => $composableBuilder(
    column: $table.signaturePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photos => $composableBuilder(
    column: $table.photos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packageScans => $composableBuilder(
    column: $table.packageScans,
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawData => $composableBuilder(
    column: $table.rawData,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PodsTableOrderingComposer extends Composer<_$AppDatabase, $PodsTable> {
  $$PodsTableOrderingComposer({
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

  ColumnOrderings<String> get stopId => $composableBuilder(
    column: $table.stopId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get loadId => $composableBuilder(
    column: $table.loadId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiverName => $composableBuilder(
    column: $table.receiverName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signaturePath => $composableBuilder(
    column: $table.signaturePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photos => $composableBuilder(
    column: $table.photos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packageScans => $composableBuilder(
    column: $table.packageScans,
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawData => $composableBuilder(
    column: $table.rawData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PodsTable> {
  $$PodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get stopId =>
      $composableBuilder(column: $table.stopId, builder: (column) => column);

  GeneratedColumn<String> get loadId =>
      $composableBuilder(column: $table.loadId, builder: (column) => column);

  GeneratedColumn<String> get receiverName => $composableBuilder(
    column: $table.receiverName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get signaturePath => $composableBuilder(
    column: $table.signaturePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photos =>
      $composableBuilder(column: $table.photos, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get packageScans => $composableBuilder(
    column: $table.packageScans,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<String> get rawData =>
      $composableBuilder(column: $table.rawData, builder: (column) => column);
}

class $$PodsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PodsTable,
          Pod,
          $$PodsTableFilterComposer,
          $$PodsTableOrderingComposer,
          $$PodsTableAnnotationComposer,
          $$PodsTableCreateCompanionBuilder,
          $$PodsTableUpdateCompanionBuilder,
          (Pod, BaseReferences<_$AppDatabase, $PodsTable, Pod>),
          Pod,
          PrefetchHooks Function()
        > {
  $$PodsTableTableManager(_$AppDatabase db, $PodsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> stopId = const Value.absent(),
                Value<String> loadId = const Value.absent(),
                Value<String?> receiverName = const Value.absent(),
                Value<String?> signaturePath = const Value.absent(),
                Value<String> photos = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> packageScans = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<String> rawData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PodsCompanion(
                id: id,
                stopId: stopId,
                loadId: loadId,
                receiverName: receiverName,
                signaturePath: signaturePath,
                photos: photos,
                notes: notes,
                packageScans: packageScans,
                latitude: latitude,
                longitude: longitude,
                createdAt: createdAt,
                isSynced: isSynced,
                rawData: rawData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String stopId,
                required String loadId,
                Value<String?> receiverName = const Value.absent(),
                Value<String?> signaturePath = const Value.absent(),
                required String photos,
                Value<String?> notes = const Value.absent(),
                required String packageScans,
                required double latitude,
                required double longitude,
                required DateTime createdAt,
                Value<bool> isSynced = const Value.absent(),
                required String rawData,
                Value<int> rowid = const Value.absent(),
              }) => PodsCompanion.insert(
                id: id,
                stopId: stopId,
                loadId: loadId,
                receiverName: receiverName,
                signaturePath: signaturePath,
                photos: photos,
                notes: notes,
                packageScans: packageScans,
                latitude: latitude,
                longitude: longitude,
                createdAt: createdAt,
                isSynced: isSynced,
                rawData: rawData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PodsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PodsTable,
      Pod,
      $$PodsTableFilterComposer,
      $$PodsTableOrderingComposer,
      $$PodsTableAnnotationComposer,
      $$PodsTableCreateCompanionBuilder,
      $$PodsTableUpdateCompanionBuilder,
      (Pod, BaseReferences<_$AppDatabase, $PodsTable, Pod>),
      Pod,
      PrefetchHooks Function()
    >;
typedef $$IncidentsTableCreateCompanionBuilder =
    IncidentsCompanion Function({
      required String id,
      required String loadId,
      required String type,
      required String description,
      required String photos,
      Value<String?> voiceNotePath,
      required double latitude,
      required double longitude,
      required DateTime createdAt,
      Value<bool> isResolved,
      Value<bool> isSynced,
      required String rawData,
      Value<int> rowid,
    });
typedef $$IncidentsTableUpdateCompanionBuilder =
    IncidentsCompanion Function({
      Value<String> id,
      Value<String> loadId,
      Value<String> type,
      Value<String> description,
      Value<String> photos,
      Value<String?> voiceNotePath,
      Value<double> latitude,
      Value<double> longitude,
      Value<DateTime> createdAt,
      Value<bool> isResolved,
      Value<bool> isSynced,
      Value<String> rawData,
      Value<int> rowid,
    });

class $$IncidentsTableFilterComposer
    extends Composer<_$AppDatabase, $IncidentsTable> {
  $$IncidentsTableFilterComposer({
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

  ColumnFilters<String> get loadId => $composableBuilder(
    column: $table.loadId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photos => $composableBuilder(
    column: $table.photos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voiceNotePath => $composableBuilder(
    column: $table.voiceNotePath,
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isResolved => $composableBuilder(
    column: $table.isResolved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawData => $composableBuilder(
    column: $table.rawData,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IncidentsTableOrderingComposer
    extends Composer<_$AppDatabase, $IncidentsTable> {
  $$IncidentsTableOrderingComposer({
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

  ColumnOrderings<String> get loadId => $composableBuilder(
    column: $table.loadId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photos => $composableBuilder(
    column: $table.photos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voiceNotePath => $composableBuilder(
    column: $table.voiceNotePath,
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isResolved => $composableBuilder(
    column: $table.isResolved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawData => $composableBuilder(
    column: $table.rawData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IncidentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncidentsTable> {
  $$IncidentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get loadId =>
      $composableBuilder(column: $table.loadId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photos =>
      $composableBuilder(column: $table.photos, builder: (column) => column);

  GeneratedColumn<String> get voiceNotePath => $composableBuilder(
    column: $table.voiceNotePath,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isResolved => $composableBuilder(
    column: $table.isResolved,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<String> get rawData =>
      $composableBuilder(column: $table.rawData, builder: (column) => column);
}

class $$IncidentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncidentsTable,
          Incident,
          $$IncidentsTableFilterComposer,
          $$IncidentsTableOrderingComposer,
          $$IncidentsTableAnnotationComposer,
          $$IncidentsTableCreateCompanionBuilder,
          $$IncidentsTableUpdateCompanionBuilder,
          (Incident, BaseReferences<_$AppDatabase, $IncidentsTable, Incident>),
          Incident,
          PrefetchHooks Function()
        > {
  $$IncidentsTableTableManager(_$AppDatabase db, $IncidentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncidentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncidentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncidentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> loadId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> photos = const Value.absent(),
                Value<String?> voiceNotePath = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isResolved = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<String> rawData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IncidentsCompanion(
                id: id,
                loadId: loadId,
                type: type,
                description: description,
                photos: photos,
                voiceNotePath: voiceNotePath,
                latitude: latitude,
                longitude: longitude,
                createdAt: createdAt,
                isResolved: isResolved,
                isSynced: isSynced,
                rawData: rawData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String loadId,
                required String type,
                required String description,
                required String photos,
                Value<String?> voiceNotePath = const Value.absent(),
                required double latitude,
                required double longitude,
                required DateTime createdAt,
                Value<bool> isResolved = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                required String rawData,
                Value<int> rowid = const Value.absent(),
              }) => IncidentsCompanion.insert(
                id: id,
                loadId: loadId,
                type: type,
                description: description,
                photos: photos,
                voiceNotePath: voiceNotePath,
                latitude: latitude,
                longitude: longitude,
                createdAt: createdAt,
                isResolved: isResolved,
                isSynced: isSynced,
                rawData: rawData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IncidentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncidentsTable,
      Incident,
      $$IncidentsTableFilterComposer,
      $$IncidentsTableOrderingComposer,
      $$IncidentsTableAnnotationComposer,
      $$IncidentsTableCreateCompanionBuilder,
      $$IncidentsTableUpdateCompanionBuilder,
      (Incident, BaseReferences<_$AppDatabase, $IncidentsTable, Incident>),
      Incident,
      PrefetchHooks Function()
    >;
typedef $$UploadTasksTableCreateCompanionBuilder =
    UploadTasksCompanion Function({
      required String id,
      required String type,
      required String entityId,
      required String filePath,
      required String endpoint,
      required String status,
      Value<double> progress,
      Value<int> retryCount,
      Value<String?> errorMessage,
      required DateTime createdAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$UploadTasksTableUpdateCompanionBuilder =
    UploadTasksCompanion Function({
      Value<String> id,
      Value<String> type,
      Value<String> entityId,
      Value<String> filePath,
      Value<String> endpoint,
      Value<String> status,
      Value<double> progress,
      Value<int> retryCount,
      Value<String?> errorMessage,
      Value<DateTime> createdAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

class $$UploadTasksTableFilterComposer
    extends Composer<_$AppDatabase, $UploadTasksTable> {
  $$UploadTasksTableFilterComposer({
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

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endpoint => $composableBuilder(
    column: $table.endpoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UploadTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $UploadTasksTable> {
  $$UploadTasksTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endpoint => $composableBuilder(
    column: $table.endpoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UploadTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $UploadTasksTable> {
  $$UploadTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get endpoint =>
      $composableBuilder(column: $table.endpoint, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$UploadTasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UploadTasksTable,
          UploadTask,
          $$UploadTasksTableFilterComposer,
          $$UploadTasksTableOrderingComposer,
          $$UploadTasksTableAnnotationComposer,
          $$UploadTasksTableCreateCompanionBuilder,
          $$UploadTasksTableUpdateCompanionBuilder,
          (
            UploadTask,
            BaseReferences<_$AppDatabase, $UploadTasksTable, UploadTask>,
          ),
          UploadTask,
          PrefetchHooks Function()
        > {
  $$UploadTasksTableTableManager(_$AppDatabase db, $UploadTasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UploadTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UploadTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UploadTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> endpoint = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UploadTasksCompanion(
                id: id,
                type: type,
                entityId: entityId,
                filePath: filePath,
                endpoint: endpoint,
                status: status,
                progress: progress,
                retryCount: retryCount,
                errorMessage: errorMessage,
                createdAt: createdAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                required String entityId,
                required String filePath,
                required String endpoint,
                required String status,
                Value<double> progress = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UploadTasksCompanion.insert(
                id: id,
                type: type,
                entityId: entityId,
                filePath: filePath,
                endpoint: endpoint,
                status: status,
                progress: progress,
                retryCount: retryCount,
                errorMessage: errorMessage,
                createdAt: createdAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UploadTasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UploadTasksTable,
      UploadTask,
      $$UploadTasksTableFilterComposer,
      $$UploadTasksTableOrderingComposer,
      $$UploadTasksTableAnnotationComposer,
      $$UploadTasksTableCreateCompanionBuilder,
      $$UploadTasksTableUpdateCompanionBuilder,
      (
        UploadTask,
        BaseReferences<_$AppDatabase, $UploadTasksTable, UploadTask>,
      ),
      UploadTask,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      required String id,
      required String endpoint,
      required String method,
      required String payload,
      Value<int> retryCount,
      Value<String?> lastError,
      required DateTime createdAt,
      Value<DateTime?> lastRetryAt,
      Value<int> rowid,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<String> id,
      Value<String> endpoint,
      Value<String> method,
      Value<String> payload,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime> createdAt,
      Value<DateTime?> lastRetryAt,
      Value<int> rowid,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
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

  ColumnFilters<String> get endpoint => $composableBuilder(
    column: $table.endpoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastRetryAt => $composableBuilder(
    column: $table.lastRetryAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
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

  ColumnOrderings<String> get endpoint => $composableBuilder(
    column: $table.endpoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastRetryAt => $composableBuilder(
    column: $table.lastRetryAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get endpoint =>
      $composableBuilder(column: $table.endpoint, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastRetryAt => $composableBuilder(
    column: $table.lastRetryAt,
    builder: (column) => column,
  );
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
          ),
          SyncQueueData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> endpoint = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastRetryAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                endpoint: endpoint,
                method: method,
                payload: payload,
                retryCount: retryCount,
                lastError: lastError,
                createdAt: createdAt,
                lastRetryAt: lastRetryAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String endpoint,
                required String method,
                required String payload,
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> lastRetryAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncQueueCompanion.insert(
                id: id,
                endpoint: endpoint,
                method: method,
                payload: payload,
                retryCount: retryCount,
                lastError: lastError,
                createdAt: createdAt,
                lastRetryAt: lastRetryAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
      ),
      SyncQueueData,
      PrefetchHooks Function()
    >;
typedef $$LocationPingsTableCreateCompanionBuilder =
    LocationPingsCompanion Function({
      required String id,
      required double latitude,
      required double longitude,
      Value<double?> accuracy,
      Value<double?> speed,
      required DateTime timestamp,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$LocationPingsTableUpdateCompanionBuilder =
    LocationPingsCompanion Function({
      Value<String> id,
      Value<double> latitude,
      Value<double> longitude,
      Value<double?> accuracy,
      Value<double?> speed,
      Value<DateTime> timestamp,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$LocationPingsTableFilterComposer
    extends Composer<_$AppDatabase, $LocationPingsTable> {
  $$LocationPingsTableFilterComposer({
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

  ColumnFilters<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocationPingsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationPingsTable> {
  $$LocationPingsTableOrderingComposer({
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

  ColumnOrderings<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationPingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationPingsTable> {
  $$LocationPingsTableAnnotationComposer({
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

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$LocationPingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationPingsTable,
          LocationPing,
          $$LocationPingsTableFilterComposer,
          $$LocationPingsTableOrderingComposer,
          $$LocationPingsTableAnnotationComposer,
          $$LocationPingsTableCreateCompanionBuilder,
          $$LocationPingsTableUpdateCompanionBuilder,
          (
            LocationPing,
            BaseReferences<_$AppDatabase, $LocationPingsTable, LocationPing>,
          ),
          LocationPing,
          PrefetchHooks Function()
        > {
  $$LocationPingsTableTableManager(_$AppDatabase db, $LocationPingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationPingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationPingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationPingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<double?> accuracy = const Value.absent(),
                Value<double?> speed = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationPingsCompanion(
                id: id,
                latitude: latitude,
                longitude: longitude,
                accuracy: accuracy,
                speed: speed,
                timestamp: timestamp,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double latitude,
                required double longitude,
                Value<double?> accuracy = const Value.absent(),
                Value<double?> speed = const Value.absent(),
                required DateTime timestamp,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationPingsCompanion.insert(
                id: id,
                latitude: latitude,
                longitude: longitude,
                accuracy: accuracy,
                speed: speed,
                timestamp: timestamp,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocationPingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationPingsTable,
      LocationPing,
      $$LocationPingsTableFilterComposer,
      $$LocationPingsTableOrderingComposer,
      $$LocationPingsTableAnnotationComposer,
      $$LocationPingsTableCreateCompanionBuilder,
      $$LocationPingsTableUpdateCompanionBuilder,
      (
        LocationPing,
        BaseReferences<_$AppDatabase, $LocationPingsTable, LocationPing>,
      ),
      LocationPing,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LoadsTableTableManager get loads =>
      $$LoadsTableTableManager(_db, _db.loads);
  $$StopsTableTableManager get stops =>
      $$StopsTableTableManager(_db, _db.stops);
  $$PodsTableTableManager get pods => $$PodsTableTableManager(_db, _db.pods);
  $$IncidentsTableTableManager get incidents =>
      $$IncidentsTableTableManager(_db, _db.incidents);
  $$UploadTasksTableTableManager get uploadTasks =>
      $$UploadTasksTableTableManager(_db, _db.uploadTasks);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$LocationPingsTableTableManager get locationPings =>
      $$LocationPingsTableTableManager(_db, _db.locationPings);
}
