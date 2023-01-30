import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc_patern/blocs/bloc_exports.dart';
import 'package:flutter_bloc_patern/screens/recyle_bin_screen.dart';
import 'package:flutter_bloc_patern/screens/tasks_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                "Drawer",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () => Navigator.pushNamed(context, TasksScreen.id),
                  leading: const Icon(Icons.create_new_folder),
                  trailing: Text(state.allTasks.length.toString()),
                  title: const Text("My Tasks"),
                );
              },
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () => Navigator.pushNamed(context, RecyleBinScreen.id),
                  leading: const Icon(Icons.delete),
                  trailing: Text(state.removedTasks.length.toString()),
                  title: const Text("Recyle Bin"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
