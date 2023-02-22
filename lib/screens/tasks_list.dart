import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.allTasks,
  }) : super(key: key);
  final List<Task> allTasks;

  void removeTask({required BuildContext ctx, required Task task}) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: allTasks.length,
        itemBuilder: (context, index) {
          Task task = allTasks[index];
          return ListTile(
            onLongPress: () => removeTask(ctx: context, task: task),
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone! ? TextDecoration.lineThrough : null,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) => task.isDeleted!
                  ? null
                  : context.read<TasksBloc>().add(
                        UpdateTask(task: task),
                      ),
            ),
          );
        },
      ),
    );
  }
}
