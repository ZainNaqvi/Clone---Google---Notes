import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/screens/drawer.dart';
import 'package:flutter_bloc_patern/screens/tasks_list.dart';
import '../blocs/bloc_exports.dart';

class PendingTasks extends StatelessWidget {
  const PendingTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const DrawerWidget(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.pendingTasks.length} Tasks:',
                  ),
                ),
              ),
              TaskList(allTasks: state.pendingTasks),
            ],
          ),
        );
      },
    );
  }
}
