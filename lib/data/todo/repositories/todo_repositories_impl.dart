import 'package:api_flutter/data/todo/api/todo/todo_api_service.dart';
import 'package:api_flutter/data/todo/response/todo_response/todo_response.dart';
import 'package:api_flutter/domain/todo/entity/todo_entity/todo_entity.dart';
import 'package:api_flutter/domain/todo/repositories/todo_repositories.dart';
import 'package:dio/dio.dart';

import '../api/custom_api/api_excepton.dart';

class TodoRespositoryImpl implements TodoRepository {
  final TodoApiService _todoApiService;

  TodoRespositoryImpl(this._todoApiService);

  @override
  Future<List<TodoEntity>> fetchTodos() async {
    try {
      final httpResponse = await _todoApiService.fetchTodos();
      return httpResponse;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw ApiException.fromDioException(e);
    } catch (e) {
      throw ApiException(message: "Failed to fetch todos: $e");
    }
  }

  @override
  Future<List<TodoEntity>> fetchTodosByTaskId(String taskId) async {
    try {
      final httpResponse = await _todoApiService.fetchTodosByTaskId(taskId);
      return httpResponse;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw ApiException.fromDioException(e);
    } catch (e) {
      throw ApiException(message: "Failed to fetch todos by task id: $e");
    }
  }

  @override
  Future<TodoEntity> addTodo(TodoResponse todoEntity) async {
    try {
      final httpResponse = await _todoApiService.addTodo(todoEntity);
      return httpResponse;
      // ignore: deprecated_member_use
    } catch (e) {
      throw ApiException(message: "Failed to add todos: $e");
    }
  }

  @override
  Future<TodoEntity> updateTodo(String id, TodoResponse todoEntity) async {
    try {
      final httpResponse = await _todoApiService.updateTodo(id, todoEntity);
      return httpResponse;
      // ignore: deprecated_member_use
    } catch (e) {
      throw ApiException(message: "Failed to update todos: $e");
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    try {
      await _todoApiService.deleteTodo(id);
      // ignore: deprecated_member_use
    } catch (e) {
      throw ApiException(message: "Failed to delete todo: $e");
    }
  }
}
