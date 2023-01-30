import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/screens/tasks_screen.dart';
import 'package:flutter_bloc_patern/services/app_routes.dart';
import 'blocs/bloc_exports.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        initialRoute: '/',
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
