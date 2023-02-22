import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/blocs/bloc_exports.dart';
import 'package:flutter_bloc_patern/screens/tabs_screen.dart';
import 'package:flutter_bloc_patern/services/route_generator.dart';
import 'package:flutter_bloc_patern/services/themes_services.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            darkTheme: Themes.dark,
            themeMode: state.switchValue ? ThemeMode.dark : ThemeMode.light,
            title: 'Flutter Tasks App',
            theme: Themes.light,
            onGenerateRoute: appRouter.onGenerateRoute,
            home: const TabsScreen(),
          );
        },
      ),
    );
  }
}
