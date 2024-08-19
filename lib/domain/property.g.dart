// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyImpl _$$PropertyImplFromJson(Map<String, dynamic> json) =>
    _$PropertyImpl(
      id: json['id'] as String?,
      ownerId: json['ownerId'] as String?,
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      price: (json['price'] as num).toInt(),
      rooms: (json['rooms'] as num).toInt(),
      available: json['available'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PropertyImplToJson(_$PropertyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'images': instance.images,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'price': instance.price,
      'rooms': instance.rooms,
      'available': instance.available,
      'createdAt': instance.createdAt.toIso8601String(),
    };
