import '../entity/task_entity/task_entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> fetchTasks();
  Future<TaskEntity> addTask(TaskEntity todo);
  Future<TaskEntity> updateTask(String id, TaskEntity todo);
  Future<void> deleteTask(String id);
}
