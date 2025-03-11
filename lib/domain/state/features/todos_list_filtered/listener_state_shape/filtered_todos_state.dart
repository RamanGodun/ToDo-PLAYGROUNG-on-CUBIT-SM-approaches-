part of 'filtered_todos_cubit.dart';

/// 📌 **[FilteredTodosStateOnCubitWithListenerStateShape]**
/// Represents the state for filtered todos when using **Listener-Based State Shape**.

/// Stores:
/// - `filteredTodos`: A list of todos that match the active filter and search term.
final class FilteredTodosStateOnCubitWithListenerStateShape extends Equatable {
  /// 🏗️ **Constructor** - Initializes with a given list of filtered todos.
  const FilteredTodosStateOnCubitWithListenerStateShape({
    required this.filteredTodos,
  });

  /// 🔄 **Returns an initial empty state.**
  factory FilteredTodosStateOnCubitWithListenerStateShape.initial() {
    return const FilteredTodosStateOnCubitWithListenerStateShape(
        filteredTodos: []);
  }

  /// 📋 The list of todos after filtering.
  final List<Todo> filteredTodos;

  /// ✅ **Equatable Override** - Ensures state comparison works correctly.
  @override
  List<Object> get props => [filteredTodos];

  /// 🖨️ **Readable Debug Output**
  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  /// 🔄 **Creates a copy of the current state with optional modifications.**
  FilteredTodosStateOnCubitWithListenerStateShape copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosStateOnCubitWithListenerStateShape(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
