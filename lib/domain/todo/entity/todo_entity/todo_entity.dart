import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String? taskId;
  final String? id;
  final String? title;
  final bool? isDone;

  const TodoEntity({this.taskId, this.id, this.title, this.isDone});

  @override
  List<Object?> get props => [taskId, id, title, isDone];
}
