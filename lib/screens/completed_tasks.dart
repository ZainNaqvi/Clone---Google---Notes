import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/screens/drawer.dart';
import 'package:flutter_bloc_patern/screens/tasks_list.dart';
import '../blocs/bloc_exports.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key}) : super(key: key);

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
                    '${state.completedTasks.length} Tasks:',
                  ),
                ),
              ),
              TaskList(allTasks: state.completedTasks),
            ],
          ),
        );
      },
    );
  }
}
