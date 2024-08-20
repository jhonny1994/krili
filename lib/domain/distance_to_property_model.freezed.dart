// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distance_to_property_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DistanceToProperty _$DistanceToPropertyFromJson(Map<String, dynamic> json) {
  return _DistanceToProperty.fromJson(json);
}

/// @nodoc
mixin _$DistanceToProperty {
  double get startLatitude => throw _privateConstructorUsedError;
  double get startLongitude => throw _privateConstructorUsedError;
  double get endLatitude => throw _privateConstructorUsedError;
  double get endLongitude => throw _privateConstructorUsedError;

  /// Serializes this DistanceToProperty to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DistanceToProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistanceToPropertyCopyWith<DistanceToProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceToPropertyCopyWith<$Res> {
  factory $DistanceToPropertyCopyWith(
          DistanceToProperty value, $Res Function(DistanceToProperty) then) =
      _$DistanceToPropertyCopyWithImpl<$Res, DistanceToProperty>;
  @useResult
  $Res call(
      {double startLatitude,
      double startLongitude,
      double endLatitude,
      double endLongitude});
}

/// @nodoc
class _$DistanceToPropertyCopyWithImpl<$Res, $Val extends DistanceToProperty>
    implements $DistanceToPropertyCopyWith<$Res> {
  _$DistanceToPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DistanceToProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startLatitude = null,
    Object? startLongitude = null,
    Object? endLatitude = null,
    Object? endLongitude = null,
  }) {
    return _then(_value.copyWith(
      startLatitude: null == startLatitude
          ? _value.startLatitude
          : startLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      startLongitude: null == startLongitude
          ? _value.startLongitude
          : startLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLatitude: null == endLatitude
          ? _value.endLatitude
          : endLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLongitude: null == endLongitude
          ? _value.endLongitude
          : endLongitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistanceToPropertyImplCopyWith<$Res>
    implements $DistanceToPropertyCopyWith<$Res> {
  factory _$$DistanceToPropertyImplCopyWith(_$DistanceToPropertyImpl value,
          $Res Function(_$DistanceToPropertyImpl) then) =
      __$$DistanceToPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double startLatitude,
      double startLongitude,
      double endLatitude,
      double endLongitude});
}

/// @nodoc
class __$$DistanceToPropertyImplCopyWithImpl<$Res>
    extends _$DistanceToPropertyCopyWithImpl<$Res, _$DistanceToPropertyImpl>
    implements _$$DistanceToPropertyImplCopyWith<$Res> {
  __$$DistanceToPropertyImplCopyWithImpl(_$DistanceToPropertyImpl _value,
      $Res Function(_$DistanceToPropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistanceToProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startLatitude = null,
    Object? startLongitude = null,
    Object? endLatitude = null,
    Object? endLongitude = null,
  }) {
    return _then(_$DistanceToPropertyImpl(
      startLatitude: null == startLatitude
          ? _value.startLatitude
          : startLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      startLongitude: null == startLongitude
          ? _value.startLongitude
          : startLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLatitude: null == endLatitude
          ? _value.endLatitude
          : endLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      endLongitude: null == endLongitude
          ? _value.endLongitude
          : endLongitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistanceToPropertyImpl implements _DistanceToProperty {
  const _$DistanceToPropertyImpl(
      {required this.startLatitude,
      required this.startLongitude,
      required this.endLatitude,
      required this.endLongitude});

  factory _$DistanceToPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistanceToPropertyImplFromJson(json);

  @override
  final double startLatitude;
  @override
  final double startLongitude;
  @override
  final double endLatitude;
  @override
  final double endLongitude;

  @override
  String toString() {
    return 'DistanceToProperty(startLatitude: $startLatitude, startLongitude: $startLongitude, endLatitude: $endLatitude, endLongitude: $endLongitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistanceToPropertyImpl &&
            (identical(other.startLatitude, startLatitude) ||
                other.startLatitude == startLatitude) &&
            (identical(other.startLongitude, startLongitude) ||
                other.startLongitude == startLongitude) &&
            (identical(other.endLatitude, endLatitude) ||
                other.endLatitude == endLatitude) &&
            (identical(other.endLongitude, endLongitude) ||
                other.endLongitude == endLongitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, startLatitude, startLongitude, endLatitude, endLongitude);

  /// Create a copy of DistanceToProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistanceToPropertyImplCopyWith<_$DistanceToPropertyImpl> get copyWith =>
      __$$DistanceToPropertyImplCopyWithImpl<_$DistanceToPropertyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistanceToPropertyImplToJson(
      this,
    );
  }
}

abstract class _DistanceToProperty implements DistanceToProperty {
  const factory _DistanceToProperty(
      {required final double startLatitude,
      required final double startLongitude,
      required final double endLatitude,
      required final double endLongitude}) = _$DistanceToPropertyImpl;

  factory _DistanceToProperty.fromJson(Map<String, dynamic> json) =
      _$DistanceToPropertyImpl.fromJson;

  @override
  double get startLatitude;
  @override
  double get startLongitude;
  @override
  double get endLatitude;
  @override
  double get endLongitude;

  /// Create a copy of DistanceToProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistanceToPropertyImplCopyWith<_$DistanceToPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
