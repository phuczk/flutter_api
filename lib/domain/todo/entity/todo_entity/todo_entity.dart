import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_entity.g.dart';

@JsonSerializable()
class TodoEntity extends Equatable {
  final String? taskId;
  final String? id;
  final String? title;
  final bool? isDone;

  const TodoEntity({this.taskId, this.id, this.title, this.isDone});

  factory TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TodoEntityToJson(this);

  @override
  List<Object?> get props => [taskId, id, title, isDone];
}
