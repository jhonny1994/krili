// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return _Property.fromJson(json);
}

/// @nodoc
mixin _$Property {
  String? get id => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get rooms => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyCopyWith<Property> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyCopyWith<$Res> {
  factory $PropertyCopyWith(Property value, $Res Function(Property) then) =
      _$PropertyCopyWithImpl<$Res, Property>;
  @useResult
  $Res call(
      {String? id,
      String? ownerId,
      String name,
      List<String> images,
      double latitude,
      double longitude,
      int price,
      int rooms,
      bool available,
      DateTime createdAt});
}

/// @nodoc
class _$PropertyCopyWithImpl<$Res, $Val extends Property>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? name = null,
    Object? images = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? price = null,
    Object? rooms = null,
    Object? available = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as int,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyImplCopyWith<$Res>
    implements $PropertyCopyWith<$Res> {
  factory _$$PropertyImplCopyWith(
          _$PropertyImpl value, $Res Function(_$PropertyImpl) then) =
      __$$PropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? ownerId,
      String name,
      List<String> images,
      double latitude,
      double longitude,
      int price,
      int rooms,
      bool available,
      DateTime createdAt});
}

/// @nodoc
class __$$PropertyImplCopyWithImpl<$Res>
    extends _$PropertyCopyWithImpl<$Res, _$PropertyImpl>
    implements _$$PropertyImplCopyWith<$Res> {
  __$$PropertyImplCopyWithImpl(
      _$PropertyImpl _value, $Res Function(_$PropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? name = null,
    Object? images = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? price = null,
    Object? rooms = null,
    Object? available = null,
    Object? createdAt = null,
  }) {
    return _then(_$PropertyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as int,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyImpl implements _Property {
  const _$PropertyImpl(
      {this.id,
      this.ownerId,
      required this.name,
      required final List<String> images,
      required this.latitude,
      required this.longitude,
      required this.price,
      required this.rooms,
      this.available = true,
      required this.createdAt})
      : _images = images;

  factory _$PropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyImplFromJson(json);

  @override
  final String? id;
  @override
  final String? ownerId;
  @override
  final String name;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int price;
  @override
  final int rooms;
  @override
  @JsonKey()
  final bool available;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Property(id: $id, ownerId: $ownerId, name: $name, images: $images, latitude: $latitude, longitude: $longitude, price: $price, rooms: $rooms, available: $available, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.rooms, rooms) || other.rooms == rooms) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      name,
      const DeepCollectionEquality().hash(_images),
      latitude,
      longitude,
      price,
      rooms,
      available,
      createdAt);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      __$$PropertyImplCopyWithImpl<_$PropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyImplToJson(
      this,
    );
  }
}

abstract class _Property implements Property {
  const factory _Property(
      {final String? id,
      final String? ownerId,
      required final String name,
      required final List<String> images,
      required final double latitude,
      required final double longitude,
      required final int price,
      required final int rooms,
      final bool available,
      required final DateTime createdAt}) = _$PropertyImpl;

  factory _Property.fromJson(Map<String, dynamic> json) =
      _$PropertyImpl.fromJson;

  @override
  String? get id;
  @override
  String? get ownerId;
  @override
  String get name;
  @override
  List<String> get images;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get price;
  @override
  int get rooms;
  @override
  bool get available;
  @override
  DateTime get createdAt;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
