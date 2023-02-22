import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/blocs/bloc_exports.dart';
import '../models/tasks_model.dart';

Future<void> editTaskBottomSheet(BuildContext context, Task task) {
  print("Dfdfdsa");
  final TextEditingController oldTitle =
      TextEditingController(text: task.title);
  final TextEditingController oldDescription =
      TextEditingController(text: task.description);
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 12,
          left: 12,
          top: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Edit Task",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextFormField(
                controller: oldTitle,
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextFormField(
              controller: oldDescription,
              autofocus: true,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<TasksBloc>().add(
                          EditTask(
                            oldTask: task,
                            updatedTask: Task(
                              id: task.id,
                              title: oldTitle.text,
                              description: oldDescription.text,
                              date: DateTime.now().toString(),
                              isFavourite: task.isFavourite,
                              isDone: false,
                            ),
                          ),
                        );
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
