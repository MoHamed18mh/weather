import 'package:geolocator/geolocator.dart';

/// Fetches the current location of the device.
/// 
/// This function checks if the location services are enabled and if the
/// necessary permissions are granted. If not, it requests the permissions.
/// If the permissions are denied or the location services are not enabled,
/// it returns an error.
Future<Position> getLocation() async {
  // Check if location services are enabled
  bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isServiceEnabled) {
    return Future.error('Location service not activated');
  }

  // Check the current location permission status
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Request permission if it is denied
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Site permission denied');
    }
  }

  // If permission is denied forever, return an error
  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permission has been permanently denied, please change the settings manually');
  }

  // Try to get the current position
  try {
    return await Geolocator.getCurrentPosition();
  } catch (e) {
    return Future.error('An error occurred while fetching the site: $e');
  }
}