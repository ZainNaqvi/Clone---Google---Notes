import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patern/blocs/bloc/tasks_bloc.dart';

import '../models/tasks_model.dart';
import 'generate_ids.dart';

void showModalBox(BuildContext context) {
  TextEditingController titleController = TextEditingController();
  showModalBottomSheet(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  helperMaxLines: 3,
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var task = Task(
                        title: titleController.text,
                        id: GUIDGen.generate(),
                      );
                      context.read<TasksBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: const Text("Add"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
