import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/task/entity/task_entity/task_entity.dart';

part 'task_response.g.dart';

@JsonSerializable()
class TaskResponse extends TaskEntity {
  @override
  @JsonKey(name: "id")
  final String? id;

  const TaskResponse({
    this.id,
    super.title,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);
}
