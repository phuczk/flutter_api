part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<TaskEntity>? tasks;
  final TaskEntity? taskEnity;
  final Status? status;
  final String? message;
  final String? id;
  const TaskState({
    this.id,
    this.message,
    this.status = Status.initial,
    this.taskEnity,
    this.tasks = const [],
  });

  @override
  List<Object?> get props => [id, message, status, taskEnity, tasks];

  TaskState copyWith({
    List<TaskEntity>? tasks,
    TaskEntity? taskEnity,
    String? id,
    Status? status,
    String? message,
  }) {
    return TaskState(
      message: message ?? this.message,
      status: status ?? this.status,
      taskEnity: taskEnity ?? this.taskEnity,
      tasks: tasks ?? this.tasks,
      id: id ?? this.id,
    );
  }
}
