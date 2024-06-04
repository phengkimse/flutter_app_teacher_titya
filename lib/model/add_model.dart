// models/task.dart
class Task {
  final int? id;
  final String title;
  final String dateTime;
  final String priority;

  Task({this.id, required this.title, required this.dateTime, required this.priority});

  // Convert a Task into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime,
      'priority': priority,
    };
  }

  // Convert a Map into a Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      dateTime: map['dateTime'],
      priority: map['priority'],
    );
  }
}
