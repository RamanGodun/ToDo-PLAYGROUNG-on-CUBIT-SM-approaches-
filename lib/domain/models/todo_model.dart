import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

/// 📌 **Global UUID Generator** for unique `Todo` IDs.
final Uuid _uuid = const Uuid();

/// 📝 **[Todo]** - Represents a single task in the ToDo app.
/// **Supports:** Serialization (`toMap` / `fromMap`), immutability, and deep comparison with `Equatable`.
class Todo extends Equatable {
  /// If no `id` is provided, a new UUID will be generated automatically.
  Todo({
    String? id,
    required this.desc,
    this.completed = false,
  }) : id = id ?? _uuid.v4();

  final String id;
  final String desc;
  final bool completed;

  /// ⚡ **Equatable Implementation** → Enables deep equality checks.
  @override
  List<Object> get props => [id, desc, completed];

  /// 🖨️ **Readable Debug Output**
  @override
  String toString() => 'Todo(id: $id, desc: "$desc", completed: $completed)';

  /// 🔄 **Convert to JSON-like Map**
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'desc': desc,
      'completed': completed,
    };
  }

  /// 🏗️ **Create a `Todo` object from a Map**
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      desc: map['desc'] as String,
      completed: map['completed'] as bool,
    );
  }

  /// ✏️ **Creates a copy of the current `Todo` with optional updates.**
  /// If a parameter is not provided, it retains its original value.
  Todo copyWith({
    String? id,
    String? desc,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      completed: completed ?? this.completed,
    );
  }
}
