import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/models/task.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'add_task.dart';

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
                onPressed: () => addTask(context),
                icon: const Icon(Icons.add),
              ),
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
            onPressed: () => addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
