import 'package:api_flutter/domain/todo/entity/todo_entity/todo_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../response/todo_response/todo_response.dart';

part "todo_api_service.g.dart";

@RestApi(baseUrl: "http://192.168.43.107:3000")
abstract class TodoApiService {
  factory TodoApiService(Dio dio) = _TodoApiService;

  @GET("/todos")
  Future<List<TodoResponse>> fetchTodos();

  @GET("/todos")
  Future<List<TodoResponse>> fetchTodosByTaskId(@Query("taskId") String taskId);

  @POST("/todos")
  Future<TodoResponse> addTodo(
    @Body() TodoEntity todoEntity,
  );

  @PUT("/todos/{id}")
  Future<TodoResponse> updateTodo(
    @Path("id") String id,
    @Body() TodoEntity todoEntity,
  );

  @DELETE("/todos/{id}")
  Future<void> deleteTodo(
    @Path("id") String id,
  );
}
