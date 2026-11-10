// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vehicle _$VehicleFromJson(Map<String, dynamic> json) => _Vehicle(
  id: json['id'] as String,
  userId: json['userId'] as String,
  brand: json['brand'] as String,
  model: json['model'] as String,
  year: (json['year'] as num).toInt(),
  plate: json['plate'] as String,
  engine: json['engine'] as String? ?? '',
  color: json['color'] as String? ?? '',
  fuelTypes:
      (json['fuelTypes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>['benzin'],
  serviceIntervalKm: (json['serviceIntervalKm'] as num?)?.toInt() ?? 15000,
  serviceIntervalMonths: (json['serviceIntervalMonths'] as num?)?.toInt() ?? 12,
  remindKmBefore: (json['remindKmBefore'] as num?)?.toInt() ?? 1000,
  remindDaysBefore: (json['remindDaysBefore'] as num?)?.toInt() ?? 14,
  remindersEnabled: json['remindersEnabled'] as bool? ?? false,
  inspectionDue: json['inspectionDue'] == null
      ? null
      : DateTime.parse(json['inspectionDue'] as String),
  trafficInsuranceDue: json['trafficInsuranceDue'] == null
      ? null
      : DateTime.parse(json['trafficInsuranceDue'] as String),
  cascoDue: json['cascoDue'] == null
      ? null
      : DateTime.parse(json['cascoDue'] as String),
  fuelLevelPct: (json['fuelLevelPct'] as num?)?.toInt(),
  fuelLevelAt: json['fuelLevelAt'] == null
      ? null
      : DateTime.parse(json['fuelLevelAt'] as String),
  engineStatus: json['engineStatus'] as String? ?? 'unknown',
  engineStatusAt: json['engineStatusAt'] == null
      ? null
      : DateTime.parse(json['engineStatusAt'] as String),
  engineStatusNote: json['engineStatusNote'] as String? ?? '',
  photoPath: json['photoPath'] as String?,
  version: (json['version'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$VehicleToJson(_Vehicle instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'brand': instance.brand,
  'model': instance.model,
  'year': instance.year,
  'plate': instance.plate,
  'engine': instance.engine,
  'color': instance.color,
  'fuelTypes': instance.fuelTypes,
  'serviceIntervalKm': instance.serviceIntervalKm,
  'serviceIntervalMonths': instance.serviceIntervalMonths,
  'remindKmBefore': instance.remindKmBefore,
  'remindDaysBefore': instance.remindDaysBefore,
  'remindersEnabled': instance.remindersEnabled,
  'inspectionDue': instance.inspectionDue?.toIso8601String(),
  'trafficInsuranceDue': instance.trafficInsuranceDue?.toIso8601String(),
  'cascoDue': instance.cascoDue?.toIso8601String(),
  'fuelLevelPct': instance.fuelLevelPct,
  'fuelLevelAt': instance.fuelLevelAt?.toIso8601String(),
  'engineStatus': instance.engineStatus,
  'engineStatusAt': instance.engineStatusAt?.toIso8601String(),
  'engineStatusNote': instance.engineStatusNote,
  'photoPath': instance.photoPath,
  'version': instance.version,
};

_OdometerReading _$OdometerReadingFromJson(Map<String, dynamic> json) =>
    _OdometerReading(
      id: json['id'] as String,
      vehicleId: json['vehicleId'] as String,
      km: (json['km'] as num).toInt(),
      readOn: DateTime.parse(json['readOn'] as String),
      sourceType: json['sourceType'] as String? ?? 'manual',
      sourceId: json['sourceId'] as String? ?? '',
      version: (json['version'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$OdometerReadingToJson(_OdometerReading instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'km': instance.km,
      'readOn': instance.readOn.toIso8601String(),
      'sourceType': instance.sourceType,
      'sourceId': instance.sourceId,
      'version': instance.version,
    };

_FuelEntry _$FuelEntryFromJson(Map<String, dynamic> json) => _FuelEntry(
  id: json['id'] as String,
  vehicleId: json['vehicleId'] as String,
  filledAt: DateTime.parse(json['filledAt'] as String),
  fuelType: json['fuelType'] as String,
  litersMilli: (json['litersMilli'] as num).toInt(),
  unitPriceKurus: (json['unitPriceKurus'] as num).toInt(),
  amountKurus: (json['amountKurus'] as num).toInt(),
  stationId: json['stationId'] as String?,
  stationName: json['stationName'] as String? ?? '',
  odometerKm: (json['odometerKm'] as num?)?.toInt(),
  isFullTank: json['isFullTank'] as bool? ?? false,
  notes: json['notes'] as String? ?? '',
  version: (json['version'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$FuelEntryToJson(_FuelEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'filledAt': instance.filledAt.toIso8601String(),
      'fuelType': instance.fuelType,
      'litersMilli': instance.litersMilli,
      'unitPriceKurus': instance.unitPriceKurus,
      'amountKurus': instance.amountKurus,
      'stationId': instance.stationId,
      'stationName': instance.stationName,
      'odometerKm': instance.odometerKm,
      'isFullTank': instance.isFullTank,
      'notes': instance.notes,
      'version': instance.version,
    };

_ServiceRecord _$ServiceRecordFromJson(Map<String, dynamic> json) =>
    _ServiceRecord(
      id: json['id'] as String,
      vehicleId: json['vehicleId'] as String,
      performedOn: DateTime.parse(json['performedOn'] as String),
      title: json['title'] as String,
      km: (json['km'] as num?)?.toInt(),
      type: json['type'] as String? ?? 'periodic',
      workshop: json['workshop'] as String? ?? '',
      totalCostKurus: (json['totalCostKurus'] as num?)?.toInt() ?? 0,
      notes: json['notes'] as String? ?? '',
      resetsInterval: json['resetsInterval'] as bool? ?? false,
      parts:
          (json['parts'] as List<dynamic>?)
              ?.map((e) => ServicePart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ServicePart>[],
      version: (json['version'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$ServiceRecordToJson(_ServiceRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'performedOn': instance.performedOn.toIso8601String(),
      'title': instance.title,
      'km': instance.km,
      'type': instance.type,
      'workshop': instance.workshop,
      'totalCostKurus': instance.totalCostKurus,
      'notes': instance.notes,
      'resetsInterval': instance.resetsInterval,
      'parts': instance.parts.map((e) => e.toJson()).toList(),
      'version': instance.version,
    };

_ServicePart _$ServicePartFromJson(Map<String, dynamic> json) => _ServicePart(
  id: json['id'] as String,
  label: json['label'] as String,
  costKurus: (json['costKurus'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ServicePartToJson(_ServicePart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'costKurus': instance.costKurus,
    };

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  id: json['id'] as String,
  vehicleId: json['vehicleId'] as String,
  spentOn: DateTime.parse(json['spentOn'] as String),
  category: json['category'] as String,
  amountKurus: (json['amountKurus'] as num).toInt(),
  title: json['title'] as String,
  notes: json['notes'] as String? ?? '',
  version: (json['version'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'id': instance.id,
  'vehicleId': instance.vehicleId,
  'spentOn': instance.spentOn.toIso8601String(),
  'category': instance.category,
  'amountKurus': instance.amountKurus,
  'title': instance.title,
  'notes': instance.notes,
  'version': instance.version,
};

_VehicleIssue _$VehicleIssueFromJson(Map<String, dynamic> json) =>
    _VehicleIssue(
      id: json['id'] as String,
      vehicleId: json['vehicleId'] as String,
      title: json['title'] as String,
      severity: json['severity'] as String? ?? 'warning',
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$VehicleIssueToJson(_VehicleIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'title': instance.title,
      'severity': instance.severity,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'version': instance.version,
    };

_Station _$StationFromJson(Map<String, dynamic> json) => _Station(
  id: json['id'] as String,
  name: json['name'] as String,
  brand: json['brand'] as String? ?? '',
  address: json['address'] as String? ?? '',
  taxNo: json['taxNo'] as String? ?? '',
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  version: (json['version'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$StationToJson(_Station instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'brand': instance.brand,
  'address': instance.address,
  'taxNo': instance.taxNo,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'version': instance.version,
};

_AppraisalReport _$AppraisalReportFromJson(Map<String, dynamic> json) =>
    _AppraisalReport(
      id: json['id'] as String,
      vehicleId: json['vehicleId'] as String,
      reportDate: DateTime.parse(json['reportDate'] as String),
      company: json['company'] as String,
      filePath: json['filePath'] as String,
      mimeType: json['mimeType'] as String,
      km: (json['km'] as num?)?.toInt(),
      notes: json['notes'] as String? ?? '',
      version: (json['version'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$AppraisalReportToJson(_AppraisalReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'reportDate': instance.reportDate.toIso8601String(),
      'company': instance.company,
      'filePath': instance.filePath,
      'mimeType': instance.mimeType,
      'km': instance.km,
      'notes': instance.notes,
      'version': instance.version,
    };

_LedgerEntry _$LedgerEntryFromJson(Map<String, dynamic> json) => _LedgerEntry(
  id: json['id'] as String,
  vehicleId: json['vehicleId'] as String,
  date: DateTime.parse(json['date'] as String),
  category: json['category'] as String,
  amountKurus: (json['amountKurus'] as num).toInt(),
  title: json['title'] as String,
  sourceType: json['sourceType'] as String,
  sourceId: json['sourceId'] as String,
);

Map<String, dynamic> _$LedgerEntryToJson(_LedgerEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'date': instance.date.toIso8601String(),
      'category': instance.category,
      'amountKurus': instance.amountKurus,
      'title': instance.title,
      'sourceType': instance.sourceType,
      'sourceId': instance.sourceId,
    };
