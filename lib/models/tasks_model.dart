import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDeleted;
  bool? isDone;
  final String id;

  Task({
    required this.title,
    this.isDeleted,
    this.isDone,
    required this.id,
  }) {
    isDeleted = isDeleted ?? false;
    isDone = isDone ?? false;
  }

  Task copyWith({
    String? title,
    bool? isDeleted,
    bool? isDone,
    String? id,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [title, isDeleted, isDone, id];
}
