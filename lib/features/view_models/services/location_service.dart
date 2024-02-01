import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/features/models/coord.dart';

Future<Coord> getCurrentLocation() async {
  await Geolocator.requestPermission();
  await Geolocator.requestPermission();

  final Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  log('lat: ${position.latitude} | lng: ${position.longitude}');
  return Coord(lat: position.latitude, lon: position.longitude);
}
