import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/blocs/bloc_exports.dart';
import 'package:flutter_bloc_patern/services/app_pages.dart';
import 'package:flutter_bloc_patern/services/themes_services.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.Blocer(context)],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            darkTheme: Themes.dark,
            themeMode: state.switchValue ? ThemeMode.dark : ThemeMode.light,
            title: 'Flutter Tasks App',
            theme: Themes.light,
            onGenerateRoute: AppPages.onGenerateRoute,
            initialRoute: AppRoutes.INITIAL,
          );
        },
      ),
    );
  }
}
