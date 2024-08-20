import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_to_property_model.freezed.dart';
part 'distance_to_property_model.g.dart';

@freezed
class DistanceToProperty with _$DistanceToProperty {
  const factory DistanceToProperty({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) = _DistanceToProperty;

  factory DistanceToProperty.fromJson(Map<String, dynamic> json) =>
      _$DistanceToPropertyFromJson(json);
}
