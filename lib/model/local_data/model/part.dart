import 'package:freezed_annotation/freezed_annotation.dart';

part 'part.freezed.dart';
part 'part.g.dart';

@freezed
class Part with _$Part {
  const factory Part({
    required int id,
    required String name,
    required int quantity,
    required String location,
    String? imagePath,
  }) = _Part;

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);
}
