import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:krili/application/location_notifier.dart';
import 'package:krili/domain/distance_to_property_model.dart';
import 'package:krili/domain/floating_bottom_sheet.dart';
import 'package:krili/domain/property.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen>
    with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController =
      AnimatedMapController(
    vsync: this,
    curve: Curves.easeInOut,
  );

  @override
  Widget build(BuildContext context) {
    final currentLocationData = ref.watch(locationProvider);

    return Scaffold(
      body: Center(
        child: currentLocationData.when(
          data: _buildMap,
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(error.toString(), textAlign: TextAlign.center),
                ElevatedButton(
                  onPressed: () => ref.refresh(locationProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          loading: () => const CircularProgressIndicator.adaptive(),
        ),
      ),
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

  Widget _buildImageCarousel(List<String> images) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: CarouselSlider(
          items: images
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: CachedNetworkImage(
                    imageUrl: e,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enlargeCenterPage: true,
            enlargeFactor: 0.25,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String value) {
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

  Marker _buildMarker(
    BuildContext context,
    Property property,
    LatLng currentLocation,
  ) {
    return Marker(
      point: LatLng(property.latitude, property.longitude),
      child: InkWell(
        onTap: () => _handleMarkerTap(context, property, currentLocation),
        child: const Icon(Icons.location_on),
      ),
    );
  }

  Widget _buildMarkerLayer(BuildContext context, LatLng currentLocation) {
    return MarkerLayer(
      markers: dummyProperties
          .map(
            (property) => _buildMarker(
              context,
              property,
              currentLocation,
            ),
          )
          .toList(),
    );
  }

  Widget _buildPriceAndBookingRow(BuildContext context, Property property) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            '${property.price} DA/Night',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          FilledButton(
            onPressed: () => _handleBookTap(
              context,
              [
                DateTime.now().add(const Duration(days: 1)),
                DateTime.now().add(const Duration(days: 7)),
              ],
              property,
            ),
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyDetailsSheet(
    BuildContext context,
    Property property,
    LatLng currentLocation,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          property.name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Gap(8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              _buildInfoRow(context, Icons.house, '${property.rooms} rooms'),
              _buildInfoRow(context, Icons.bed, '${property.beds} beds'),
              _buildInfoRow(
                context,
                Icons.location_on,
                '${ref.watch(
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
        ),
        const Gap(4),
        _buildImageCarousel(property.images),
        const Gap(4),
        _buildPriceAndBookingRow(context, property),
      ],
    );
  }

  Future<void> _handleBookTap(
    BuildContext context,
    List<DateTime>? bookedDates,
    Property property,
  ) {
    return showFloatingModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: SfDateRangePicker(
          onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
          monthViewSettings: DateRangePickerMonthViewSettings(
            weekendDays: const [DateTime.friday, DateTime.saturday],
            blackoutDates: bookedDates,
          ),
          onSubmit: (range) {
            if ((range as PickerDateRange?) != null &&
                range?.endDate != null &&
                range?.startDate != null) {
              _showOrderDetailsModal(
                context,
                property,
                range!,
              );
            }
          },
          selectionMode: DateRangePickerSelectionMode.range,
          enablePastDates: false,
          showActionButtons: true,
        ),
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
        builder: (BuildContext context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: _buildPropertyDetailsSheet(context, property, currentLocation),
        ),
      );
    }
    await _animatedMapController.animateTo(
      dest: currentLocation,
      zoom: 14,
    );
  }

  void _showOrderConfirmedModal(BuildContext context) {
    showFloatingModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 48,
              ),
              const Gap(16),
              Text(
                'Order Confirmed!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              Text(
                'Your booking has been confirmed successfully.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOrderDetailsModal(
    BuildContext context,
    Property property,
    PickerDateRange dateRange,
  ) =>
      showFloatingModalBottomSheet(
        context: context,
        builder: (BuildContext context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Details',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(8),
              Text(
                'Property: ${property.name}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Gap(8),
              Text(
                'Check-in: ${DateFormat.yMMMd().format(dateRange.startDate!)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Check-out: ${DateFormat.yMMMd().format(dateRange.endDate!)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        (route) => !Navigator.canPop(context),
                      );
                      _showOrderConfirmedModal(context);
                    },
                    child: const Text('Confirm Order'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
