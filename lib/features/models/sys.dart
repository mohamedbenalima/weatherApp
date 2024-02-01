import 'package:freezed_annotation/freezed_annotation.dart';

part 'sys.freezed.dart';
part 'sys.g.dart';

@freezed
class Sys with _$Sys {
  const Sys._();
  const factory Sys({
    required int? type,
    required int? id,
    required String? country,
    required int? sunrise,
    required int? sunset,
  }) = _Sys;

  factory Sys.empty() => const Sys(
        type: 0,
        id: 0,
        country: '',
        sunrise: 0,
        sunset: 0,
      );
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}
