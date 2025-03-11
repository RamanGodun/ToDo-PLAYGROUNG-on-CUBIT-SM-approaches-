import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/enums.dart';
import '../../../../models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubitWithListenerStateShape
    extends Cubit<FilteredTodosStateOnCubitWithListenerStateShape> {
  final List<Todo> initialTodos;

  FilteredTodosCubitWithListenerStateShape({
    required this.initialTodos,
  }) : super(FilteredTodosStateOnCubitWithListenerStateShape(
            filteredTodos: initialTodos));

  void setFilteredTodos(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> filteredTodos;

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

    if (searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(filteredTodos: filteredTodos));
  }
}
