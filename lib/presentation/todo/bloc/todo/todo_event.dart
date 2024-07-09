part of 'todo_bloc.dart';

class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class FetchTodoEvent extends TodoEvent {
  const FetchTodoEvent();
}

class FetchTodoByTaskIdEvent extends TodoEvent {
  final String taskId;
  const FetchTodoByTaskIdEvent(this.taskId);

  @override
  List<Object?> get props => [taskId];
}

class AddTodoEvent extends TodoEvent {
  final TodoResponse todoEntity;
  const AddTodoEvent({required this.todoEntity});

  @override
  List<Object?> get props => [todoEntity];
}

class UpdateTodoEvent extends TodoEvent {
  final String id;
  final TodoResponse todo;
  const UpdateTodoEvent({required this.id, required this.todo});

  @override
  List<Object?> get props => [];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  const DeleteTodoEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
