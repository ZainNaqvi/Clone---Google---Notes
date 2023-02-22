import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/blocs/bloc_exports.dart';
import '../models/tasks_model.dart';
import '../services/generate_unique_ids.dart';

Future<dynamic> openBottomSheet(BuildContext context) {
  final TextEditingController _titleController = TextEditingController();
  return showModalBottomSheet(
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
              padding: const EdgeInsets.only(top: 8),
              child: TextFormField(
                controller: _titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
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
                    print(uniqueKey);
                    context.read<TasksBloc>().add(
                          AddTask(
                            task: Task(
                              id: uniqueKey,
                              title: _titleController.text,
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
