import 'package:api_flutter/data/music/api/music/music_api_service.dart';
import 'package:api_flutter/data/music/repositories/music_repositories_impl.dart';
import 'package:api_flutter/domain/music/usecase/music_usecase.dart';
import 'package:api_flutter/presentation/music/bloc/music/music_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/main/screen/main_screen.dart';

void main() {
  final dio = Dio();
  final musicApiService = MusicApiService(dio);
  final musicRepository = MusicRepositoriesImpl(musicApiService);
  final musicUsecase = MusicUsecase(musicRepository);
  runApp(MyApp(musicUsecase: musicUsecase));
}

class MyApp extends StatelessWidget {
  final MusicUsecase musicUsecase;
  const MyApp({super.key, required this.musicUsecase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MusicBloc(musicUsecase),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
