import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherapp/features/models/clouds.dart';
import 'package:weatherapp/features/models/coord.dart';
import 'package:weatherapp/features/models/mainWeather.dart';
import 'package:weatherapp/features/models/sys.dart';
import 'package:weatherapp/features/models/wind.dart';

part 'weather_output.freezed.dart';
part 'weather_output.g.dart';

@freezed
class WeatherOutput with _$WeatherOutput {
  const WeatherOutput._();
  const factory WeatherOutput({
    required Coord? coord,
    required String? base,
    required MainWeather? main,
    required int? visibility,
    required Wind? wind,
    required Clouds? clouds,
    required int? dt,
    required Sys? sys,
    required int? timezone,
    required int? id,
    required String? name,
    required int? cod,
  }) = _WeatherOutput;

  factory WeatherOutput.empty() => WeatherOutput(
        coord: Coord.empty(),
        base: '',
        main: MainWeather.empty(),
        visibility: 0,
        wind: Wind.empty(),
        clouds: Clouds.empty(),
        dt: 0,
        sys: Sys.empty(),
        timezone: 0,
        id: 0,
        name: '',
        cod: 0,
      );
  factory WeatherOutput.fromJson(Map<String, dynamic> json) =>
      _$WeatherOutputFromJson(json);
}
