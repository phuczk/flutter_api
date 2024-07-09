import 'package:api_flutter/domain/todo/entity/todo_entity/todo_entity.dart';
import 'package:api_flutter/domain/todo/repositories/todo_repositories.dart';

class TodoUseCase {
  final TodoRepository _todoResitory;

  TodoUseCase(this._todoResitory);

  Future<List<TodoEntity>> fetchTodos() async {
    try {
      return _todoResitory.fetchTodos();
    } catch (e) {
      throw e;
    }
  }

  Future<List<TodoEntity>> fetchTodosByTaskId(String taskId) async {
    try {
      return _todoResitory.fetchTodosByTaskId(taskId);
    } catch (e) {
      throw e;
    }
  }

  Future<TodoEntity> addTodo(TodoEntity todo) async {
    try {
      return _todoResitory.addTodo(todo);
    } catch (e) {
      throw e;
    }
  }

  Future<TodoEntity> updateTodo(String id, TodoEntity todo) async {
    try {
      return _todoResitory.updateTodo(id, todo);
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      return _todoResitory.deleteTodo(id);
    } catch (e) {
      throw e;
    }
  }
}
