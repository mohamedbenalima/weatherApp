import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const Weather._();
  const factory Weather({
    required int? id,
    required String? main,
    required String? description,
    required String? icon,
  }) = _Weather;

  factory Weather.empty() => const Weather(
        id: 0,
        main: '',
        description: '',
        icon: '',
      );
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
