import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_patern/models/tasks_model.dart';

import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> allTasks = List.from(state.pendingTasks)..add(task);
    emit(TasksState(
      pendingTasks: allTasks,
      removedTasks: state.removedTasks,
      completedTasks: state.completedTasks,
      favouriteTasks: state.favouriteTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favouriteTasks: state.favouriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> removedTasks = List.from(state.removedTasks)..remove(task);
    emit(TasksState(
      pendingTasks: state.pendingTasks,
      completedTasks: state.completedTasks,
      favouriteTasks: state.favouriteTasks,
      removedTasks: removedTasks,
    ));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> removedTasks = List.from(state.removedTasks)
      ..add(task.copyWith(isDeleted: true));
    List<Task> pendingTasks = List.from(state.pendingTasks)..remove(task);

    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: state.completedTasks,
      favouriteTasks: state.favouriteTasks,
      removedTasks: removedTasks,
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
