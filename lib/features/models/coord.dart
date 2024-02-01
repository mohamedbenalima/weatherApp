import 'package:freezed_annotation/freezed_annotation.dart';

part 'coord.freezed.dart';
part 'coord.g.dart';

@freezed
class Coord with _$Coord {
  const Coord._();
  const factory Coord({
    required double? lon,
    required double? lat,
  }) = _Coord;

  factory Coord.empty() => const Coord(
        lon: 0.0,
        lat: 0.0,
      );
  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}
