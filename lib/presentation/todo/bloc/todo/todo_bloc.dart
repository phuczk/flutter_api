import 'package:api_flutter/domain/todo/usecase/todo_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/todo/entity/todo_entity/todo_entity.dart';
import '../../../../manager/enum/status_enum.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUseCase _todoUseCase;
  TodoBloc(this._todoUseCase) : super(const TodoState()) {
    on<FetchTodoEvent>(_fetchTodoDevent);
    on<FetchTodoByTaskIdEvent>(_fetchTodoByTaskIdDevent);
    on<AddTodoEvent>(_addTodoDevent);
    on<UpdateTodoEvent>(_updateTodoDevent);
    on<DeleteTodoEvent>(_deleteTodoDevent);
  }

  Future<void> _fetchTodoDevent(FetchTodoEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _todoUseCase.fetchTodos();
      emit(state.copyWith(status: Status.success, todos: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
      print(e);
    }
  }

  Future<void> _fetchTodoByTaskIdDevent(
      FetchTodoByTaskIdEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _todoUseCase.fetchTodosByTaskId(event.taskId);
      emit(state.copyWith(status: Status.success, todos: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
      print(e);
    }
  }

  Future<void> _addTodoDevent(AddTodoEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _todoUseCase.addTodo(event.todoEntity);
      emit(state.copyWith(status: Status.success, todoEnity: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
    }
  }

  Future<void> _updateTodoDevent(UpdateTodoEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      final result = await _todoUseCase.updateTodo(event.id, event.todo);
      emit(state.copyWith(status: Status.success, todoEnity: result));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
    }
  }

  Future<void> _deleteTodoDevent(DeleteTodoEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, message: "dang load"));
    try {
      await _todoUseCase.deleteTodo(event.id);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failed, message: e.toString()));
    }
  }
}
