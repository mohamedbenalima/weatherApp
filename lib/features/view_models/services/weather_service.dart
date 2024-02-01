import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/features/models/weather_output.dart';
import 'package:weatherapp/shared/config.dart';
import 'package:weatherapp/shared/urls.dart';

final dio = Dio();
Future<WeatherOutput> getWeatherData({
  required double lat,
  required double lng,
}) async {
  final response = await dio.get(
    openWeatherMapURL,
    queryParameters: {
      'lat': lat,
      'lon': lng,
      'appid': keyOpenWeatherMap,
      'units': 'metric',
    },
  );
  log('WeatherOutput response DTO: ${WeatherOutput.fromJson(response.data)}');
  return WeatherOutput.fromJson(response.data);
}
