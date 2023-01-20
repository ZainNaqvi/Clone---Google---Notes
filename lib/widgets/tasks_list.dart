import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key, required this.tasks}) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
          leading: Text(tasks[index].title),
          trailing: Checkbox(
            value: tasks[index].isDone,
            onChanged: (value) {
              context.read<TasksBloc>().add(UpdateTask(task: tasks[index]));
            },
          ),
        ),
        itemCount: tasks.length,
      ),
    );
  }
}
