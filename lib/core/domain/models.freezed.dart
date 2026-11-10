// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vehicle {

 String get id; String get userId; String get brand; String get model; int get year; String get plate; String get engine; String get color; List<String> get fuelTypes; int get serviceIntervalKm; int get serviceIntervalMonths; int get remindKmBefore; int get remindDaysBefore; bool get remindersEnabled; DateTime? get inspectionDue; DateTime? get trafficInsuranceDue; DateTime? get cascoDue; int? get fuelLevelPct; DateTime? get fuelLevelAt; String get engineStatus; DateTime? get engineStatusAt; String get engineStatusNote; String? get photoPath; int get version;
/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCopyWith<Vehicle> get copyWith => _$VehicleCopyWithImpl<Vehicle>(this as Vehicle, _$identity);

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Vehicle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vehicle&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.model, _this.model) || other.model == _this.model)&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.plate, _this.plate) || other.plate == _this.plate)&&(identical(other.engine, _this.engine) || other.engine == _this.engine)&&(identical(other.color, _this.color) || other.color == _this.color)&&const DeepCollectionEquality().equals(other.fuelTypes, _this.fuelTypes)&&(identical(other.serviceIntervalKm, _this.serviceIntervalKm) || other.serviceIntervalKm == _this.serviceIntervalKm)&&(identical(other.serviceIntervalMonths, _this.serviceIntervalMonths) || other.serviceIntervalMonths == _this.serviceIntervalMonths)&&(identical(other.remindKmBefore, _this.remindKmBefore) || other.remindKmBefore == _this.remindKmBefore)&&(identical(other.remindDaysBefore, _this.remindDaysBefore) || other.remindDaysBefore == _this.remindDaysBefore)&&(identical(other.remindersEnabled, _this.remindersEnabled) || other.remindersEnabled == _this.remindersEnabled)&&(identical(other.inspectionDue, _this.inspectionDue) || other.inspectionDue == _this.inspectionDue)&&(identical(other.trafficInsuranceDue, _this.trafficInsuranceDue) || other.trafficInsuranceDue == _this.trafficInsuranceDue)&&(identical(other.cascoDue, _this.cascoDue) || other.cascoDue == _this.cascoDue)&&(identical(other.fuelLevelPct, _this.fuelLevelPct) || other.fuelLevelPct == _this.fuelLevelPct)&&(identical(other.fuelLevelAt, _this.fuelLevelAt) || other.fuelLevelAt == _this.fuelLevelAt)&&(identical(other.engineStatus, _this.engineStatus) || other.engineStatus == _this.engineStatus)&&(identical(other.engineStatusAt, _this.engineStatusAt) || other.engineStatusAt == _this.engineStatusAt)&&(identical(other.engineStatusNote, _this.engineStatusNote) || other.engineStatusNote == _this.engineStatusNote)&&(identical(other.photoPath, _this.photoPath) || other.photoPath == _this.photoPath)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Vehicle;
  return Object.hashAll([runtimeType,_this.id,_this.userId,_this.brand,_this.model,_this.year,_this.plate,_this.engine,_this.color,const DeepCollectionEquality().hash(_this.fuelTypes),_this.serviceIntervalKm,_this.serviceIntervalMonths,_this.remindKmBefore,_this.remindDaysBefore,_this.remindersEnabled,_this.inspectionDue,_this.trafficInsuranceDue,_this.cascoDue,_this.fuelLevelPct,_this.fuelLevelAt,_this.engineStatus,_this.engineStatusAt,_this.engineStatusNote,_this.photoPath,_this.version]);
}

@override
String toString() {
  final _this = this as Vehicle;
  return 'Vehicle(id: ${_this.id}, userId: ${_this.userId}, brand: ${_this.brand}, model: ${_this.model}, year: ${_this.year}, plate: ${_this.plate}, engine: ${_this.engine}, color: ${_this.color}, fuelTypes: ${_this.fuelTypes}, serviceIntervalKm: ${_this.serviceIntervalKm}, serviceIntervalMonths: ${_this.serviceIntervalMonths}, remindKmBefore: ${_this.remindKmBefore}, remindDaysBefore: ${_this.remindDaysBefore}, remindersEnabled: ${_this.remindersEnabled}, inspectionDue: ${_this.inspectionDue}, trafficInsuranceDue: ${_this.trafficInsuranceDue}, cascoDue: ${_this.cascoDue}, fuelLevelPct: ${_this.fuelLevelPct}, fuelLevelAt: ${_this.fuelLevelAt}, engineStatus: ${_this.engineStatus}, engineStatusAt: ${_this.engineStatusAt}, engineStatusNote: ${_this.engineStatusNote}, photoPath: ${_this.photoPath}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $VehicleCopyWith<$Res>  {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) _then) = _$VehicleCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String brand, String model, int year, String plate, String engine, String color, List<String> fuelTypes, int serviceIntervalKm, int serviceIntervalMonths, int remindKmBefore, int remindDaysBefore, bool remindersEnabled, DateTime? inspectionDue, DateTime? trafficInsuranceDue, DateTime? cascoDue, int? fuelLevelPct, DateTime? fuelLevelAt, String engineStatus, DateTime? engineStatusAt, String engineStatusNote, String? photoPath, int version
});




}
/// @nodoc
class _$VehicleCopyWithImpl<$Res>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._self, this._then);

  final Vehicle _self;
  final $Res Function(Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? brand = null,Object? model = null,Object? year = null,Object? plate = null,Object? engine = null,Object? color = null,Object? fuelTypes = null,Object? serviceIntervalKm = null,Object? serviceIntervalMonths = null,Object? remindKmBefore = null,Object? remindDaysBefore = null,Object? remindersEnabled = null,Object? inspectionDue = freezed,Object? trafficInsuranceDue = freezed,Object? cascoDue = freezed,Object? fuelLevelPct = freezed,Object? fuelLevelAt = freezed,Object? engineStatus = null,Object? engineStatusAt = freezed,Object? engineStatusNote = null,Object? photoPath = freezed,Object? version = null,}) {
  return _then(Vehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,engine: null == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,fuelTypes: null == fuelTypes ? _self.fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<String>,serviceIntervalKm: null == serviceIntervalKm ? _self.serviceIntervalKm : serviceIntervalKm // ignore: cast_nullable_to_non_nullable
as int,serviceIntervalMonths: null == serviceIntervalMonths ? _self.serviceIntervalMonths : serviceIntervalMonths // ignore: cast_nullable_to_non_nullable
as int,remindKmBefore: null == remindKmBefore ? _self.remindKmBefore : remindKmBefore // ignore: cast_nullable_to_non_nullable
as int,remindDaysBefore: null == remindDaysBefore ? _self.remindDaysBefore : remindDaysBefore // ignore: cast_nullable_to_non_nullable
as int,remindersEnabled: null == remindersEnabled ? _self.remindersEnabled : remindersEnabled // ignore: cast_nullable_to_non_nullable
as bool,inspectionDue: freezed == inspectionDue ? _self.inspectionDue : inspectionDue // ignore: cast_nullable_to_non_nullable
as DateTime?,trafficInsuranceDue: freezed == trafficInsuranceDue ? _self.trafficInsuranceDue : trafficInsuranceDue // ignore: cast_nullable_to_non_nullable
as DateTime?,cascoDue: freezed == cascoDue ? _self.cascoDue : cascoDue // ignore: cast_nullable_to_non_nullable
as DateTime?,fuelLevelPct: freezed == fuelLevelPct ? _self.fuelLevelPct : fuelLevelPct // ignore: cast_nullable_to_non_nullable
as int?,fuelLevelAt: freezed == fuelLevelAt ? _self.fuelLevelAt : fuelLevelAt // ignore: cast_nullable_to_non_nullable
as DateTime?,engineStatus: null == engineStatus ? _self.engineStatus : engineStatus // ignore: cast_nullable_to_non_nullable
as String,engineStatusAt: freezed == engineStatusAt ? _self.engineStatusAt : engineStatusAt // ignore: cast_nullable_to_non_nullable
as DateTime?,engineStatusNote: null == engineStatusNote ? _self.engineStatusNote : engineStatusNote // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Vehicle].
extension VehiclePatterns on Vehicle {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vehicle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vehicle value)  $default,){
final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vehicle value)?  $default,){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String brand,  String model,  int year,  String plate,  String engine,  String color,  List<String> fuelTypes,  int serviceIntervalKm,  int serviceIntervalMonths,  int remindKmBefore,  int remindDaysBefore,  bool remindersEnabled,  DateTime? inspectionDue,  DateTime? trafficInsuranceDue,  DateTime? cascoDue,  int? fuelLevelPct,  DateTime? fuelLevelAt,  String engineStatus,  DateTime? engineStatusAt,  String engineStatusNote,  String? photoPath,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.userId,_that.brand,_that.model,_that.year,_that.plate,_that.engine,_that.color,_that.fuelTypes,_that.serviceIntervalKm,_that.serviceIntervalMonths,_that.remindKmBefore,_that.remindDaysBefore,_that.remindersEnabled,_that.inspectionDue,_that.trafficInsuranceDue,_that.cascoDue,_that.fuelLevelPct,_that.fuelLevelAt,_that.engineStatus,_that.engineStatusAt,_that.engineStatusNote,_that.photoPath,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String brand,  String model,  int year,  String plate,  String engine,  String color,  List<String> fuelTypes,  int serviceIntervalKm,  int serviceIntervalMonths,  int remindKmBefore,  int remindDaysBefore,  bool remindersEnabled,  DateTime? inspectionDue,  DateTime? trafficInsuranceDue,  DateTime? cascoDue,  int? fuelLevelPct,  DateTime? fuelLevelAt,  String engineStatus,  DateTime? engineStatusAt,  String engineStatusNote,  String? photoPath,  int version)  $default,) {final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that.id,_that.userId,_that.brand,_that.model,_that.year,_that.plate,_that.engine,_that.color,_that.fuelTypes,_that.serviceIntervalKm,_that.serviceIntervalMonths,_that.remindKmBefore,_that.remindDaysBefore,_that.remindersEnabled,_that.inspectionDue,_that.trafficInsuranceDue,_that.cascoDue,_that.fuelLevelPct,_that.fuelLevelAt,_that.engineStatus,_that.engineStatusAt,_that.engineStatusNote,_that.photoPath,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String brand,  String model,  int year,  String plate,  String engine,  String color,  List<String> fuelTypes,  int serviceIntervalKm,  int serviceIntervalMonths,  int remindKmBefore,  int remindDaysBefore,  bool remindersEnabled,  DateTime? inspectionDue,  DateTime? trafficInsuranceDue,  DateTime? cascoDue,  int? fuelLevelPct,  DateTime? fuelLevelAt,  String engineStatus,  DateTime? engineStatusAt,  String engineStatusNote,  String? photoPath,  int version)?  $default,) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.userId,_that.brand,_that.model,_that.year,_that.plate,_that.engine,_that.color,_that.fuelTypes,_that.serviceIntervalKm,_that.serviceIntervalMonths,_that.remindKmBefore,_that.remindDaysBefore,_that.remindersEnabled,_that.inspectionDue,_that.trafficInsuranceDue,_that.cascoDue,_that.fuelLevelPct,_that.fuelLevelAt,_that.engineStatus,_that.engineStatusAt,_that.engineStatusNote,_that.photoPath,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vehicle implements Vehicle {
  const _Vehicle({required this.id, required this.userId, required this.brand, required this.model, required this.year, required this.plate, this.engine = '', this.color = '',  List<String> fuelTypes = const <String>['benzin'], this.serviceIntervalKm = 15000, this.serviceIntervalMonths = 12, this.remindKmBefore = 1000, this.remindDaysBefore = 14, this.remindersEnabled = false, this.inspectionDue, this.trafficInsuranceDue, this.cascoDue, this.fuelLevelPct, this.fuelLevelAt, this.engineStatus = 'unknown', this.engineStatusAt, this.engineStatusNote = '', this.photoPath, this.version = 1}): _fuelTypes = fuelTypes;
  factory _Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String brand;
@override final  String model;
@override final  int year;
@override final  String plate;
@override@JsonKey() final  String engine;
@override@JsonKey() final  String color;
 final  List<String> _fuelTypes;
@override@JsonKey() List<String> get fuelTypes {
  if (_fuelTypes is EqualUnmodifiableListView) return _fuelTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fuelTypes);
}

@override@JsonKey() final  int serviceIntervalKm;
@override@JsonKey() final  int serviceIntervalMonths;
@override@JsonKey() final  int remindKmBefore;
@override@JsonKey() final  int remindDaysBefore;
@override@JsonKey() final  bool remindersEnabled;
@override final  DateTime? inspectionDue;
@override final  DateTime? trafficInsuranceDue;
@override final  DateTime? cascoDue;
@override final  int? fuelLevelPct;
@override final  DateTime? fuelLevelAt;
@override@JsonKey() final  String engineStatus;
@override final  DateTime? engineStatusAt;
@override@JsonKey() final  String engineStatusNote;
@override final  String? photoPath;
@override@JsonKey() final  int version;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCopyWith<_Vehicle> get copyWith => __$VehicleCopyWithImpl<_Vehicle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.fuelTypes, _fuelTypes)&&(identical(other.serviceIntervalKm, serviceIntervalKm) || other.serviceIntervalKm == serviceIntervalKm)&&(identical(other.serviceIntervalMonths, serviceIntervalMonths) || other.serviceIntervalMonths == serviceIntervalMonths)&&(identical(other.remindKmBefore, remindKmBefore) || other.remindKmBefore == remindKmBefore)&&(identical(other.remindDaysBefore, remindDaysBefore) || other.remindDaysBefore == remindDaysBefore)&&(identical(other.remindersEnabled, remindersEnabled) || other.remindersEnabled == remindersEnabled)&&(identical(other.inspectionDue, inspectionDue) || other.inspectionDue == inspectionDue)&&(identical(other.trafficInsuranceDue, trafficInsuranceDue) || other.trafficInsuranceDue == trafficInsuranceDue)&&(identical(other.cascoDue, cascoDue) || other.cascoDue == cascoDue)&&(identical(other.fuelLevelPct, fuelLevelPct) || other.fuelLevelPct == fuelLevelPct)&&(identical(other.fuelLevelAt, fuelLevelAt) || other.fuelLevelAt == fuelLevelAt)&&(identical(other.engineStatus, engineStatus) || other.engineStatus == engineStatus)&&(identical(other.engineStatusAt, engineStatusAt) || other.engineStatusAt == engineStatusAt)&&(identical(other.engineStatusNote, engineStatusNote) || other.engineStatusNote == engineStatusNote)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,userId,brand,model,year,plate,engine,color,const DeepCollectionEquality().hash(_fuelTypes),serviceIntervalKm,serviceIntervalMonths,remindKmBefore,remindDaysBefore,remindersEnabled,inspectionDue,trafficInsuranceDue,cascoDue,fuelLevelPct,fuelLevelAt,engineStatus,engineStatusAt,engineStatusNote,photoPath,version]);
}

@override
String toString() {
    return 'Vehicle(id: $id, userId: $userId, brand: $brand, model: $model, year: $year, plate: $plate, engine: $engine, color: $color, fuelTypes: $fuelTypes, serviceIntervalKm: $serviceIntervalKm, serviceIntervalMonths: $serviceIntervalMonths, remindKmBefore: $remindKmBefore, remindDaysBefore: $remindDaysBefore, remindersEnabled: $remindersEnabled, inspectionDue: $inspectionDue, trafficInsuranceDue: $trafficInsuranceDue, cascoDue: $cascoDue, fuelLevelPct: $fuelLevelPct, fuelLevelAt: $fuelLevelAt, engineStatus: $engineStatus, engineStatusAt: $engineStatusAt, engineStatusNote: $engineStatusNote, photoPath: $photoPath, version: $version)';
}


}

/// @nodoc
abstract mixin class _$VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$VehicleCopyWith(_Vehicle value, $Res Function(_Vehicle) _then) = __$VehicleCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String brand, String model, int year, String plate, String engine, String color, List<String> fuelTypes, int serviceIntervalKm, int serviceIntervalMonths, int remindKmBefore, int remindDaysBefore, bool remindersEnabled, DateTime? inspectionDue, DateTime? trafficInsuranceDue, DateTime? cascoDue, int? fuelLevelPct, DateTime? fuelLevelAt, String engineStatus, DateTime? engineStatusAt, String engineStatusNote, String? photoPath, int version
});




}
/// @nodoc
class __$VehicleCopyWithImpl<$Res>
    implements _$VehicleCopyWith<$Res> {
  __$VehicleCopyWithImpl(this._self, this._then);

  final _Vehicle _self;
  final $Res Function(_Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? brand = null,Object? model = null,Object? year = null,Object? plate = null,Object? engine = null,Object? color = null,Object? fuelTypes = null,Object? serviceIntervalKm = null,Object? serviceIntervalMonths = null,Object? remindKmBefore = null,Object? remindDaysBefore = null,Object? remindersEnabled = null,Object? inspectionDue = freezed,Object? trafficInsuranceDue = freezed,Object? cascoDue = freezed,Object? fuelLevelPct = freezed,Object? fuelLevelAt = freezed,Object? engineStatus = null,Object? engineStatusAt = freezed,Object? engineStatusNote = null,Object? photoPath = freezed,Object? version = null,}) {
  return _then(_Vehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,engine: null == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,fuelTypes: null == fuelTypes ? _self._fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<String>,serviceIntervalKm: null == serviceIntervalKm ? _self.serviceIntervalKm : serviceIntervalKm // ignore: cast_nullable_to_non_nullable
as int,serviceIntervalMonths: null == serviceIntervalMonths ? _self.serviceIntervalMonths : serviceIntervalMonths // ignore: cast_nullable_to_non_nullable
as int,remindKmBefore: null == remindKmBefore ? _self.remindKmBefore : remindKmBefore // ignore: cast_nullable_to_non_nullable
as int,remindDaysBefore: null == remindDaysBefore ? _self.remindDaysBefore : remindDaysBefore // ignore: cast_nullable_to_non_nullable
as int,remindersEnabled: null == remindersEnabled ? _self.remindersEnabled : remindersEnabled // ignore: cast_nullable_to_non_nullable
as bool,inspectionDue: freezed == inspectionDue ? _self.inspectionDue : inspectionDue // ignore: cast_nullable_to_non_nullable
as DateTime?,trafficInsuranceDue: freezed == trafficInsuranceDue ? _self.trafficInsuranceDue : trafficInsuranceDue // ignore: cast_nullable_to_non_nullable
as DateTime?,cascoDue: freezed == cascoDue ? _self.cascoDue : cascoDue // ignore: cast_nullable_to_non_nullable
as DateTime?,fuelLevelPct: freezed == fuelLevelPct ? _self.fuelLevelPct : fuelLevelPct // ignore: cast_nullable_to_non_nullable
as int?,fuelLevelAt: freezed == fuelLevelAt ? _self.fuelLevelAt : fuelLevelAt // ignore: cast_nullable_to_non_nullable
as DateTime?,engineStatus: null == engineStatus ? _self.engineStatus : engineStatus // ignore: cast_nullable_to_non_nullable
as String,engineStatusAt: freezed == engineStatusAt ? _self.engineStatusAt : engineStatusAt // ignore: cast_nullable_to_non_nullable
as DateTime?,engineStatusNote: null == engineStatusNote ? _self.engineStatusNote : engineStatusNote // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OdometerReading {

 String get id; String get vehicleId; int get km; DateTime get readOn; String get sourceType; String get sourceId; int get version;
/// Create a copy of OdometerReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OdometerReadingCopyWith<OdometerReading> get copyWith => _$OdometerReadingCopyWithImpl<OdometerReading>(this as OdometerReading, _$identity);

  /// Serializes this OdometerReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OdometerReading;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OdometerReading&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.km, _this.km) || other.km == _this.km)&&(identical(other.readOn, _this.readOn) || other.readOn == _this.readOn)&&(identical(other.sourceType, _this.sourceType) || other.sourceType == _this.sourceType)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OdometerReading;
  return Object.hash(runtimeType,_this.id,_this.vehicleId,_this.km,_this.readOn,_this.sourceType,_this.sourceId,_this.version);
}

@override
String toString() {
  final _this = this as OdometerReading;
  return 'OdometerReading(id: ${_this.id}, vehicleId: ${_this.vehicleId}, km: ${_this.km}, readOn: ${_this.readOn}, sourceType: ${_this.sourceType}, sourceId: ${_this.sourceId}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $OdometerReadingCopyWith<$Res>  {
  factory $OdometerReadingCopyWith(OdometerReading value, $Res Function(OdometerReading) _then) = _$OdometerReadingCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, int km, DateTime readOn, String sourceType, String sourceId, int version
});




}
/// @nodoc
class _$OdometerReadingCopyWithImpl<$Res>
    implements $OdometerReadingCopyWith<$Res> {
  _$OdometerReadingCopyWithImpl(this._self, this._then);

  final OdometerReading _self;
  final $Res Function(OdometerReading) _then;

/// Create a copy of OdometerReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? km = null,Object? readOn = null,Object? sourceType = null,Object? sourceId = null,Object? version = null,}) {
  return _then(OdometerReading(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,km: null == km ? _self.km : km // ignore: cast_nullable_to_non_nullable
as int,readOn: null == readOn ? _self.readOn : readOn // ignore: cast_nullable_to_non_nullable
as DateTime,sourceType: null == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OdometerReading].
extension OdometerReadingPatterns on OdometerReading {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OdometerReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OdometerReading() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OdometerReading value)  $default,){
final _that = this;
switch (_that) {
case _OdometerReading():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OdometerReading value)?  $default,){
final _that = this;
switch (_that) {
case _OdometerReading() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  int km,  DateTime readOn,  String sourceType,  String sourceId,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OdometerReading() when $default != null:
return $default(_that.id,_that.vehicleId,_that.km,_that.readOn,_that.sourceType,_that.sourceId,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  int km,  DateTime readOn,  String sourceType,  String sourceId,  int version)  $default,) {final _that = this;
switch (_that) {
case _OdometerReading():
return $default(_that.id,_that.vehicleId,_that.km,_that.readOn,_that.sourceType,_that.sourceId,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  int km,  DateTime readOn,  String sourceType,  String sourceId,  int version)?  $default,) {final _that = this;
switch (_that) {
case _OdometerReading() when $default != null:
return $default(_that.id,_that.vehicleId,_that.km,_that.readOn,_that.sourceType,_that.sourceId,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OdometerReading implements OdometerReading {
  const _OdometerReading({required this.id, required this.vehicleId, required this.km, required this.readOn, this.sourceType = 'manual', this.sourceId = '', this.version = 1});
  factory _OdometerReading.fromJson(Map<String, dynamic> json) => _$OdometerReadingFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  int km;
@override final  DateTime readOn;
@override@JsonKey() final  String sourceType;
@override@JsonKey() final  String sourceId;
@override@JsonKey() final  int version;

/// Create a copy of OdometerReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OdometerReadingCopyWith<_OdometerReading> get copyWith => __$OdometerReadingCopyWithImpl<_OdometerReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OdometerReadingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OdometerReading&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.km, km) || other.km == km)&&(identical(other.readOn, readOn) || other.readOn == readOn)&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,vehicleId,km,readOn,sourceType,sourceId,version);
}

@override
String toString() {
    return 'OdometerReading(id: $id, vehicleId: $vehicleId, km: $km, readOn: $readOn, sourceType: $sourceType, sourceId: $sourceId, version: $version)';
}


}

/// @nodoc
abstract mixin class _$OdometerReadingCopyWith<$Res> implements $OdometerReadingCopyWith<$Res> {
  factory _$OdometerReadingCopyWith(_OdometerReading value, $Res Function(_OdometerReading) _then) = __$OdometerReadingCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, int km, DateTime readOn, String sourceType, String sourceId, int version
});




}
/// @nodoc
class __$OdometerReadingCopyWithImpl<$Res>
    implements _$OdometerReadingCopyWith<$Res> {
  __$OdometerReadingCopyWithImpl(this._self, this._then);

  final _OdometerReading _self;
  final $Res Function(_OdometerReading) _then;

/// Create a copy of OdometerReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? km = null,Object? readOn = null,Object? sourceType = null,Object? sourceId = null,Object? version = null,}) {
  return _then(_OdometerReading(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,km: null == km ? _self.km : km // ignore: cast_nullable_to_non_nullable
as int,readOn: null == readOn ? _self.readOn : readOn // ignore: cast_nullable_to_non_nullable
as DateTime,sourceType: null == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FuelEntry {

 String get id; String get vehicleId; DateTime get filledAt; String get fuelType; int get litersMilli; int get unitPriceKurus; int get amountKurus; String? get stationId; String get stationName; int? get odometerKm; bool get isFullTank; String get notes; int get version;
/// Create a copy of FuelEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FuelEntryCopyWith<FuelEntry> get copyWith => _$FuelEntryCopyWithImpl<FuelEntry>(this as FuelEntry, _$identity);

  /// Serializes this FuelEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FuelEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FuelEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.filledAt, _this.filledAt) || other.filledAt == _this.filledAt)&&(identical(other.fuelType, _this.fuelType) || other.fuelType == _this.fuelType)&&(identical(other.litersMilli, _this.litersMilli) || other.litersMilli == _this.litersMilli)&&(identical(other.unitPriceKurus, _this.unitPriceKurus) || other.unitPriceKurus == _this.unitPriceKurus)&&(identical(other.amountKurus, _this.amountKurus) || other.amountKurus == _this.amountKurus)&&(identical(other.stationId, _this.stationId) || other.stationId == _this.stationId)&&(identical(other.stationName, _this.stationName) || other.stationName == _this.stationName)&&(identical(other.odometerKm, _this.odometerKm) || other.odometerKm == _this.odometerKm)&&(identical(other.isFullTank, _this.isFullTank) || other.isFullTank == _this.isFullTank)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FuelEntry;
  return Object.hash(runtimeType,_this.id,_this.vehicleId,_this.filledAt,_this.fuelType,_this.litersMilli,_this.unitPriceKurus,_this.amountKurus,_this.stationId,_this.stationName,_this.odometerKm,_this.isFullTank,_this.notes,_this.version);
}

@override
String toString() {
  final _this = this as FuelEntry;
  return 'FuelEntry(id: ${_this.id}, vehicleId: ${_this.vehicleId}, filledAt: ${_this.filledAt}, fuelType: ${_this.fuelType}, litersMilli: ${_this.litersMilli}, unitPriceKurus: ${_this.unitPriceKurus}, amountKurus: ${_this.amountKurus}, stationId: ${_this.stationId}, stationName: ${_this.stationName}, odometerKm: ${_this.odometerKm}, isFullTank: ${_this.isFullTank}, notes: ${_this.notes}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $FuelEntryCopyWith<$Res>  {
  factory $FuelEntryCopyWith(FuelEntry value, $Res Function(FuelEntry) _then) = _$FuelEntryCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, DateTime filledAt, String fuelType, int litersMilli, int unitPriceKurus, int amountKurus, String? stationId, String stationName, int? odometerKm, bool isFullTank, String notes, int version
});




}
/// @nodoc
class _$FuelEntryCopyWithImpl<$Res>
    implements $FuelEntryCopyWith<$Res> {
  _$FuelEntryCopyWithImpl(this._self, this._then);

  final FuelEntry _self;
  final $Res Function(FuelEntry) _then;

/// Create a copy of FuelEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? filledAt = null,Object? fuelType = null,Object? litersMilli = null,Object? unitPriceKurus = null,Object? amountKurus = null,Object? stationId = freezed,Object? stationName = null,Object? odometerKm = freezed,Object? isFullTank = null,Object? notes = null,Object? version = null,}) {
  return _then(FuelEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,filledAt: null == filledAt ? _self.filledAt : filledAt // ignore: cast_nullable_to_non_nullable
as DateTime,fuelType: null == fuelType ? _self.fuelType : fuelType // ignore: cast_nullable_to_non_nullable
as String,litersMilli: null == litersMilli ? _self.litersMilli : litersMilli // ignore: cast_nullable_to_non_nullable
as int,unitPriceKurus: null == unitPriceKurus ? _self.unitPriceKurus : unitPriceKurus // ignore: cast_nullable_to_non_nullable
as int,amountKurus: null == amountKurus ? _self.amountKurus : amountKurus // ignore: cast_nullable_to_non_nullable
as int,stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as String?,stationName: null == stationName ? _self.stationName : stationName // ignore: cast_nullable_to_non_nullable
as String,odometerKm: freezed == odometerKm ? _self.odometerKm : odometerKm // ignore: cast_nullable_to_non_nullable
as int?,isFullTank: null == isFullTank ? _self.isFullTank : isFullTank // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FuelEntry].
extension FuelEntryPatterns on FuelEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FuelEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FuelEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FuelEntry value)  $default,){
final _that = this;
switch (_that) {
case _FuelEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FuelEntry value)?  $default,){
final _that = this;
switch (_that) {
case _FuelEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime filledAt,  String fuelType,  int litersMilli,  int unitPriceKurus,  int amountKurus,  String? stationId,  String stationName,  int? odometerKm,  bool isFullTank,  String notes,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FuelEntry() when $default != null:
return $default(_that.id,_that.vehicleId,_that.filledAt,_that.fuelType,_that.litersMilli,_that.unitPriceKurus,_that.amountKurus,_that.stationId,_that.stationName,_that.odometerKm,_that.isFullTank,_that.notes,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime filledAt,  String fuelType,  int litersMilli,  int unitPriceKurus,  int amountKurus,  String? stationId,  String stationName,  int? odometerKm,  bool isFullTank,  String notes,  int version)  $default,) {final _that = this;
switch (_that) {
case _FuelEntry():
return $default(_that.id,_that.vehicleId,_that.filledAt,_that.fuelType,_that.litersMilli,_that.unitPriceKurus,_that.amountKurus,_that.stationId,_that.stationName,_that.odometerKm,_that.isFullTank,_that.notes,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  DateTime filledAt,  String fuelType,  int litersMilli,  int unitPriceKurus,  int amountKurus,  String? stationId,  String stationName,  int? odometerKm,  bool isFullTank,  String notes,  int version)?  $default,) {final _that = this;
switch (_that) {
case _FuelEntry() when $default != null:
return $default(_that.id,_that.vehicleId,_that.filledAt,_that.fuelType,_that.litersMilli,_that.unitPriceKurus,_that.amountKurus,_that.stationId,_that.stationName,_that.odometerKm,_that.isFullTank,_that.notes,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FuelEntry implements FuelEntry {
  const _FuelEntry({required this.id, required this.vehicleId, required this.filledAt, required this.fuelType, required this.litersMilli, required this.unitPriceKurus, required this.amountKurus, this.stationId, this.stationName = '', this.odometerKm, this.isFullTank = false, this.notes = '', this.version = 1});
  factory _FuelEntry.fromJson(Map<String, dynamic> json) => _$FuelEntryFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  DateTime filledAt;
@override final  String fuelType;
@override final  int litersMilli;
@override final  int unitPriceKurus;
@override final  int amountKurus;
@override final  String? stationId;
@override@JsonKey() final  String stationName;
@override final  int? odometerKm;
@override@JsonKey() final  bool isFullTank;
@override@JsonKey() final  String notes;
@override@JsonKey() final  int version;

/// Create a copy of FuelEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FuelEntryCopyWith<_FuelEntry> get copyWith => __$FuelEntryCopyWithImpl<_FuelEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FuelEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FuelEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.filledAt, filledAt) || other.filledAt == filledAt)&&(identical(other.fuelType, fuelType) || other.fuelType == fuelType)&&(identical(other.litersMilli, litersMilli) || other.litersMilli == litersMilli)&&(identical(other.unitPriceKurus, unitPriceKurus) || other.unitPriceKurus == unitPriceKurus)&&(identical(other.amountKurus, amountKurus) || other.amountKurus == amountKurus)&&(identical(other.stationId, stationId) || other.stationId == stationId)&&(identical(other.stationName, stationName) || other.stationName == stationName)&&(identical(other.odometerKm, odometerKm) || other.odometerKm == odometerKm)&&(identical(other.isFullTank, isFullTank) || other.isFullTank == isFullTank)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,vehicleId,filledAt,fuelType,litersMilli,unitPriceKurus,amountKurus,stationId,stationName,odometerKm,isFullTank,notes,version);
}

@override
String toString() {
    return 'FuelEntry(id: $id, vehicleId: $vehicleId, filledAt: $filledAt, fuelType: $fuelType, litersMilli: $litersMilli, unitPriceKurus: $unitPriceKurus, amountKurus: $amountKurus, stationId: $stationId, stationName: $stationName, odometerKm: $odometerKm, isFullTank: $isFullTank, notes: $notes, version: $version)';
}


}

/// @nodoc
abstract mixin class _$FuelEntryCopyWith<$Res> implements $FuelEntryCopyWith<$Res> {
  factory _$FuelEntryCopyWith(_FuelEntry value, $Res Function(_FuelEntry) _then) = __$FuelEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, DateTime filledAt, String fuelType, int litersMilli, int unitPriceKurus, int amountKurus, String? stationId, String stationName, int? odometerKm, bool isFullTank, String notes, int version
});




}
/// @nodoc
class __$FuelEntryCopyWithImpl<$Res>
    implements _$FuelEntryCopyWith<$Res> {
  __$FuelEntryCopyWithImpl(this._self, this._then);

  final _FuelEntry _self;
  final $Res Function(_FuelEntry) _then;

/// Create a copy of FuelEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? filledAt = null,Object? fuelType = null,Object? litersMilli = null,Object? unitPriceKurus = null,Object? amountKurus = null,Object? stationId = freezed,Object? stationName = null,Object? odometerKm = freezed,Object? isFullTank = null,Object? notes = null,Object? version = null,}) {
  return _then(_FuelEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,filledAt: null == filledAt ? _self.filledAt : filledAt // ignore: cast_nullable_to_non_nullable
as DateTime,fuelType: null == fuelType ? _self.fuelType : fuelType // ignore: cast_nullable_to_non_nullable
as String,litersMilli: null == litersMilli ? _self.litersMilli : litersMilli // ignore: cast_nullable_to_non_nullable
as int,unitPriceKurus: null == unitPriceKurus ? _self.unitPriceKurus : unitPriceKurus // ignore: cast_nullable_to_non_nullable
as int,amountKurus: null == amountKurus ? _self.amountKurus : amountKurus // ignore: cast_nullable_to_non_nullable
as int,stationId: freezed == stationId ? _self.stationId : stationId // ignore: cast_nullable_to_non_nullable
as String?,stationName: null == stationName ? _self.stationName : stationName // ignore: cast_nullable_to_non_nullable
as String,odometerKm: freezed == odometerKm ? _self.odometerKm : odometerKm // ignore: cast_nullable_to_non_nullable
as int?,isFullTank: null == isFullTank ? _self.isFullTank : isFullTank // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ServiceRecord {

 String get id; String get vehicleId; DateTime get performedOn; String get title; int? get km; String get type; String get workshop; int get totalCostKurus; String get notes; bool get resetsInterval; List<ServicePart> get parts; int get version;
/// Create a copy of ServiceRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRecordCopyWith<ServiceRecord> get copyWith => _$ServiceRecordCopyWithImpl<ServiceRecord>(this as ServiceRecord, _$identity);

  /// Serializes this ServiceRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ServiceRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.performedOn, _this.performedOn) || other.performedOn == _this.performedOn)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.km, _this.km) || other.km == _this.km)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.workshop, _this.workshop) || other.workshop == _this.workshop)&&(identical(other.totalCostKurus, _this.totalCostKurus) || other.totalCostKurus == _this.totalCostKurus)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.resetsInterval, _this.resetsInterval) || other.resetsInterval == _this.resetsInterval)&&const DeepCollectionEquality().equals(other.parts, _this.parts)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ServiceRecord;
  return Object.hash(runtimeType,_this.id,_this.vehicleId,_this.performedOn,_this.title,_this.km,_this.type,_this.workshop,_this.totalCostKurus,_this.notes,_this.resetsInterval,const DeepCollectionEquality().hash(_this.parts),_this.version);
}

@override
String toString() {
  final _this = this as ServiceRecord;
  return 'ServiceRecord(id: ${_this.id}, vehicleId: ${_this.vehicleId}, performedOn: ${_this.performedOn}, title: ${_this.title}, km: ${_this.km}, type: ${_this.type}, workshop: ${_this.workshop}, totalCostKurus: ${_this.totalCostKurus}, notes: ${_this.notes}, resetsInterval: ${_this.resetsInterval}, parts: ${_this.parts}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $ServiceRecordCopyWith<$Res>  {
  factory $ServiceRecordCopyWith(ServiceRecord value, $Res Function(ServiceRecord) _then) = _$ServiceRecordCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, DateTime performedOn, String title, int? km, String type, String workshop, int totalCostKurus, String notes, bool resetsInterval, List<ServicePart> parts, int version
});




}
/// @nodoc
class _$ServiceRecordCopyWithImpl<$Res>
    implements $ServiceRecordCopyWith<$Res> {
  _$ServiceRecordCopyWithImpl(this._self, this._then);

  final ServiceRecord _self;
  final $Res Function(ServiceRecord) _then;

/// Create a copy of ServiceRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? performedOn = null,Object? title = null,Object? km = freezed,Object? type = null,Object? workshop = null,Object? totalCostKurus = null,Object? notes = null,Object? resetsInterval = null,Object? parts = null,Object? version = null,}) {
  return _then(ServiceRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,performedOn: null == performedOn ? _self.performedOn : performedOn // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,km: freezed == km ? _self.km : km // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,workshop: null == workshop ? _self.workshop : workshop // ignore: cast_nullable_to_non_nullable
as String,totalCostKurus: null == totalCostKurus ? _self.totalCostKurus : totalCostKurus // ignore: cast_nullable_to_non_nullable
as int,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,resetsInterval: null == resetsInterval ? _self.resetsInterval : resetsInterval // ignore: cast_nullable_to_non_nullable
as bool,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<ServicePart>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRecord].
extension ServiceRecordPatterns on ServiceRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRecord value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime performedOn,  String title,  int? km,  String type,  String workshop,  int totalCostKurus,  String notes,  bool resetsInterval,  List<ServicePart> parts,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRecord() when $default != null:
return $default(_that.id,_that.vehicleId,_that.performedOn,_that.title,_that.km,_that.type,_that.workshop,_that.totalCostKurus,_that.notes,_that.resetsInterval,_that.parts,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime performedOn,  String title,  int? km,  String type,  String workshop,  int totalCostKurus,  String notes,  bool resetsInterval,  List<ServicePart> parts,  int version)  $default,) {final _that = this;
switch (_that) {
case _ServiceRecord():
return $default(_that.id,_that.vehicleId,_that.performedOn,_that.title,_that.km,_that.type,_that.workshop,_that.totalCostKurus,_that.notes,_that.resetsInterval,_that.parts,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  DateTime performedOn,  String title,  int? km,  String type,  String workshop,  int totalCostKurus,  String notes,  bool resetsInterval,  List<ServicePart> parts,  int version)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRecord() when $default != null:
return $default(_that.id,_that.vehicleId,_that.performedOn,_that.title,_that.km,_that.type,_that.workshop,_that.totalCostKurus,_that.notes,_that.resetsInterval,_that.parts,_that.version);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ServiceRecord implements ServiceRecord {
  const _ServiceRecord({required this.id, required this.vehicleId, required this.performedOn, required this.title, this.km, this.type = 'periodic', this.workshop = '', this.totalCostKurus = 0, this.notes = '', this.resetsInterval = false,  List<ServicePart> parts = const <ServicePart>[], this.version = 1}): _parts = parts;
  factory _ServiceRecord.fromJson(Map<String, dynamic> json) => _$ServiceRecordFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  DateTime performedOn;
@override final  String title;
@override final  int? km;
@override@JsonKey() final  String type;
@override@JsonKey() final  String workshop;
@override@JsonKey() final  int totalCostKurus;
@override@JsonKey() final  String notes;
@override@JsonKey() final  bool resetsInterval;
 final  List<ServicePart> _parts;
@override@JsonKey() List<ServicePart> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}

@override@JsonKey() final  int version;

/// Create a copy of ServiceRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRecordCopyWith<_ServiceRecord> get copyWith => __$ServiceRecordCopyWithImpl<_ServiceRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.performedOn, performedOn) || other.performedOn == performedOn)&&(identical(other.title, title) || other.title == title)&&(identical(other.km, km) || other.km == km)&&(identical(other.type, type) || other.type == type)&&(identical(other.workshop, workshop) || other.workshop == workshop)&&(identical(other.totalCostKurus, totalCostKurus) || other.totalCostKurus == totalCostKurus)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.resetsInterval, resetsInterval) || other.resetsInterval == resetsInterval)&&const DeepCollectionEquality().equals(other.parts, _parts)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,vehicleId,performedOn,title,km,type,workshop,totalCostKurus,notes,resetsInterval,const DeepCollectionEquality().hash(_parts),version);
}

@override
String toString() {
    return 'ServiceRecord(id: $id, vehicleId: $vehicleId, performedOn: $performedOn, title: $title, km: $km, type: $type, workshop: $workshop, totalCostKurus: $totalCostKurus, notes: $notes, resetsInterval: $resetsInterval, parts: $parts, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ServiceRecordCopyWith<$Res> implements $ServiceRecordCopyWith<$Res> {
  factory _$ServiceRecordCopyWith(_ServiceRecord value, $Res Function(_ServiceRecord) _then) = __$ServiceRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, DateTime performedOn, String title, int? km, String type, String workshop, int totalCostKurus, String notes, bool resetsInterval, List<ServicePart> parts, int version
});




}
/// @nodoc
class __$ServiceRecordCopyWithImpl<$Res>
    implements _$ServiceRecordCopyWith<$Res> {
  __$ServiceRecordCopyWithImpl(this._self, this._then);

  final _ServiceRecord _self;
  final $Res Function(_ServiceRecord) _then;

/// Create a copy of ServiceRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? performedOn = null,Object? title = null,Object? km = freezed,Object? type = null,Object? workshop = null,Object? totalCostKurus = null,Object? notes = null,Object? resetsInterval = null,Object? parts = null,Object? version = null,}) {
  return _then(_ServiceRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,performedOn: null == performedOn ? _self.performedOn : performedOn // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,km: freezed == km ? _self.km : km // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,workshop: null == workshop ? _self.workshop : workshop // ignore: cast_nullable_to_non_nullable
as String,totalCostKurus: null == totalCostKurus ? _self.totalCostKurus : totalCostKurus // ignore: cast_nullable_to_non_nullable
as int,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,resetsInterval: null == resetsInterval ? _self.resetsInterval : resetsInterval // ignore: cast_nullable_to_non_nullable
as bool,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<ServicePart>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ServicePart {

 String get id; String get label; int get costKurus;
/// Create a copy of ServicePart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServicePartCopyWith<ServicePart> get copyWith => _$ServicePartCopyWithImpl<ServicePart>(this as ServicePart, _$identity);

  /// Serializes this ServicePart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ServicePart;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServicePart&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.costKurus, _this.costKurus) || other.costKurus == _this.costKurus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ServicePart;
  return Object.hash(runtimeType,_this.id,_this.label,_this.costKurus);
}

@override
String toString() {
  final _this = this as ServicePart;
  return 'ServicePart(id: ${_this.id}, label: ${_this.label}, costKurus: ${_this.costKurus})';
}


}

/// @nodoc
abstract mixin class $ServicePartCopyWith<$Res>  {
  factory $ServicePartCopyWith(ServicePart value, $Res Function(ServicePart) _then) = _$ServicePartCopyWithImpl;
@useResult
$Res call({
 String id, String label, int costKurus
});




}
/// @nodoc
class _$ServicePartCopyWithImpl<$Res>
    implements $ServicePartCopyWith<$Res> {
  _$ServicePartCopyWithImpl(this._self, this._then);

  final ServicePart _self;
  final $Res Function(ServicePart) _then;

/// Create a copy of ServicePart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? costKurus = null,}) {
  return _then(ServicePart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,costKurus: null == costKurus ? _self.costKurus : costKurus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ServicePart].
extension ServicePartPatterns on ServicePart {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServicePart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServicePart() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServicePart value)  $default,){
final _that = this;
switch (_that) {
case _ServicePart():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServicePart value)?  $default,){
final _that = this;
switch (_that) {
case _ServicePart() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  int costKurus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServicePart() when $default != null:
return $default(_that.id,_that.label,_that.costKurus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  int costKurus)  $default,) {final _that = this;
switch (_that) {
case _ServicePart():
return $default(_that.id,_that.label,_that.costKurus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  int costKurus)?  $default,) {final _that = this;
switch (_that) {
case _ServicePart() when $default != null:
return $default(_that.id,_that.label,_that.costKurus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServicePart implements ServicePart {
  const _ServicePart({required this.id, required this.label, this.costKurus = 0});
  factory _ServicePart.fromJson(Map<String, dynamic> json) => _$ServicePartFromJson(json);

@override final  String id;
@override final  String label;
@override@JsonKey() final  int costKurus;

/// Create a copy of ServicePart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServicePartCopyWith<_ServicePart> get copyWith => __$ServicePartCopyWithImpl<_ServicePart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServicePartToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServicePart&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.costKurus, costKurus) || other.costKurus == costKurus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,costKurus);
}

@override
String toString() {
    return 'ServicePart(id: $id, label: $label, costKurus: $costKurus)';
}


}

/// @nodoc
abstract mixin class _$ServicePartCopyWith<$Res> implements $ServicePartCopyWith<$Res> {
  factory _$ServicePartCopyWith(_ServicePart value, $Res Function(_ServicePart) _then) = __$ServicePartCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, int costKurus
});




}
/// @nodoc
class __$ServicePartCopyWithImpl<$Res>
    implements _$ServicePartCopyWith<$Res> {
  __$ServicePartCopyWithImpl(this._self, this._then);

  final _ServicePart _self;
  final $Res Function(_ServicePart) _then;

/// Create a copy of ServicePart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? costKurus = null,}) {
  return _then(_ServicePart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,costKurus: null == costKurus ? _self.costKurus : costKurus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Expense {

 String get id; String get vehicleId; DateTime get spentOn; String get category; int get amountKurus; String get title; String get notes; int get version;
/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCopyWith<Expense> get copyWith => _$ExpenseCopyWithImpl<Expense>(this as Expense, _$identity);

  /// Serializes this Expense to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Expense;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expense&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.spentOn, _this.spentOn) || other.spentOn == _this.spentOn)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.amountKurus, _this.amountKurus) || other.amountKurus == _this.amountKurus)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Expense;
  return Object.hash(runtimeType,_this.id,_this.vehicleId,_this.spentOn,_this.category,_this.amountKurus,_this.title,_this.notes,_this.version);
}

@override
String toString() {
  final _this = this as Expense;
  return 'Expense(id: ${_this.id}, vehicleId: ${_this.vehicleId}, spentOn: ${_this.spentOn}, category: ${_this.category}, amountKurus: ${_this.amountKurus}, title: ${_this.title}, notes: ${_this.notes}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $ExpenseCopyWith<$Res>  {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) = _$ExpenseCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, DateTime spentOn, String category, int amountKurus, String title, String notes, int version
});




}
/// @nodoc
class _$ExpenseCopyWithImpl<$Res>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? spentOn = null,Object? category = null,Object? amountKurus = null,Object? title = null,Object? notes = null,Object? version = null,}) {
  return _then(Expense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,spentOn: null == spentOn ? _self.spentOn : spentOn // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amountKurus: null == amountKurus ? _self.amountKurus : amountKurus // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Expense].
extension ExpensePatterns on Expense {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Expense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Expense value)  $default,){
final _that = this;
switch (_that) {
case _Expense():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Expense value)?  $default,){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime spentOn,  String category,  int amountKurus,  String title,  String notes,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.vehicleId,_that.spentOn,_that.category,_that.amountKurus,_that.title,_that.notes,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime spentOn,  String category,  int amountKurus,  String title,  String notes,  int version)  $default,) {final _that = this;
switch (_that) {
case _Expense():
return $default(_that.id,_that.vehicleId,_that.spentOn,_that.category,_that.amountKurus,_that.title,_that.notes,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  DateTime spentOn,  String category,  int amountKurus,  String title,  String notes,  int version)?  $default,) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.vehicleId,_that.spentOn,_that.category,_that.amountKurus,_that.title,_that.notes,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Expense implements Expense {
  const _Expense({required this.id, required this.vehicleId, required this.spentOn, required this.category, required this.amountKurus, required this.title, this.notes = '', this.version = 1});
  factory _Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  DateTime spentOn;
@override final  String category;
@override final  int amountKurus;
@override final  String title;
@override@JsonKey() final  String notes;
@override@JsonKey() final  int version;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCopyWith<_Expense> get copyWith => __$ExpenseCopyWithImpl<_Expense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.spentOn, spentOn) || other.spentOn == spentOn)&&(identical(other.category, category) || other.category == category)&&(identical(other.amountKurus, amountKurus) || other.amountKurus == amountKurus)&&(identical(other.title, title) || other.title == title)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,vehicleId,spentOn,category,amountKurus,title,notes,version);
}

@override
String toString() {
    return 'Expense(id: $id, vehicleId: $vehicleId, spentOn: $spentOn, category: $category, amountKurus: $amountKurus, title: $title, notes: $notes, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) _then) = __$ExpenseCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, DateTime spentOn, String category, int amountKurus, String title, String notes, int version
});




}
/// @nodoc
class __$ExpenseCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(this._self, this._then);

  final _Expense _self;
  final $Res Function(_Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? spentOn = null,Object? category = null,Object? amountKurus = null,Object? title = null,Object? notes = null,Object? version = null,}) {
  return _then(_Expense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,spentOn: null == spentOn ? _self.spentOn : spentOn // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amountKurus: null == amountKurus ? _self.amountKurus : amountKurus // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$VehicleIssue {

 String get id; String get vehicleId; String get title; String get severity; DateTime? get resolvedAt; int get version;
/// Create a copy of VehicleIssue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleIssueCopyWith<VehicleIssue> get copyWith => _$VehicleIssueCopyWithImpl<VehicleIssue>(this as VehicleIssue, _$identity);

  /// Serializes this VehicleIssue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VehicleIssue;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleIssue&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.resolvedAt, _this.resolvedAt) || other.resolvedAt == _this.resolvedAt)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VehicleIssue;
  return Object.hash(runtimeType,_this.id,_this.vehicleId,_this.title,_this.severity,_this.resolvedAt,_this.version);
}

@override
String toString() {
  final _this = this as VehicleIssue;
  return 'VehicleIssue(id: ${_this.id}, vehicleId: ${_this.vehicleId}, title: ${_this.title}, severity: ${_this.severity}, resolvedAt: ${_this.resolvedAt}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $VehicleIssueCopyWith<$Res>  {
  factory $VehicleIssueCopyWith(VehicleIssue value, $Res Function(VehicleIssue) _then) = _$VehicleIssueCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, String title, String severity, DateTime? resolvedAt, int version
});




}
/// @nodoc
class _$VehicleIssueCopyWithImpl<$Res>
    implements $VehicleIssueCopyWith<$Res> {
  _$VehicleIssueCopyWithImpl(this._self, this._then);

  final VehicleIssue _self;
  final $Res Function(VehicleIssue) _then;

/// Create a copy of VehicleIssue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? title = null,Object? severity = null,Object? resolvedAt = freezed,Object? version = null,}) {
  return _then(VehicleIssue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleIssue].
extension VehicleIssuePatterns on VehicleIssue {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleIssue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleIssue() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleIssue value)  $default,){
final _that = this;
switch (_that) {
case _VehicleIssue():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleIssue value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleIssue() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  String title,  String severity,  DateTime? resolvedAt,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleIssue() when $default != null:
return $default(_that.id,_that.vehicleId,_that.title,_that.severity,_that.resolvedAt,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  String title,  String severity,  DateTime? resolvedAt,  int version)  $default,) {final _that = this;
switch (_that) {
case _VehicleIssue():
return $default(_that.id,_that.vehicleId,_that.title,_that.severity,_that.resolvedAt,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  String title,  String severity,  DateTime? resolvedAt,  int version)?  $default,) {final _that = this;
switch (_that) {
case _VehicleIssue() when $default != null:
return $default(_that.id,_that.vehicleId,_that.title,_that.severity,_that.resolvedAt,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleIssue implements VehicleIssue {
  const _VehicleIssue({required this.id, required this.vehicleId, required this.title, this.severity = 'warning', this.resolvedAt, this.version = 1});
  factory _VehicleIssue.fromJson(Map<String, dynamic> json) => _$VehicleIssueFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  String title;
@override@JsonKey() final  String severity;
@override final  DateTime? resolvedAt;
@override@JsonKey() final  int version;

/// Create a copy of VehicleIssue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleIssueCopyWith<_VehicleIssue> get copyWith => __$VehicleIssueCopyWithImpl<_VehicleIssue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleIssueToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleIssue&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,vehicleId,title,severity,resolvedAt,version);
}

@override
String toString() {
    return 'VehicleIssue(id: $id, vehicleId: $vehicleId, title: $title, severity: $severity, resolvedAt: $resolvedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class _$VehicleIssueCopyWith<$Res> implements $VehicleIssueCopyWith<$Res> {
  factory _$VehicleIssueCopyWith(_VehicleIssue value, $Res Function(_VehicleIssue) _then) = __$VehicleIssueCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, String title, String severity, DateTime? resolvedAt, int version
});




}
/// @nodoc
class __$VehicleIssueCopyWithImpl<$Res>
    implements _$VehicleIssueCopyWith<$Res> {
  __$VehicleIssueCopyWithImpl(this._self, this._then);

  final _VehicleIssue _self;
  final $Res Function(_VehicleIssue) _then;

/// Create a copy of VehicleIssue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? title = null,Object? severity = null,Object? resolvedAt = freezed,Object? version = null,}) {
  return _then(_VehicleIssue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Station {

 String get id; String get name; String get brand; String get address; String get taxNo; double? get latitude; double? get longitude; int get version;
/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationCopyWith<Station> get copyWith => _$StationCopyWithImpl<Station>(this as Station, _$identity);

  /// Serializes this Station to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Station;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Station&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.taxNo, _this.taxNo) || other.taxNo == _this.taxNo)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Station;
  return Object.hash(runtimeType,_this.id,_this.name,_this.brand,_this.address,_this.taxNo,_this.latitude,_this.longitude,_this.version);
}

@override
String toString() {
  final _this = this as Station;
  return 'Station(id: ${_this.id}, name: ${_this.name}, brand: ${_this.brand}, address: ${_this.address}, taxNo: ${_this.taxNo}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $StationCopyWith<$Res>  {
  factory $StationCopyWith(Station value, $Res Function(Station) _then) = _$StationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String brand, String address, String taxNo, double? latitude, double? longitude, int version
});




}
/// @nodoc
class _$StationCopyWithImpl<$Res>
    implements $StationCopyWith<$Res> {
  _$StationCopyWithImpl(this._self, this._then);

  final Station _self;
  final $Res Function(Station) _then;

/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? brand = null,Object? address = null,Object? taxNo = null,Object? latitude = freezed,Object? longitude = freezed,Object? version = null,}) {
  return _then(Station(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,taxNo: null == taxNo ? _self.taxNo : taxNo // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Station].
extension StationPatterns on Station {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Station value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Station() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Station value)  $default,){
final _that = this;
switch (_that) {
case _Station():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Station value)?  $default,){
final _that = this;
switch (_that) {
case _Station() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String brand,  String address,  String taxNo,  double? latitude,  double? longitude,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Station() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.address,_that.taxNo,_that.latitude,_that.longitude,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String brand,  String address,  String taxNo,  double? latitude,  double? longitude,  int version)  $default,) {final _that = this;
switch (_that) {
case _Station():
return $default(_that.id,_that.name,_that.brand,_that.address,_that.taxNo,_that.latitude,_that.longitude,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String brand,  String address,  String taxNo,  double? latitude,  double? longitude,  int version)?  $default,) {final _that = this;
switch (_that) {
case _Station() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.address,_that.taxNo,_that.latitude,_that.longitude,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Station implements Station {
  const _Station({required this.id, required this.name, this.brand = '', this.address = '', this.taxNo = '', this.latitude, this.longitude, this.version = 1});
  factory _Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String brand;
@override@JsonKey() final  String address;
@override@JsonKey() final  String taxNo;
@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey() final  int version;

/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StationCopyWith<_Station> get copyWith => __$StationCopyWithImpl<_Station>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Station&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.address, address) || other.address == address)&&(identical(other.taxNo, taxNo) || other.taxNo == taxNo)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,brand,address,taxNo,latitude,longitude,version);
}

@override
String toString() {
    return 'Station(id: $id, name: $name, brand: $brand, address: $address, taxNo: $taxNo, latitude: $latitude, longitude: $longitude, version: $version)';
}


}

/// @nodoc
abstract mixin class _$StationCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$StationCopyWith(_Station value, $Res Function(_Station) _then) = __$StationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String brand, String address, String taxNo, double? latitude, double? longitude, int version
});




}
/// @nodoc
class __$StationCopyWithImpl<$Res>
    implements _$StationCopyWith<$Res> {
  __$StationCopyWithImpl(this._self, this._then);

  final _Station _self;
  final $Res Function(_Station) _then;

/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? brand = null,Object? address = null,Object? taxNo = null,Object? latitude = freezed,Object? longitude = freezed,Object? version = null,}) {
  return _then(_Station(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,taxNo: null == taxNo ? _self.taxNo : taxNo // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AppraisalReport {

 String get id; String get vehicleId; DateTime get reportDate; String get company; String get filePath; String get mimeType; int? get km; String get notes; int get version;
/// Create a copy of AppraisalReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppraisalReportCopyWith<AppraisalReport> get copyWith => _$AppraisalReportCopyWithImpl<AppraisalReport>(this as AppraisalReport, _$identity);

  /// Serializes this AppraisalReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppraisalReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppraisalReport&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.reportDate, _this.reportDate) || other.reportDate == _this.reportDate)&&(identical(other.company, _this.company) || other.company == _this.company)&&(identical(other.filePath, _this.filePath) || other.filePath == _this.filePath)&&(identical(other.mimeType, _this.mimeType) || other.mimeType == _this.mimeType)&&(identical(other.km, _this.km) || other.km == _this.km)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppraisalReport;
  return Object.hash(runtimeType,_this.id,_this.vehicleId,_this.reportDate,_this.company,_this.filePath,_this.mimeType,_this.km,_this.notes,_this.version);
}

@override
String toString() {
  final _this = this as AppraisalReport;
  return 'AppraisalReport(id: ${_this.id}, vehicleId: ${_this.vehicleId}, reportDate: ${_this.reportDate}, company: ${_this.company}, filePath: ${_this.filePath}, mimeType: ${_this.mimeType}, km: ${_this.km}, notes: ${_this.notes}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $AppraisalReportCopyWith<$Res>  {
  factory $AppraisalReportCopyWith(AppraisalReport value, $Res Function(AppraisalReport) _then) = _$AppraisalReportCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, DateTime reportDate, String company, String filePath, String mimeType, int? km, String notes, int version
});




}
/// @nodoc
class _$AppraisalReportCopyWithImpl<$Res>
    implements $AppraisalReportCopyWith<$Res> {
  _$AppraisalReportCopyWithImpl(this._self, this._then);

  final AppraisalReport _self;
  final $Res Function(AppraisalReport) _then;

/// Create a copy of AppraisalReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? reportDate = null,Object? company = null,Object? filePath = null,Object? mimeType = null,Object? km = freezed,Object? notes = null,Object? version = null,}) {
  return _then(AppraisalReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,reportDate: null == reportDate ? _self.reportDate : reportDate // ignore: cast_nullable_to_non_nullable
as DateTime,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,km: freezed == km ? _self.km : km // ignore: cast_nullable_to_non_nullable
as int?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppraisalReport].
extension AppraisalReportPatterns on AppraisalReport {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppraisalReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppraisalReport() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppraisalReport value)  $default,){
final _that = this;
switch (_that) {
case _AppraisalReport():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppraisalReport value)?  $default,){
final _that = this;
switch (_that) {
case _AppraisalReport() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime reportDate,  String company,  String filePath,  String mimeType,  int? km,  String notes,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppraisalReport() when $default != null:
return $default(_that.id,_that.vehicleId,_that.reportDate,_that.company,_that.filePath,_that.mimeType,_that.km,_that.notes,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime reportDate,  String company,  String filePath,  String mimeType,  int? km,  String notes,  int version)  $default,) {final _that = this;
switch (_that) {
case _AppraisalReport():
return $default(_that.id,_that.vehicleId,_that.reportDate,_that.company,_that.filePath,_that.mimeType,_that.km,_that.notes,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  DateTime reportDate,  String company,  String filePath,  String mimeType,  int? km,  String notes,  int version)?  $default,) {final _that = this;
switch (_that) {
case _AppraisalReport() when $default != null:
return $default(_that.id,_that.vehicleId,_that.reportDate,_that.company,_that.filePath,_that.mimeType,_that.km,_that.notes,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppraisalReport implements AppraisalReport {
  const _AppraisalReport({required this.id, required this.vehicleId, required this.reportDate, required this.company, required this.filePath, required this.mimeType, this.km, this.notes = '', this.version = 1});
  factory _AppraisalReport.fromJson(Map<String, dynamic> json) => _$AppraisalReportFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  DateTime reportDate;
@override final  String company;
@override final  String filePath;
@override final  String mimeType;
@override final  int? km;
@override@JsonKey() final  String notes;
@override@JsonKey() final  int version;

/// Create a copy of AppraisalReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppraisalReportCopyWith<_AppraisalReport> get copyWith => __$AppraisalReportCopyWithImpl<_AppraisalReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppraisalReportToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppraisalReport&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.reportDate, reportDate) || other.reportDate == reportDate)&&(identical(other.company, company) || other.company == company)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.km, km) || other.km == km)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,vehicleId,reportDate,company,filePath,mimeType,km,notes,version);
}

@override
String toString() {
    return 'AppraisalReport(id: $id, vehicleId: $vehicleId, reportDate: $reportDate, company: $company, filePath: $filePath, mimeType: $mimeType, km: $km, notes: $notes, version: $version)';
}


}

/// @nodoc
abstract mixin class _$AppraisalReportCopyWith<$Res> implements $AppraisalReportCopyWith<$Res> {
  factory _$AppraisalReportCopyWith(_AppraisalReport value, $Res Function(_AppraisalReport) _then) = __$AppraisalReportCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, DateTime reportDate, String company, String filePath, String mimeType, int? km, String notes, int version
});




}
/// @nodoc
class __$AppraisalReportCopyWithImpl<$Res>
    implements _$AppraisalReportCopyWith<$Res> {
  __$AppraisalReportCopyWithImpl(this._self, this._then);

  final _AppraisalReport _self;
  final $Res Function(_AppraisalReport) _then;

/// Create a copy of AppraisalReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? reportDate = null,Object? company = null,Object? filePath = null,Object? mimeType = null,Object? km = freezed,Object? notes = null,Object? version = null,}) {
  return _then(_AppraisalReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,reportDate: null == reportDate ? _self.reportDate : reportDate // ignore: cast_nullable_to_non_nullable
as DateTime,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,km: freezed == km ? _self.km : km // ignore: cast_nullable_to_non_nullable
as int?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LedgerEntry {

 String get id; String get vehicleId; DateTime get date; String get category; int get amountKurus; String get title; String get sourceType; String get sourceId;
/// Create a copy of LedgerEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerEntryCopyWith<LedgerEntry> get copyWith => _$LedgerEntryCopyWithImpl<LedgerEntry>(this as LedgerEntry, _$identity);

  /// Serializes this LedgerEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LedgerEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.amountKurus, _this.amountKurus) || other.amountKurus == _this.amountKurus)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.sourceType, _this.sourceType) || other.sourceType == _this.sourceType)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LedgerEntry;
  return Object.hash(runtimeType,_this.id,_this.vehicleId,_this.date,_this.category,_this.amountKurus,_this.title,_this.sourceType,_this.sourceId);
}

@override
String toString() {
  final _this = this as LedgerEntry;
  return 'LedgerEntry(id: ${_this.id}, vehicleId: ${_this.vehicleId}, date: ${_this.date}, category: ${_this.category}, amountKurus: ${_this.amountKurus}, title: ${_this.title}, sourceType: ${_this.sourceType}, sourceId: ${_this.sourceId})';
}


}

/// @nodoc
abstract mixin class $LedgerEntryCopyWith<$Res>  {
  factory $LedgerEntryCopyWith(LedgerEntry value, $Res Function(LedgerEntry) _then) = _$LedgerEntryCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, DateTime date, String category, int amountKurus, String title, String sourceType, String sourceId
});




}
/// @nodoc
class _$LedgerEntryCopyWithImpl<$Res>
    implements $LedgerEntryCopyWith<$Res> {
  _$LedgerEntryCopyWithImpl(this._self, this._then);

  final LedgerEntry _self;
  final $Res Function(LedgerEntry) _then;

/// Create a copy of LedgerEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? date = null,Object? category = null,Object? amountKurus = null,Object? title = null,Object? sourceType = null,Object? sourceId = null,}) {
  return _then(LedgerEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amountKurus: null == amountKurus ? _self.amountKurus : amountKurus // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sourceType: null == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerEntry].
extension LedgerEntryPatterns on LedgerEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerEntry value)  $default,){
final _that = this;
switch (_that) {
case _LedgerEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerEntry value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime date,  String category,  int amountKurus,  String title,  String sourceType,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerEntry() when $default != null:
return $default(_that.id,_that.vehicleId,_that.date,_that.category,_that.amountKurus,_that.title,_that.sourceType,_that.sourceId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  DateTime date,  String category,  int amountKurus,  String title,  String sourceType,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _LedgerEntry():
return $default(_that.id,_that.vehicleId,_that.date,_that.category,_that.amountKurus,_that.title,_that.sourceType,_that.sourceId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  DateTime date,  String category,  int amountKurus,  String title,  String sourceType,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _LedgerEntry() when $default != null:
return $default(_that.id,_that.vehicleId,_that.date,_that.category,_that.amountKurus,_that.title,_that.sourceType,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerEntry implements LedgerEntry {
  const _LedgerEntry({required this.id, required this.vehicleId, required this.date, required this.category, required this.amountKurus, required this.title, required this.sourceType, required this.sourceId});
  factory _LedgerEntry.fromJson(Map<String, dynamic> json) => _$LedgerEntryFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  DateTime date;
@override final  String category;
@override final  int amountKurus;
@override final  String title;
@override final  String sourceType;
@override final  String sourceId;

/// Create a copy of LedgerEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerEntryCopyWith<_LedgerEntry> get copyWith => __$LedgerEntryCopyWithImpl<_LedgerEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.date, date) || other.date == date)&&(identical(other.category, category) || other.category == category)&&(identical(other.amountKurus, amountKurus) || other.amountKurus == amountKurus)&&(identical(other.title, title) || other.title == title)&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,vehicleId,date,category,amountKurus,title,sourceType,sourceId);
}

@override
String toString() {
    return 'LedgerEntry(id: $id, vehicleId: $vehicleId, date: $date, category: $category, amountKurus: $amountKurus, title: $title, sourceType: $sourceType, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$LedgerEntryCopyWith<$Res> implements $LedgerEntryCopyWith<$Res> {
  factory _$LedgerEntryCopyWith(_LedgerEntry value, $Res Function(_LedgerEntry) _then) = __$LedgerEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, DateTime date, String category, int amountKurus, String title, String sourceType, String sourceId
});




}
/// @nodoc
class __$LedgerEntryCopyWithImpl<$Res>
    implements _$LedgerEntryCopyWith<$Res> {
  __$LedgerEntryCopyWithImpl(this._self, this._then);

  final _LedgerEntry _self;
  final $Res Function(_LedgerEntry) _then;

/// Create a copy of LedgerEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? date = null,Object? category = null,Object? amountKurus = null,Object? title = null,Object? sourceType = null,Object? sourceId = null,}) {
  return _then(_LedgerEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amountKurus: null == amountKurus ? _self.amountKurus : amountKurus // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sourceType: null == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
