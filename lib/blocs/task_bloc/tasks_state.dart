part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favouriteTasks;
  final List<Task> removedTasks;
  const TasksState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favouriteTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props =>
      [pendingTasks, completedTasks, favouriteTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favouriteTasks': favouriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: List<Task>.from(
        (map['pendingTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      completedTasks: List<Task>.from(
        (map['completedTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      favouriteTasks: List<Task>.from(
        (map['favouriteTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedTasks: List<Task>.from(
        (map['removedTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
