import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_entity.g.dart';

@JsonSerializable()
class TaskEntity extends Equatable {
  final String? id;
  final String? title;

  const TaskEntity({this.id, this.title});

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);

  @override
  List<Object?> get props => [id, title];
}
