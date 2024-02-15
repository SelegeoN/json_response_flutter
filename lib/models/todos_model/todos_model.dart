import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todos_model.freezed.dart';
part 'todos_model.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json)
  => _$TodoFromJson(json);
}