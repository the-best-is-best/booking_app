import 'package:geolocator/geolocator.dart';
import 'package:mit_x/mit_x.dart';

Future<Position> getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    await Geolocator.openLocationSettings();
    MitX.snackbar('Error', 'Location services are disabled.',
        duration: const Duration(minutes: 3),
        snackPosition: SnackPosition.BOTTOM);
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      MitX.snackbar('Error', 'Location permissions are denied.',
          duration: const Duration(minutes: 3),
          snackPosition: SnackPosition.BOTTOM);
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    MitX.snackbar('Error',
        'Location permissions are permanently denied, we cannot request permissions.',
        duration: const Duration(minutes: 3),
        snackPosition: SnackPosition.BOTTOM);
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
