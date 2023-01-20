import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/blocs/bloc_exports.dart';
import 'package:flutter_bloc_patern/models/task.dart';
import 'screens/tasks_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(
          AddTask(task: Task(title: "Title")),
        ),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
