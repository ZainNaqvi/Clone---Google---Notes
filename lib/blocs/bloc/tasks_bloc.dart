import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_patern/models/tasks_model.dart';

import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> allTasks = List.from(state.allTasks)..add(event.task);

    emit(TasksState(allTasks: allTasks, removedTasks: state.removedTasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    int index = List.from(state.allTasks).indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks, removedTasks: state.removedTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> removeTasks = List.from(state.removedTasks)..remove(task);

    emit(TasksState(allTasks: state.allTasks, removedTasks: removeTasks));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> removedTasks = List.from(state.removedTasks)
      ..add(event.task.copyWith(isDeleted: true));
    List<Task> allTasks = List.from(state.allTasks)..remove(task);

    emit(TasksState(allTasks: allTasks, removedTasks: removedTasks));
  }
}
