part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;
  const TasksState({
    this.allTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks, removedTasks];
}
