import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

final locationProvider = StreamProvider<LatLng>((ref) async* {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    yield* Stream.error('Location services are disabled.');
    return;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      yield* Stream.error('Location permissions are denied');
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    yield* Stream.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
    return;
  }

  final locationStream = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    ),
  );

  await for (final position in locationStream) {
    yield LatLng(position.latitude, position.longitude);
  }
});
