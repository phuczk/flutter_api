import 'package:json_annotation/json_annotation.dart';

part 'todo_request.g.dart';

@JsonSerializable()
class TodoRequest {
  final int id;
  final int taskId;
  final String title;
  final bool isDone;

  TodoRequest(
      {required this.id,
      required this.taskId,
      required this.title,
      required this.isDone});

  // Phương thức từ JSON (fromJson) và sang JSON (toJson)
  factory TodoRequest.fromJson(Map<String, dynamic> json) =>
      _$TodoRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TodoRequestToJson(this);
}
