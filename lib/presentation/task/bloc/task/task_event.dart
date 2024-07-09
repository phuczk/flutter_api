part of 'task_bloc.dart';

class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class FetchTaskEvent extends TaskEvent {
  const FetchTaskEvent();
}

class AddTaskEvent extends TaskEvent {
  final TaskEntity taskEntity;
  const AddTaskEvent({required this.taskEntity});

  @override
  List<Object?> get props => [TaskEntity];
}

class UpdateTaskEvent extends TaskEvent {
  final String id;
  final TaskEntity task;
  const UpdateTaskEvent({required this.id, required this.task});

  @override
  List<Object?> get props => [];
}

class DeleteTaskEvent extends TaskEvent {
  final String id;
  const DeleteTaskEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
