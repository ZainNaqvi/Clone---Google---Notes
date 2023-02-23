import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/screens/recycle_bin.dart';
import 'package:flutter_bloc_patern/screens/tabs_screen.dart';

import '../blocs/bloc_exports.dart';

class AppPages {
  static RouteObserver<Route> observer = RouteObserver();
  // ignore: non_constant_identifier_names
  static List<PageEntity> Routes() {
    return [
      PageEntity(
        path: AppRoutes.INITIAL,
        page: const TabsScreen(),
        bloc: BlocProvider(create: (_) => TasksBloc()),
      ),
      PageEntity(
        path: AppRoutes.INITIAL,
        page: const TabsScreen(),
        bloc: BlocProvider(create: (_) => SwitchBloc()),
      ),
    ];
  }

  static List<dynamic> Blocer(BuildContext context) {
    List<dynamic> blocerList = <dynamic>[];
    for (var blocer in Routes()) {
      blocerList.add(blocer.bloc);
    }
    return blocerList;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.INITIAL:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      case AppRoutes.RECYCLE_BIN:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}

class AppRoutes {
  static const String INITIAL = '/';
  static const String RECYCLE_BIN = '/recycle-bin';
}

class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;

  PageEntity({required this.bloc, required this.page, required this.path});
}
