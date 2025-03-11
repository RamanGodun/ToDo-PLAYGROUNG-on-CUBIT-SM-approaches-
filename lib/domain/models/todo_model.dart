import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';



Uuid uuid = const Uuid();

class Todo extends Equatable {
  Todo({
    String? id,
    required this.desc,
    this.completed = false,
  }) : id = id ?? uuid.v4();

  final String id;
  final String desc;
  final bool completed;

  @override
  List<Object> get props => [id, desc, completed];

  @override
  String toString() => 'Todo(id: $id, desc: $desc, completed: $completed)';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'desc': desc,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      desc: map['desc'] as String,
      completed: map['completed'] as bool,
    );
  }
}
