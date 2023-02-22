import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/blocs/bloc_exports.dart';
import '../models/tasks_model.dart';
import '../services/generate_unique_ids.dart';

Future<dynamic> openBottomSheet(BuildContext context) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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
              "Add Task",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextFormField(
                controller: titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextFormField(
              controller: descriptionController,
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
                    String uniqueKey = generateRandomKey();
                    context.read<TasksBloc>().add(
                          AddTask(
                            task: Task(
                              id: uniqueKey,
                              title: titleController.text,
                              description: descriptionController.text,
                              date: DateTime.now().toString(),
                            ),
                          ),
                        );
                    Navigator.pop(context);
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
