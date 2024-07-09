import 'package:api_flutter/data/todo/api/todo/todo_api_service.dart';
import 'package:api_flutter/data/todo/repositories/todo_repositories_impl.dart';
import 'package:api_flutter/domain/todo/repositories/todo_repositories.dart';
import 'package:api_flutter/domain/todo/usecase/todo_use_case.dart';
import 'package:api_flutter/presentation/todo/bloc/todo/todo_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/todo/api/task/task_api_service.dart';
import '../data/todo/repositories/task_repositories_impl.dart';
import '../domain/task/repositories/task_repositories.dart';
import '../domain/task/usecase/task_use_case.dart';
import '../presentation/task/bloc/task/task_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  final dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
      logPrint: (object) {
        if (object.toString().contains('ERROR')) {
          if (kDebugMode) {
            print('\x1B[31m$object\x1B[0m');
          } // Red color for errors
        } else if (object.toString().contains('Request')) {
          if (kDebugMode) {
            print('\x1B[34m$object\x1B[0m');
          } // Blue color for requests
        } else if (object.toString().contains('Response')) {
          if (kDebugMode) {
            print('\x1B[32m$object\x1B[0m');
          } // Green color for responses
        } else {
          if (kDebugMode) {
            print(object);
          } // Default color for other logs
        }
      },
    ));

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<TodoApiService>(
      () => TodoApiService(getIt<Dio>()));

  getIt.registerLazySingleton<TodoRepository>(
      () => TodoRespositoryImpl(getIt()));

  getIt.registerLazySingleton<TodoUseCase>(
      () => TodoUseCase(getIt<TodoRepository>()));

  getIt.registerFactory<TodoBloc>(() => TodoBloc(getIt()));

  getIt.registerLazySingleton<TaskApiService>(
      () => TaskApiService(getIt<Dio>()));

  getIt.registerLazySingleton<TaskRepository>(
      () => TaskRespositoryImpl(getIt()));

  getIt.registerLazySingleton<TaskUseCase>(
      () => TaskUseCase(getIt<TaskRepository>()));

  getIt.registerFactory<TaskBloc>(() => TaskBloc(getIt()));
}
