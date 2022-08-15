import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';

class LocationServices {
  static Future<LocationData?> myPosition() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();
    return locationData;
  }

  static Future<String> myLocationAddress() async {
    final myPosition = await LocationServices.myPosition();

    if (myPosition == null) {
      return 'can\'t found your location';
    }

    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(myPosition.latitude!, myPosition.longitude!);
    final myPlacemark = placemarks[0];

    return '${myPlacemark.street} ${myPlacemark.postalCode}';
  }
}
