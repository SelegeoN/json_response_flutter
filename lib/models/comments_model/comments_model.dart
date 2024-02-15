import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json)
  => _$CommentFromJson(json);
}