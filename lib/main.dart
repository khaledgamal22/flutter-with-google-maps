import 'package:flutter/material.dart';
import 'package:flutter_with_google_maps/widgets/custom_google_map.dart';

void main() {
  runApp(const GoogleMapApp());
}

class GoogleMapApp extends StatelessWidget {
  const GoogleMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomGoogleMap(),
      ),
    );
  }
}
