import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/todo_model.dart';

part 'todo_list_state.dart';

/// 📌 **[TodoListCubit]** - Manages the state of the ToDo list.
///
/// 🗂 **Features:**
/// - Adds, edits, toggles, and removes ToDo items.
/// - Uses **HydratedBloc** to persist state between app restarts.
class TodoListCubit extends HydratedCubit<TodoListStateOnCubit> {
  /// 🏗️ **Constructor** → Initializes with persisted or default state.
  TodoListCubit() : super(TodoListStateOnCubit.initial());

  /// ➕ **Adds a new ToDo item** to the list.
  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final updatedTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: updatedTodos));
  }

  /// ✏️ **Edits an existing ToDo item.**
  ///
  /// If the ToDo **ID matches**, updates the description.
  void editTodo(String id, String todoDesc) {
    final updatedTodos = state.todos.map((todo) {
      return todo.id == id ? todo.copyWith(desc: todoDesc) : todo;
    }).toList();

    emit(state.copyWith(todos: updatedTodos));
  }

  /// ✅ **Toggles a ToDo's completion status.**
  void toggleTodo(String id) {
    final updatedTodos = state.todos.map((todo) {
      return todo.id == id ? todo.copyWith(completed: !todo.completed) : todo;
    }).toList();

    emit(state.copyWith(todos: updatedTodos));
  }

  /// ❌ **Removes a ToDo from the list.**
  void removeTodo(Todo todo) {
    final updatedTodos = state.todos.where((t) => t.id != todo.id).toList();
    emit(state.copyWith(todos: updatedTodos));
  }

  /// 🔄 **Persists state by converting it to JSON.**
  @override
  Map<String, dynamic>? toJson(TodoListStateOnCubit state) {
    try {
      return {'todos': state.todos.map((todo) => todo.toMap()).toList()};
    } catch (_) {
      return null;
    }
  }

  /// 🔄 **Restores state from JSON.**
  @override
  TodoListStateOnCubit? fromJson(Map<String, dynamic> json) {
    try {
      final todos = (json['todos'] as List<dynamic>?)
          ?.map((e) => Todo.fromMap(e as Map<String, dynamic>))
          .whereType<Todo>()
          .toList();

      return todos != null && todos.isNotEmpty
          ? TodoListStateOnCubit(todos: todos)
          : TodoListStateOnCubit.initial();
    } catch (_) {
      return TodoListStateOnCubit.initial();
    }
  }
}
