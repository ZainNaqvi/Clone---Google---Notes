import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/screens/recycle_bin.dart';
import 'package:flutter_bloc_patern/screens/tabs_screen.dart';
import 'package:flutter_bloc_patern/services/app_pages.dart';

import '../blocs/bloc_exports.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey
                      : Colors.white,
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  height: 54,
                  child: Text(
                    "Todo's App",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.INITIAL,
                  ),
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text(
                    '${state.pendingTasks.length} | ${state.completedTasks.length} ',
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.RECYCLE_BIN,
                  ),
                  leading: const Icon(Icons.delete),
                  title: const Text('Recycle Bin'),
                  trailing: Text(state.removedTasks.length.toString()),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(
                        value: state.switchValue,
                        onChanged: (value) {
                          value
                              ? context.read<SwitchBloc>().add(SwitchOnEvent())
                              : context
                                  .read<SwitchBloc>()
                                  .add(SwitchOffEvent());
                        });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
