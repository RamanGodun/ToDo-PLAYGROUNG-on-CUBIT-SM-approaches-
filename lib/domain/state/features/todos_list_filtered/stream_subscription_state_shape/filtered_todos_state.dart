part of 'filtered_todos_cubit.dart';

final class FilteredTodosStateOnCubitWithStreamSubscriptionStateShape
    extends Equatable {
  const FilteredTodosStateOnCubitWithStreamSubscriptionStateShape({
    required this.filteredTodos,
  });

  factory FilteredTodosStateOnCubitWithStreamSubscriptionStateShape.initial() {
    return const FilteredTodosStateOnCubitWithStreamSubscriptionStateShape(
        filteredTodos: []);
  }

  final List<Todo> filteredTodos;

  @override
  List<Object> get props => [filteredTodos];

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  FilteredTodosStateOnCubitWithStreamSubscriptionStateShape copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosStateOnCubitWithStreamSubscriptionStateShape(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
