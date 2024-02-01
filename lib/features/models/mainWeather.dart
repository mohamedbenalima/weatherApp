import 'package:freezed_annotation/freezed_annotation.dart';

part 'mainWeather.freezed.dart';
part 'mainWeather.g.dart';

@freezed
class MainWeather with _$MainWeather {
  const MainWeather._();
  const factory MainWeather({
    required double? temp,
    required double? feels_like,
    required double? temp_min,
    required double? temp_max,
    required int? pressure,
    required int? humidity,
  }) = _MainWeather;

  factory MainWeather.empty() => const MainWeather(
        temp: 0.0,
        feels_like: 0.0,
        temp_min: 0.0,
        temp_max: 0.0,
        pressure: 0,
        humidity: 0,
      );
  factory MainWeather.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherFromJson(json);
}
