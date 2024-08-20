// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_to_property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistanceToPropertyImpl _$$DistanceToPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$DistanceToPropertyImpl(
      startLatitude: (json['startLatitude'] as num).toDouble(),
      startLongitude: (json['startLongitude'] as num).toDouble(),
      endLatitude: (json['endLatitude'] as num).toDouble(),
      endLongitude: (json['endLongitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$DistanceToPropertyImplToJson(
        _$DistanceToPropertyImpl instance) =>
    <String, dynamic>{
      'startLatitude': instance.startLatitude,
      'startLongitude': instance.startLongitude,
      'endLatitude': instance.endLatitude,
      'endLongitude': instance.endLongitude,
    };
