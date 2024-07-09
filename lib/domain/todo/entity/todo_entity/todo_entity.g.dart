// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoEntity _$TodoEntityFromJson(Map<String, dynamic> json) => TodoEntity(
      taskId: json['taskId'] as String?,
      id: json['id'] as String?,
      title: json['title'] as String?,
      isDone: json['isDone'] as bool?,
    );

Map<String, dynamic> _$TodoEntityToJson(TodoEntity instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'id': instance.id,
      'title': instance.title,
      'isDone': instance.isDone,
    };
