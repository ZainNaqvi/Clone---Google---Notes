import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/models/task.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    'Pending tasks: ${tasksList.length}',
                  ),
                ),
              ),
              TasksList(tasks: tasksList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void _addTask(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Add Task",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: titleController,
                  style: const TextStyle(height: 1.5),
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Title'),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel"),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        final task = Task(title: titleController.text);
                        context.read<TasksBloc>().add(AddTask(task: task));
                        Navigator.pop(context);
                      },
                      child: Text("Add Task"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
