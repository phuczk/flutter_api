import 'package:api_flutter/domain/todo/entity/todo_entity/todo_entity.dart';

import '../../../data/todo/response/todo_response/todo_response.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> fetchTodos();
  Future<List<TodoEntity>> fetchTodosByTaskId(String taskId);
  Future<TodoEntity> addTodo(TodoResponse todo);
  Future<TodoEntity> updateTodo(String id, TodoResponse todo);
  Future<void> deleteTodo(String id);
}
