import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/blocs/bloc_exports.dart';
import 'package:flutter_bloc_patern/models/tasks_model.dart';
import 'package:flutter_bloc_patern/screens/drawer_widget.dart';

import '../widgets/modal_box.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  static const id = '/';
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.allTasks;
      return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Tasks App'),
          actions: [
            IconButton(
              onPressed: () => showModalBox(context),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text(
                    'Pending tasks: 0',
                  ),
                ),
              ),
              TasksList(tasks: tasksList),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBox(context),
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
