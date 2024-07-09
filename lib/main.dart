import 'package:api_flutter/di/injection.dart';
import 'package:api_flutter/domain/task/usecase/task_use_case.dart';
import 'package:api_flutter/domain/todo/usecase/todo_use_case.dart';
import 'package:api_flutter/presentation/task/bloc/task/task_bloc.dart';
import 'package:api_flutter/presentation/task/screen/task_screen.dart';
import 'package:api_flutter/presentation/todo/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(getIt<TodoUseCase>()),
        ),
        BlocProvider(
          create: (context) => TaskBloc(getIt<TaskUseCase>()),
        ),
      ],
      child: MaterialApp(
        title: "api demo",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TaskPage(),
      ),
    );
  }
}
