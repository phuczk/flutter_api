import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/todo/entity/todo_entity/todo_entity.dart';

part 'todo_response.g.dart';

@JsonSerializable()
class TodoResponse extends TodoEntity {
  @override
  @JsonKey(name: "taskId")
  final String? taskId;

  const TodoResponse({
    this.taskId,
    super.id,
    super.title,
    super.isDone,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TodoResponseToJson(this);
}
