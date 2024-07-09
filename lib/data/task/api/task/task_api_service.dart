import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../domain/task/entity/task_entity/task_entity.dart';
import '../../response/task_response/task_response.dart';

part "task_api_service.g.dart";

@RestApi(baseUrl: "http://192.168.43.107:3000")
abstract class TaskApiService {
  factory TaskApiService(Dio dio) = _TaskApiService;

  @GET("/tasks")
  Future<List<TaskResponse>> fetchTasks();

  @POST("/tasks")
  Future<TaskResponse> addTask(
    @Body() TaskEntity TaskEntity,
  );

  @PUT("/tasks/{id}")
  Future<TaskResponse> updateTask(
    @Path("id") String id,
    @Body() TaskEntity TaskEntity,
  );

  @DELETE("/tasks/{id}")
  Future<void> deleteTask(
    @Path("id") String id,
  );
}
