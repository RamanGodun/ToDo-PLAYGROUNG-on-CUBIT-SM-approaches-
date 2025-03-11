part of 'filtered_todos_cubit.dart';

/// 📦 **[FilteredTodosStateOnCubitWithStreamSubscriptionStateShape]**
/// - Represents the state of the **FilteredTodosCubit** using **Stream Subscription-Based State Shape**.
/// - Holds the list of filtered todos and provides immutable state updates.
final class FilteredTodosStateOnCubitWithStreamSubscriptionStateShape
    extends Equatable {
  /// 🏗️ **Constructor**
  /// - Requires a list of filtered todos.
  const FilteredTodosStateOnCubitWithStreamSubscriptionStateShape({
    required this.filteredTodos,
  });

  /// 🔄 **Initial State Factory**
  /// - Returns an empty list of todos at initialization.
  factory FilteredTodosStateOnCubitWithStreamSubscriptionStateShape.initial() {
    return const FilteredTodosStateOnCubitWithStreamSubscriptionStateShape(
        filteredTodos: []);
  }

  /// 📋 **Filtered list of todos**
  final List<Todo> filteredTodos;

  /// ✅ **Equatable Implementation**
  @override
  List<Object> get props => [filteredTodos];

  /// 🖨️ **Debug-Friendly Output**
  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  /// 🔄 **CopyWith Method**
  /// - Creates a new instance with updated filtered todos.
  FilteredTodosStateOnCubitWithStreamSubscriptionStateShape copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosStateOnCubitWithStreamSubscriptionStateShape(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
