import 'package:geolocator/geolocator.dart';


Future<Position?> getPosition() async {
  // Position? position = await Geolocator.getLastKnownPosition();
  Position? position = await Geolocator.getCurrentPosition();
  return position;
}
