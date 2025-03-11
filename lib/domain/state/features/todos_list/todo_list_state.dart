part of 'todo_list_cubit.dart';

/// 📌 **State class for `TodoListCubit`**
///
/// Stores the **current list of ToDos**.
final class TodoListStateOnCubit extends Equatable {
  /// 🏗️ **Constructor**
  const TodoListStateOnCubit({required this.todos});

  /// 🔄 **Initial state** → Predefined ToDos for new users.
  factory TodoListStateOnCubit.initial() {
    return TodoListStateOnCubit(todos: [
      Todo(id: '1', desc: 'Clean the room'),
      Todo(id: '2', desc: 'Wash the dishes'),
      Todo(id: '3', desc: 'Do homework'),
    ]);
  }

  /// 📋 **List of ToDos**
  final List<Todo> todos;

  /// ✅ **Equatable props** → Prevents unnecessary rebuilds.
  @override
  List<Object> get props => [todos];

  /// 📝 **Debugging string**
  @override
  String toString() => 'TodoListState(todos: $todos)';

  /// 🆕 **Creates a new state with an updated list of ToDos**
  TodoListStateOnCubit copyWith({List<Todo>? todos}) {
    return TodoListStateOnCubit(
      todos: todos ?? this.todos,
    );
  }
}
