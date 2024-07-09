// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoRequest _$TodoRequestFromJson(Map<String, dynamic> json) => TodoRequest(
      id: (json['id'] as num).toInt(),
      taskId: (json['taskId'] as num).toInt(),
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$TodoRequestToJson(TodoRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'title': instance.title,
      'isDone': instance.isDone,
    };
