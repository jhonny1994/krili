import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:krili/application/location_notifier.dart';
import 'package:krili/domain/distance_to_property_model.dart';
import 'package:krili/domain/floating_bottom_sheet.dart';
import 'package:krili/domain/property.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen>
    with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController =
      AnimatedMapController(vsync: this);

  @override
  Widget build(BuildContext context) {
    final currentLocationData = ref.watch(locationProvider);

    return Scaffold(
      body: Center(
        child: currentLocationData.when(
          data: _buildMap,
          error: (Object error, StackTrace stackTrace) =>
              Text(error.toString()),
          loading: () => const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    AnimatedMapController(
      vsync: this,
      curve: Curves.easeInOut,
    );
  }

  Widget _buildCurrentLocationLayer(LatLng currentLocation) {
    return InkWell(
      child: CurrentLocationLayer(),
      onTap: () => _animatedMapController.animateTo(
        dest: currentLocation,
        zoom: 14,
      ),
    );
  }

  Widget _buildMap(LatLng currentLocation) {
    return FlutterMap(
      mapController: _animatedMapController.mapController,
      options: MapOptions(
        initialCenter: currentLocation,
        initialZoom: 14,
        minZoom: 12,
        maxZoom: 16,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.carbodex.krili',
        ),
        _buildCurrentLocationLayer(currentLocation),
        _buildMarkerLayer(context, currentLocation),
      ],
    );
  }

  Widget _buildMarkerLayer(BuildContext context, LatLng currentLocation) {
    return MarkerLayer(
      markers: dummyProperties.map((Property property) {
        return Marker(
          point: LatLng(property.latitude, property.longitude),
          child: InkWell(
            onTap: () => _handleMarkerTap(context, property, currentLocation),
            child: const Icon(Icons.location_on),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPropertyDetailsSheet(
    BuildContext context,
    Property property,
    LatLng currentLocation,
  ) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.name,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Gap(8),
          Row(
            children: [
              _infoRow(
                icon: Icons.house,
                value: property.rooms.toString(),
              ),
              _infoRow(
                icon: Icons.bed,
                value: property.beds.toString(),
              ),
              _infoRow(
                icon: Icons.location_on,
                value: '${ref.watch(
                  distanceToPropertyProvider(
                    DistanceToProperty(
                      startLatitude: currentLocation.latitude,
                      startLongitude: currentLocation.longitude,
                      endLatitude: property.latitude,
                      endLongitude: property.longitude,
                    ),
                  ),
                )} Km',
              ),
            ],
          ),
          const Gap(8),
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.33,
            ),
            child: CarouselSlider(
              items: property.images
                  .map((e) => CachedNetworkImage(imageUrl: e))
                  .toList(),
              options: CarouselOptions(autoPlay: true),
            ),
          ),
          const Gap(8),
          Row(
            children: [
              Text(
                '${property.price} DA/Night',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(4),
              const Spacer(),
              FilledButton(
                onPressed: () {},
                child: const Text('Book'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _handleMarkerTap(
    BuildContext context,
    Property property,
    LatLng currentLocation,
  ) async {
    await _animatedMapController.animateTo(
      dest: LatLng(property.latitude, property.longitude),
      offset: Offset(0, -MediaQuery.of(context).size.height * 0.25),
      zoom: 16,
    );
    if (context.mounted) {
      await showFloatingModalBottomSheet(
        context: context,
        builder: (BuildContext context) =>
            _buildPropertyDetailsSheet(context, property, currentLocation),
      );
    }
    await _animatedMapController.animateTo(
      dest: currentLocation,
      zoom: 14,
    );
  }

  Widget _infoRow({
    required IconData icon,
    required String value,
  }) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon),
          const Gap(4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
