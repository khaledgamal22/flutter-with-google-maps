import 'package:flutter/material.dart';
import 'package:flutter_with_google_maps/utils/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
  late LocationService locationService;
  String? mapStyle;
  Set<Marker> markers = {};
  bool isFirstCall = true;
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        target: LatLng(31.212848665725318, 29.91916361124228), zoom: 1);
    initMapStyle();
    locationService = LocationService();
    updateMyLocation();
    super.initState();
  }

  void initMapStyle() async {
    mapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/night_map.json");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      zoomControlsEnabled: false,
      style: mapStyle,
      onMapCreated: (controller) {
        googleMapController = controller;
      },
      initialCameraPosition: initialCameraPosition,
    );
  }

  void updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    bool ispermissionEnabled =
        await locationService.checkAndRequestLocationPermission();
    //that avoid calling getLocationData if the permission is not granted
    if (ispermissionEnabled) {
      locationService.getRealTimeLocationData(
        (locationData) {
          setMyLocationMarker(locationData);
          setState(() {});
          if (isFirstCall) {
            googleMapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target:
                      LatLng(locationData.latitude!, locationData.longitude!),
                  zoom: 15,
                ),
              ),
            );
            isFirstCall = false;
          } else {
            googleMapController?.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(locationData.latitude!, locationData.longitude!),
              ),
            );
          }
        },
      );
    }
  }

  void setMyLocationMarker(LocationData locationData) {
    Marker myMarkerLocation = Marker(
      markerId: const MarkerId('myLocation'),
      position: LatLng(locationData.latitude!, locationData.longitude!),
    );
    markers.add(myMarkerLocation);
  }
}
