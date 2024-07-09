import 'package:api_flutter/domain/task/entity/task_entity/task_entity.dart';
import 'package:api_flutter/presentation/todo/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/todo/entity/todo_entity/todo_entity.dart';
import '../../../manager/enum/status_enum.dart';

class TodoPage extends StatefulWidget {
  final TaskEntity task;
  const TodoPage({super.key, required this.task});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final taskId = widget.task.id ?? '';

    context.read<TodoBloc>().add(FetchTodoByTaskIdEvent(taskId));
  }

  void _onAddTask(String taskTitle) {
    final newTodo = TodoEntity(
      title: taskTitle,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      taskId: widget.task.id,
      isDone: false,
    );
    final taskId = widget.task.id ?? "";
    context.read<TodoBloc>().add(AddTodoEvent(todoEntity: newTodo));
    context.read<TodoBloc>().add(FetchTodoByTaskIdEvent(taskId));
  }

  @override
  Widget build(BuildContext context) {
    final taskId = widget.task.id ?? '';
    final todoTitle = widget.task.title ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text('$todoTitle Screen'),
        leading: RefreshButtonWidget(taskId: taskId),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            TitleWidget(titleTodo: todoTitle),
            ListPostSectionWidget(taskId: taskId),
            AddTaskWidget(
              textController: _textController,
              onAddTask: _onAddTask,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class TitleWidget extends StatelessWidget {
  final String titleTodo;
  const TitleWidget({super.key, required this.titleTodo});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleTodo,
      style: const TextStyle(
          fontSize: 26, fontWeight: FontWeight.w600, color: Colors.blue),
    );
  }
}

class ListPostSectionWidget extends StatelessWidget {
  final String taskId;
  const ListPostSectionWidget({super.key, required this.taskId});

  void _showDeleteConfirmationDialog(
      BuildContext context, String id, String taskId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this item?"),
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
                context.read<TodoBloc>().add(DeleteTodoEvent(id: id));
                context.read<TodoBloc>().add(FetchTodoByTaskIdEvent(taskId));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<TodoBloc, TodoState>(
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
            return FailedWidget(state: state);
          } else if (state.status == Status.success) {
            final listPost = state.todos ?? [];
            return ListView.builder(
              itemCount: listPost.length,
              itemBuilder: (context, index) {
                final postItem = listPost[index];
                return ListTile(
                  onTap: () {},
                  title: Text(postItem.title ?? "not found"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(
                          context, postItem.id ?? "", taskId);
                    },
                  ),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class FailedWidget extends StatelessWidget {
  final TodoState state;
  const FailedWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(state.message ?? 'Oops ! Somethings wrong'),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () {
              context.read<TodoBloc>().add(const FetchTodoEvent());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class RefreshButtonWidget extends StatelessWidget {
  final String taskId;
  const RefreshButtonWidget({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        context.read<TodoBloc>().add(FetchTodoByTaskIdEvent(taskId));
      },
    );
  }
}

class AddTaskWidget extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onAddTask;

  const AddTaskWidget({
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
              labelText: 'todo Title',
              border: OutlineInputBorder(),
            ),
            onSubmitted: onAddTask,
          ),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            onAddTask(textController.text);
            textController.clear();
          },
          child: const Text("add"),
        ),
      ],
    );
  }
}
