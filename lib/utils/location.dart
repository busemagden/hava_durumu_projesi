import 'package:location/location.dart';

class LocationHelper {
  // To track results, we added LocationHelper to the loading screen.
  late double latitude;
  late double longitude;
  // latitude and longitude are used as latitude and longitude above

  // Now we need to create a function to get the user's location information:

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    // Is the service for Location on?
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return;
    }

    // Location permission check (has the user allowed using location?)
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // If permissions are complete:
    _locationData = await location.getLocation();
    latitude = _locationData.latitude!;
    longitude = _locationData.longitude!;
  }
}

// şimdi bu yaptıklarımızı loading_screen de çağıracağız.
