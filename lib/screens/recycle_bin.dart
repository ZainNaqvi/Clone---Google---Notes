import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patern/models/tasks_model.dart';
import 'package:flutter_bloc_patern/screens/drawer.dart';
import 'package:flutter_bloc_patern/screens/tasks_list.dart';
import '../blocs/bloc_exports.dart';
import 'add_task.dart';

class RecycleBin extends StatelessWidget {
  static const String id = 'Recycle-bin';
  const RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () => openBottomSheet(context),
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
                    'Deleted Tasks: ${state.removedTasks.length}',
                  ),
                ),
              ),
              TaskList(allTasks: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
