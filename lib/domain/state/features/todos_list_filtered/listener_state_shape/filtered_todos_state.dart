part of 'filtered_todos_cubit.dart';

final class FilteredTodosStateOnCubitWithListenerStateShape extends Equatable {
  const FilteredTodosStateOnCubitWithListenerStateShape({
    required this.filteredTodos,
  });

  factory FilteredTodosStateOnCubitWithListenerStateShape.initial() {
    return const FilteredTodosStateOnCubitWithListenerStateShape(
        filteredTodos: []);
  }

  final List<Todo> filteredTodos;

  @override
  List<Object> get props => [filteredTodos];

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  FilteredTodosStateOnCubitWithListenerStateShape copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosStateOnCubitWithListenerStateShape(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
