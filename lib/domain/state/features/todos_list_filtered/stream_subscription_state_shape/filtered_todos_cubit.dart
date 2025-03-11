import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/enums.dart';
import '../../../../models/todo_model.dart';
import '../../todo_filter/todo_filter_cubit.dart';
import '../../todos_list/todo_list_cubit.dart';
import '../../todo_search/todo_search_cubit.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubitWithStreamSubscriptionStateShape
    extends Cubit<FilteredTodosStateOnCubitWithStreamSubscriptionStateShape> {
  late StreamSubscription todoFilterSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;

  final List<Todo> initialTodos;

  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;

  FilteredTodosCubitWithStreamSubscriptionStateShape({
    required this.initialTodos,
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
  }) : super(FilteredTodosStateOnCubitWithStreamSubscriptionStateShape(
            filteredTodos: initialTodos)) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterStateOnCubit todoFilterState) {
      setFilteredTodos();
    });

    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchStateOnCubit todoSearchState) {
      setFilteredTodos();
    });

    todoListSubscription =
        todoListCubit.stream.listen((TodoListStateOnCubit todoListState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<Todo> filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => todo.completed)
            .toList();
        break;
      case Filter.all:
        filteredTodos = todoListCubit.state.todos;
        break;
    }

    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(filteredTodos: filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
