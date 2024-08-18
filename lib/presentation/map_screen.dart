import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krili/application/location_notifier.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final _mapController = MapController();
  final _panelController = PanelController();
  bool showPanel = false;
  @override
  Widget build(BuildContext context) {
    final currentLocationData = ref.watch(locationProvider);
    return Scaffold(
      body: SlidingUpPanel(
        backdropEnabled: true,
        onPanelClosed: () {
          setState(() {
            showPanel = false;
          });
        },
        isDraggable: false,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        renderPanelSheet: showPanel,
        controller: _panelController,
        panel: const Center(
          child: Text('Hello World!'),
        ),
        body: currentLocationData.when(
          data: (currentLocation) => FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: currentLocation,
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.carbodex.krili',
                // Plenty of other options available!
              ),
              CurrentLocationLayer(),
              MarkerLayer(
                markers: [
                  Marker(
                    point: const LatLng(22.777037, 5.537962),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showPanel = true;
                        });
                        _panelController.open();
                      },
                      child: const Icon(Icons.location_on),
                    ),
                  ),
                  Marker(
                    point: const LatLng(22.797037, 5.527962),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showPanel = true;
                        });
                        _panelController.open();
                      },
                      child: const Icon(Icons.location_on),
                    ),
                  ),
                  Marker(
                    point: const LatLng(22.757037, 5.517962),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showPanel = true;
                        });
                        _panelController.open();
                      },
                      child: const Icon(Icons.location_on),
                    ),
                  ),
                ],
              ),
            ],
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
