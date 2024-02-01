import 'package:freezed_annotation/freezed_annotation.dart';

part 'clouds.freezed.dart';
part 'clouds.g.dart';

@freezed
class Clouds with _$Clouds {
  const Clouds._();
  const factory Clouds({
    required int? all,
  }) = _Clouds;

  factory Clouds.empty() => const Clouds(
        all: 0,
      );
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}
