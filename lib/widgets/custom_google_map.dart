import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  String? mapStyle;
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        target: LatLng(31.212848665725318, 29.91916361124228), zoom: 12);
    initMapStyle();
    super.initState();
  }

  void initMapStyle() async {
    mapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/night_map.json");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          style: mapStyle,
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          initialCameraPosition: initialCameraPosition,
          // cameraTargetBounds: CameraTargetBounds(
          //   LatLngBounds(
          //     southwest: const LatLng(30.840388981857377, 29.396626376536762),
          //     northeast: const LatLng(31.31145554237395, 30.279652506167338),
          //   ),
          // ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          left: 16,
          child: ElevatedButton(
            onPressed: () {
              googleMapController.animateCamera(
                CameraUpdate.newLatLng(
                  const LatLng(30.054843970884242, 31.20276717469177),
                ),
              );
            },
            child: const Text("Change Location"),
          ),
        ),
      ],
    );
  }
}
