import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<bool> checkAndRequestLocationService() async {
    bool isLocationEnabled = await location.serviceEnabled();
    if (!isLocationEnabled) {
      isLocationEnabled = await location.requestService();
      if (!isLocationEnabled) {
        return false;
      }
    }
    return true;
  }

  Future<bool> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        // show dialog to inform user that location permission is required
      }
    }
    return permissionStatus == PermissionStatus.granted;
  }

  void getRealTimeLocationData(void Function(LocationData)? onData) {
    location.changeSettings(
      distanceFilter: 2,
    );
    location.onLocationChanged.listen(onData);
  }
}
