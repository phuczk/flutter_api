import '../entity/task_entity/task_entity.dart';
import '../repositories/task_repositories.dart';

class TaskUseCase {
  final TaskRepository _taskResitory;

  TaskUseCase(this._taskResitory);

  Future<List<TaskEntity>> fetchTasks() async {
    try {
      return _taskResitory.fetchTasks();
    } catch (e) {
      throw e;
    }
  }

  Future<TaskEntity> addTask(TaskEntity Task) async {
    try {
      return _taskResitory.addTask(Task);
    } catch (e) {
      throw e;
    }
  }

  Future<TaskEntity> updateTask(String id, TaskEntity Task) async {
    try {
      return _taskResitory.updateTask(id, Task);
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      return _taskResitory.deleteTask(id);
    } catch (e) {
      throw e;
    }
  }
}
