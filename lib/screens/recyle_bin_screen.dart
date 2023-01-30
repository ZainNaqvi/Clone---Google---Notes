import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'drawer_widget.dart';

class RecyleBinScreen extends StatelessWidget {
  static const id = 'recycle-bin';
  const RecyleBinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Recycle Bin'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text(
                    'Deleted tasks: 0',
                  ),
                ),
              ),
              TasksList(tasks: state.removedTasks),
            ],
          ),
        ),
      );
    });
  }
}
