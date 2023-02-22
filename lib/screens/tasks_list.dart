import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';

// ignore: must_be_immutable
class TaskList extends StatelessWidget {
  TaskList({
    Key? key,
    required this.allTasks,
  }) : super(key: key);
  final List<Task> allTasks;

  void removeTask({required BuildContext ctx, required Task task}) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          elevation: 0,
          children: allTasks
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isExpanded) => ListTile(
                    leading: Icon(
                        task.isFavourite! ? Icons.star : Icons.star_outline),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat()
                          .add_yMMMd()
                          .add_Hm()
                          .format(DateTime.parse(task.date))
                          .toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: task.isDone,
                          onChanged: (value) => task.isDeleted!
                              ? null
                              : context.read<TasksBloc>().add(
                                    UpdateTask(task: task),
                                  ),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (String value) {
                            if (value == 'Delete') {
                              context
                                  .read<TasksBloc>()
                                  .add(DeleteTask(task: task));
                            }
                          },
                          itemBuilder: (BuildContext buildContext) {
                            return !task.isDeleted!
                                ? [
                                    PopupMenuItem<String>(
                                      onTap: () {},
                                      value: 'Edit',
                                      child: Row(
                                        children: const [
                                          Icon(Icons.edit),
                                          SizedBox(width: 8),
                                          Text('Edit'),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<String>(
                                      onTap: () {
                                        context.read<TasksBloc>().add(
                                            AddAndRemoveBookmark(task: task));
                                      },
                                      value: 'Add to Bookmarks',
                                      child: Row(
                                        children: [
                                          Icon(
                                            task.isFavourite!
                                                ? Icons.star
                                                : Icons.star_outline,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(task.isFavourite!
                                              ? 'Remove Bookmarks'
                                              : 'Add to Bookmarks'),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<String>(
                                      onTap: () {
                                        context
                                            .read<TasksBloc>()
                                            .add(RemoveTask(task: task));
                                      },
                                      value: 'Remove Task',
                                      child: Row(
                                        children: const [
                                          Icon(Icons.delete),
                                          SizedBox(width: 8),
                                          Text('Remove Task'),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Cancel',
                                      child: Row(
                                        children: const [
                                          Icon(Icons.cancel),
                                          SizedBox(width: 8),
                                          Text('Cancel'),
                                        ],
                                      ),
                                    ),
                                  ]
                                : recycleChoices.map((choice) {
                                    return PopupMenuItem<String>(
                                      value: choice["title"].toString(),
                                      child: Row(
                                        children: [
                                          Icon(choice['icon'] as IconData),
                                          const SizedBox(width: 8),
                                          Text(choice['title'].toString())
                                        ],
                                      ),
                                    );
                                  }).toList();
                          },
                        )
                      ],
                    ),
                  ),
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(
                        text: "Title\n",
                        children: [
                          TextSpan(
                            text: task.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const TextSpan(
                            text: "\n\nDescription\n",
                          ),
                          TextSpan(
                            text: task.description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  var recycleChoices = [
    {'title': 'Restore', 'icon': Icons.restore},
    {'title': 'Delete', 'icon': Icons.delete},
    {'title': 'Cancel', 'icon': Icons.cancel},
  ];
}
