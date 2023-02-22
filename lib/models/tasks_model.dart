import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final String date;
  bool? isDeleted;
  bool? isDone;
  bool? isFavourite;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isDeleted,
    this.isDone,
    this.isFavourite,
  }) {
    isDeleted = isDeleted ?? false;
    isDone = isDone ?? false;
    isFavourite = isFavourite ?? false;
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    bool? isDeleted,
    bool? isDone,
    bool? isFavourite,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'isDeleted': isDeleted,
      'isDone': isDone,
      'isFavourite': isFavourite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isFavourite:
          map['isFavourite'] != null ? map['isFavourite'] as bool : null,
    );
  }

  @override
  List<Object?> get props =>
      [id, title, description, date, isDeleted, isDone, isFavourite];
}
