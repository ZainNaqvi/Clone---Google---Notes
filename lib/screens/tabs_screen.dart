import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/screens/completed_tasks.dart';
import 'package:flutter_bloc_patern/screens/favourite_tasks.dart';
import 'package:flutter_bloc_patern/screens/pending_tasks.dart';
import 'add_task.dart';
import 'drawer.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'tabs-screen';
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List listOfWidgets = [
    {'pageName': const PendingTasks(), 'title': "Pending Tasks"},
    {'pageName': const CompletedTasks(), 'title': "Completed Tasks"},
    {'pageName': const FavouriteTasks(), 'title': "Favourite Tasks"},
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text(listOfWidgets[currentIndex]['title']),
        actions: currentIndex != 0
            ? null
            : [
                IconButton(
                  onPressed: () => openBottomSheet(context),
                  icon: const Icon(Icons.add),
                ),
              ],
      ),
      body: listOfWidgets[currentIndex]['pageName'],
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey
                  : Colors.blue,
              onPressed: () => openBottomSheet(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Pending - Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: "Completed - Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite - Tasks"),
        ],
      ),
    );
  }
}
