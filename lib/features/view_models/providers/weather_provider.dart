import 'package:flutter/Material.dart';
import 'package:weatherapp/features/models/coord.dart';
import 'package:weatherapp/features/models/weather_output.dart';
import 'package:weatherapp/features/view_models/services/location_service.dart';
import 'package:weatherapp/features/view_models/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final List<WeatherOutput> _cities = [];
  List<WeatherOutput> get cities => _cities;

  // This method is used to display the weather of a city
  Future<void> displayCitie({
    required double lat,
    required double lng,
    String? rq,
  }) async {
    WeatherOutput weather;
    loading(true);
    final WeatherOutput weatherOutput = await getWeatherData(
      lat: lat,
      lng: lng,
    );
    rq == null
        ? weather = weatherOutput
        : weather = weatherOutput.copyWith(
            name: '$rq ${weatherOutput.name}',
          );
    if (_cities.contains(weather) == false) {
      _cities.add(weather);
    }
    loading(false);
    notifyListeners();
  }

// this method is used to display the weather of the current city using geolocation
  Future<void> displayCurrentCity() async {
    final Coord coord = await getCurrentLocation();
    displayCitie(
      lat: coord.lat ?? 0,
      lng: coord.lon ?? 0,
      rq: 'Position actuelle: ',
    );
    loading(false);
    notifyListeners();
  }
}
