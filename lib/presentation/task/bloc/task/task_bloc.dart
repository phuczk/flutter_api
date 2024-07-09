import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/task/entity/task_entity/task_entity.dart';
import '../../../../domain/task/usecase/task_use_case.dart';
import '../../../../manager/enum/status_enum.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskUseCase _taskUseCase;
  TaskBloc(this._taskUseCase) : super(const TaskState()) {
    on<FetchTaskEvent>(_fetchTaskDevent);
    on<AddTaskEvent>(_addTaskDevent);
    on<UpdateTaskEvent>(_updateTaskDevent);
    on<DeleteTaskEvent>(_deleteTaskDevent);
  }

  Future<void> _fetchTaskDevent(FetchTaskEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _taskUseCase.fetchTasks();
      emit(state.copyWith(status: Status.success, tasks: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
      print(e);
    }
  }

  Future<void> _addTaskDevent(AddTaskEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _taskUseCase.addTask(event.taskEntity);
      emit(state.copyWith(status: Status.success, taskEnity: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
    }
  }

  Future<void> _updateTaskDevent(UpdateTaskEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _taskUseCase.updateTask(event.id, event.task);
      emit(state.copyWith(status: Status.success, taskEnity: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
    }
  }

  Future<void> _deleteTaskDevent(DeleteTaskEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      await _taskUseCase.deleteTask(event.id);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
    }
  }
}
