import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:krili/domain/distance_to_property_model.dart';
import 'package:latlong2/latlong.dart';

final locationProvider = FutureProvider<LatLng>((ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  final position = await Geolocator.getCurrentPosition();

  return LatLng(position.latitude, position.longitude);
});

final distanceToPropertyProvider = Provider.family<String, DistanceToProperty>(
  (ref, distance) => (Geolocator.distanceBetween(
            distance.startLatitude,
            distance.startLongitude,
            distance.endLatitude,
            distance.endLongitude,
          ) /
          1000)
      .toStringAsFixed(2),
);
