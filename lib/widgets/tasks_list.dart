import 'package:flutter/cupertino.dart';
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: tasks[index].isDone,
                onChanged: (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: tasks[index]));
                },
              ),
              IconButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure!"),
                      content: const Text("You want to delete?"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: const Text("Delete"),
                          onPressed: () {
                            context
                                .read<TasksBloc>()
                                .add(DeleteTask(task: tasks[index]));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
        itemCount: tasks.length,
      ),
    );
  }
}
