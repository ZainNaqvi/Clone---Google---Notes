import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key, required this.tasks}) : super(key: key);

  final List<Task> tasks;
  void removeTask({required BuildContext ctx, required Task task}) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
    Navigator.pop(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return ListTile(
            leading: SizedBox(
              width: 272,
              child: Text(
                tasks[index].title,
                style: TextStyle(
                  decoration: task.isDone! ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: task.isDone,
                  onChanged: task.isDeleted == false
                      ? (value) {
                          context.read<TasksBloc>().add(UpdateTask(task: task));
                        }
                      : null,
                ),
                IconButton(
                  onPressed: () async {
                    await showCupertinoDialog(
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
                            onPressed: () =>
                                removeTask(ctx: context, task: task),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
