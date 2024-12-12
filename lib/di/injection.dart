import 'package:api_flutter/data/music/api/music/music_api_service.dart';
import 'package:api_flutter/data/music/repositories/music_repositories_impl.dart';
import 'package:api_flutter/domain/music/repositories/music_repoditories.dart';
import 'package:api_flutter/domain/music/usecase/music_usecase.dart';
import 'package:api_flutter/presentation/music/bloc/music/music_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
          }
        } else if (object.toString().contains('Request')) {
          if (kDebugMode) {
            print('\x1B[34m$object\x1B[0m');
          }
        } else if (object.toString().contains('Response')) {
          if (kDebugMode) {
            print('\x1B[32m$object\x1B[0m');
          }
        } else {
          if (kDebugMode) {
            print(object);
          }
        }
      },
    ));

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<MusicApiService>(
      () => MusicApiService(getIt<Dio>()));

  getIt.registerLazySingleton<MusicRepository>(
      () => MusicRepositoriesImpl(getIt()));

  getIt.registerLazySingleton<MusicUsecase>(
      () => MusicUsecase(getIt<MusicRepository>()));

  getIt.registerFactory<MusicBloc>(() => MusicBloc(getIt()));
}
