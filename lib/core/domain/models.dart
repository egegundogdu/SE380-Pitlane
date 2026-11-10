import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    required String userId,
    required String brand,
    required String model,
    required int year,
    required String plate,
    @Default('') String engine,
    @Default('') String color,
    @Default(<String>['benzin']) List<String> fuelTypes,
    @Default(15000) int serviceIntervalKm,
    @Default(12) int serviceIntervalMonths,
    @Default(1000) int remindKmBefore,
    @Default(14) int remindDaysBefore,
    @Default(false) bool remindersEnabled,
    DateTime? inspectionDue,
    DateTime? trafficInsuranceDue,
    DateTime? cascoDue,
    int? fuelLevelPct,
    DateTime? fuelLevelAt,
    @Default('unknown') String engineStatus,
    DateTime? engineStatusAt,
    @Default('') String engineStatusNote,
    String? photoPath,
    @Default(1) int version,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}

@freezed
abstract class OdometerReading with _$OdometerReading {
  const factory OdometerReading({
    required String id,
    required String vehicleId,
    required int km,
    required DateTime readOn,
    @Default('manual') String sourceType,
    @Default('') String sourceId,
    @Default(1) int version,
  }) = _OdometerReading;

  factory OdometerReading.fromJson(Map<String, dynamic> json) =>
      _$OdometerReadingFromJson(json);
}

@freezed
abstract class FuelEntry with _$FuelEntry {
  const factory FuelEntry({
    required String id,
    required String vehicleId,
    required DateTime filledAt,
    required String fuelType,
    required int litersMilli,
    required int unitPriceKurus,
    required int amountKurus,
    String? stationId,
    @Default('') String stationName,
    int? odometerKm,
    @Default(false) bool isFullTank,
    @Default('') String notes,
    @Default(1) int version,
  }) = _FuelEntry;

  factory FuelEntry.fromJson(Map<String, dynamic> json) =>
      _$FuelEntryFromJson(json);
}

@freezed
abstract class ServiceRecord with _$ServiceRecord {
  // Freezed forwards this constructor annotation to its generated JSON class.
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ServiceRecord({
    required String id,
    required String vehicleId,
    required DateTime performedOn,
    required String title,
    int? km,
    @Default('periodic') String type,
    @Default('') String workshop,
    @Default(0) int totalCostKurus,
    @Default('') String notes,
    @Default(false) bool resetsInterval,
    @Default(<ServicePart>[]) List<ServicePart> parts,
    @Default(1) int version,
  }) = _ServiceRecord;

  factory ServiceRecord.fromJson(Map<String, dynamic> json) =>
      _$ServiceRecordFromJson(json);
}

@freezed
abstract class ServicePart with _$ServicePart {
  const factory ServicePart({
    required String id,
    required String label,
    @Default(0) int costKurus,
  }) = _ServicePart;

  factory ServicePart.fromJson(Map<String, dynamic> json) =>
      _$ServicePartFromJson(json);
}

@freezed
abstract class Expense with _$Expense {
  const factory Expense({
    required String id,
    required String vehicleId,
    required DateTime spentOn,
    required String category,
    required int amountKurus,
    required String title,
    @Default('') String notes,
    @Default(1) int version,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}

@freezed
abstract class VehicleIssue with _$VehicleIssue {
  const factory VehicleIssue({
    required String id,
    required String vehicleId,
    required String title,
    @Default('warning') String severity,
    DateTime? resolvedAt,
    @Default(1) int version,
  }) = _VehicleIssue;

  factory VehicleIssue.fromJson(Map<String, dynamic> json) =>
      _$VehicleIssueFromJson(json);
}

@freezed
abstract class Station with _$Station {
  const factory Station({
    required String id,
    required String name,
    @Default('') String brand,
    @Default('') String address,
    @Default('') String taxNo,
    double? latitude,
    double? longitude,
    @Default(1) int version,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
}

@freezed
abstract class AppraisalReport with _$AppraisalReport {
  const factory AppraisalReport({
    required String id,
    required String vehicleId,
    required DateTime reportDate,
    required String company,
    required String filePath,
    required String mimeType,
    int? km,
    @Default('') String notes,
    @Default(1) int version,
  }) = _AppraisalReport;

  factory AppraisalReport.fromJson(Map<String, dynamic> json) =>
      _$AppraisalReportFromJson(json);
}

@freezed
abstract class LedgerEntry with _$LedgerEntry {
  const factory LedgerEntry({
    required String id,
    required String vehicleId,
    required DateTime date,
    required String category,
    required int amountKurus,
    required String title,
    required String sourceType,
    required String sourceId,
  }) = _LedgerEntry;

  factory LedgerEntry.fromJson(Map<String, dynamic> json) =>
      _$LedgerEntryFromJson(json);
}
