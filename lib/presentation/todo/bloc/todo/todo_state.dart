part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<TodoEntity>? todos;
  final TodoEntity? todoEnity;
  final Status? status;
  final String? message;
  final String? id;
  final String? taskId;

  const TodoState({
    this.message,
    this.status = Status.initial,
    this.todoEnity,
    this.todos = const [],
    this.id,
    this.taskId,
  });

  @override
  List<Object?> get props => [message, status, todoEnity, todos, id, taskId];

  TodoState copyWith(
      {List<TodoEntity>? todos,
      TodoEntity? todoEnity,
      String? id,
      Status? status,
      String? message,
      String? taskId}) {
    return TodoState(
        message: message ?? this.message,
        status: status ?? this.status,
        todoEnity: todoEnity ?? this.todoEnity,
        todos: todos ?? this.todos,
        id: id ?? this.id,
        taskId: taskId ?? this.taskId);
  }
}
