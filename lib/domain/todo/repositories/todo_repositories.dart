import 'package:api_flutter/domain/todo/entity/todo_entity/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> fetchTodos();
  Future<List<TodoEntity>> fetchTodosByTaskId(String taskId);
  Future<TodoEntity> addTodo(TodoEntity todo);
  Future<TodoEntity> updateTodo(String id, TodoEntity todo);
  Future<void> deleteTodo(String id);
}
