import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/enums.dart';
import '../../../../models/todo_model.dart';

part 'filtered_todos_state.dart';

/// 📌 **[FilteredTodosCubitWithListenerStateShape]**
/// Manages the filtered list of todos based on:
/// - Selected filter type (**All / Active / Completed**)
/// - Search term for filtering todos by description.

/// Uses **Listener-Based State Shape** for reactivity.
class FilteredTodosCubitWithListenerStateShape
    extends Cubit<FilteredTodosStateOnCubitWithListenerStateShape> {
  /// 🗂️ Initial list of todos (retrieved from `TodoListCubit`).
  final List<Todo> initialTodos;

  /// 🏗️ **Constructor** initializes with all todos.
  FilteredTodosCubitWithListenerStateShape({
    required this.initialTodos,
  }) : super(FilteredTodosStateOnCubitWithListenerStateShape(
          filteredTodos: initialTodos,
        ));

  /// 🎯 **Filters todos based on the given criteria.**
  /// - `filter`: Determines which todos to display (**All, Active, Completed**).
  /// - `todos`: The full list of todos from `TodoListCubit`.
  /// - `searchTerm`: Filters todos whose description contains this term.

  /// Emits a new filtered list as state.
  void setFilteredTodos(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> filteredTodos;

    // 🔄 Apply the selected filter type
    switch (filter) {
      case Filter.active:
        filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        filteredTodos = todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
        filteredTodos = todos;
        break;
    }

    // 🔍 Apply search filtering if a search term is provided
    if (searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }

    // 🚀 Emit the new filtered list of todos
    emit(state.copyWith(filteredTodos: filteredTodos));
  }
}
