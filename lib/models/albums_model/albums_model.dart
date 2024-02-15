import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'albums_model.freezed.dart';
part 'albums_model.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    required int userId,
    required int id,
    required String title,
  }) = _Album;

  factory Album.fromJson(Map<String, Object?> json)
  => _$AlbumFromJson(json);
}