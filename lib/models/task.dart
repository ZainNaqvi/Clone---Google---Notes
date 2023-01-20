import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDeleted;
  bool? isDone;
  Task({
    required this.title,
    this.isDeleted,
    this.isDone,
  }) {
    isDeleted = isDeleted ?? false;
    isDone = isDone ?? false;
  }

  Task copyWith({
    String? title,
    bool? isDeleted,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDeleted': isDeleted,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [title, isDeleted, isDone];
}
