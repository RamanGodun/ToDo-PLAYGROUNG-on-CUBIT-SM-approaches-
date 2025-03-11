import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends HydratedCubit<TodoListStateOnCubit> {
  TodoListCubit() : super(TodoListStateOnCubit.initial());

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todoDesc,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todo.desc,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(Todo todo) {
    final newTodos = state.todos.where((Todo t) => t.id != todo.id).toList();

    emit(state.copyWith(todos: newTodos));
  }

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

  @override
  Map<String, dynamic>? toJson(TodoListStateOnCubit state) {
    try {
      return {'todos': state.todos.map((e) => e.toMap()).toList()};
    } catch (_) {
      return null;
    }
  }
}
