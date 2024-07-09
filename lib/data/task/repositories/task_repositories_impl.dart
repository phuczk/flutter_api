import '../../../domain/task/entity/task_entity/task_entity.dart';
import '../../../domain/task/repositories/task_repositories.dart';
import '../../todo/api/custom_api/api_excepton.dart';
import '../api/task/task_api_service.dart';

class TaskRespositoryImpl implements TaskRepository {
  final TaskApiService _taskApiService;

  TaskRespositoryImpl(this._taskApiService);

  @override
  Future<List<TaskEntity>> fetchTasks() async {
    try {
      final httpResponse = await _taskApiService.fetchTasks();
      return httpResponse;
      // ignore: deprecated_member_use
    } catch (e) {
      throw ApiException(message: "Failed to fetch Tasks: $e");
    }
  }

  @override
  Future<TaskEntity> addTask(TaskEntity TaskEntity) async {
    try {
      final httpResponse = await _taskApiService.addTask(TaskEntity);
      return httpResponse;
      // ignore: deprecated_member_use
    } catch (e) {
      throw ApiException(message: "Failed to add Tasks: $e");
    }
  }

  @override
  Future<TaskEntity> updateTask(String id, TaskEntity TaskEntity) async {
    try {
      final httpResponse = await _taskApiService.updateTask(id, TaskEntity);
      return httpResponse;
      // ignore: deprecated_member_use
    } catch (e) {
      throw ApiException(message: "Failed to update Tasks: $e");
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await _taskApiService.deleteTask(id);
      // ignore: deprecated_member_use
    } catch (e) {
      throw ApiException(message: "Failed to delete Task: $e");
    }
  }
}
