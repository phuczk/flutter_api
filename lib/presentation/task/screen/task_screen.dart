import 'package:api_flutter/domain/task/entity/task_entity/task_entity.dart';
import 'package:api_flutter/presentation/todo/screen/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/enum/status_enum.dart';
import '../bloc/task/task_bloc.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(const FetchTaskEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Screen'),
        leading: const RefreshButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const TitleWidget(),
            const SizedBox(height: 16),
            TaskInputRow(
              textController: _textController,
              onAddTask: (title) {
                if (title.isNotEmpty) {
                  final newTask = TaskEntity(
                    title: title,
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                  );
                  context
                      .read<TaskBloc>()
                      .add(AddTaskEvent(taskEntity: newTask));
                  context.read<TaskBloc>().add(const FetchTaskEvent());
                  _textController.clear();
                }
              },
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: ListTaskSectionWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskInputRow extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onAddTask;

  const TaskInputRow({
    Key? key,
    required this.textController,
    required this.onAddTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: 'Task Title',
              border: OutlineInputBorder(),
            ),
            onSubmitted: onAddTask,
          ),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            onAddTask(textController.text);
          },
          child: const Text("Add Task"),
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Task List",
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.blue,
      ),
    );
  }
}

class ListTaskSectionWidget extends StatelessWidget {
  const ListTaskSectionWidget({Key? key});

  static const List<Color> _cardColors = [
    Color.fromARGB(225, 201, 203, 231),
    Color.fromARGB(225, 207, 231, 196),
    Color.fromARGB(225, 247, 191, 209),
    Color.fromARGB(225, 171, 223, 231),
    Color.fromARGB(225, 251, 245, 191),
    Color.fromARGB(225, 235, 199, 233),
  ];

  void _showDeleteConfirmationDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this task?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                context.read<TaskBloc>().add(DeleteTaskEvent(id: id));
                context.read<TaskBloc>().add(const FetchTaskEvent());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToToDo(
      {required TaskEntity task, required BuildContext context}) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoPage(task: task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state.status == Status.failed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message ?? '')));
        }
      },
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const LoadingWidget();
        } else if (state.status == Status.failed) {
          return FailedWidget(
            state: state,
          );
        } else if (state.status == Status.success) {
          final tasks = state.tasks ?? [];
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 1.5,
            ),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              final colorIndex = index % _cardColors.length;
              return Card(
                elevation: 2,
                color: _cardColors[colorIndex],
                child: InkWell(
                  onTap: () {
                    _navigateToToDo(task: task, context: context);
                  },
                  child: ListTile(
                    title: Text(task.title ?? "Untitled"),
                    subtitle: const Text(
                      "click here",
                      style: TextStyle(color: Color.fromARGB(66, 51, 51, 51)),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, task.id ?? "");
                      },
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class FailedWidget extends StatelessWidget {
  final TaskState state;
  const FailedWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(state.message ?? 'Oops! Something went wrong'),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () {
              context.read<TaskBloc>().add(const FetchTaskEvent());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class RefreshButtonWidget extends StatelessWidget {
  const RefreshButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        context.read<TaskBloc>().add(const FetchTaskEvent());
      },
    );
  }
}
