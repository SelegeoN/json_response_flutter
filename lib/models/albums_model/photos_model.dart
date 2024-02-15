import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'photos_model.freezed.dart';
part 'photos_model.g.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json)
  => _$PhotoFromJson(json);
}