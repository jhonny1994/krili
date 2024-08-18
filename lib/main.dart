import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krili/presentation/map_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: Platform.isWindows,
        builder: (context) => const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const MapScreen(),
    );
  }
}
