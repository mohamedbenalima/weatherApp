import 'package:freezed_annotation/freezed_annotation.dart';

part 'wind.freezed.dart';
part 'wind.g.dart';

@freezed
class Wind with _$Wind {
  const Wind._();
  const factory Wind({
    required double? speed,
    required int? deg,
    required double? gust,
  }) = _Wind;

  factory Wind.empty() => const Wind(
        speed: 0.0,
        deg: 0,
        gust: 0.0,
      );
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
