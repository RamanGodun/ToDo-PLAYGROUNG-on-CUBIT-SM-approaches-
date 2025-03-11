import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/enums.dart';
import '../../../../models/todo_model.dart';
import '../../todo_filter/todo_filter_cubit.dart';
import '../../todos_list/todo_list_cubit.dart';
import '../../todo_search/todo_search_cubit.dart';

part 'filtered_todos_state.dart';

/// 📦 **[FilteredTodosCubitWithStreamSubscriptionStateShape]**
/// - Manages filtered todos using **Stream Subscription-Based State Shape**.
/// - Listens to changes in **TodoList**, **TodoFilter**, and **TodoSearch** cubits.
/// - Emits a new filtered state whenever there's a relevant change.
class FilteredTodosCubitWithStreamSubscriptionStateShape
    extends Cubit<FilteredTodosStateOnCubitWithStreamSubscriptionStateShape> {
  /// 🟢 **Stream Subscriptions**
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;

  /// 📋 **Dependencies**
  final List<Todo> initialTodos;
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;

  /// 🏗️ **Constructor**
  /// - Initializes with provided dependencies.
  /// - Subscribes to **filter**, **search**, and **todo list** state changes.
  FilteredTodosCubitWithStreamSubscriptionStateShape({
    required this.initialTodos,
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
  }) : super(
          FilteredTodosStateOnCubitWithStreamSubscriptionStateShape(
              filteredTodos: initialTodos),
        ) {
    /// 📡 **Listening for changes in filter, search term, and todos**
    todoFilterSubscription =
        todoFilterCubit.stream.listen((_) => setFilteredTodos());
    todoSearchSubscription =
        todoSearchCubit.stream.listen((_) => setFilteredTodos());
    todoListSubscription =
        todoListCubit.stream.listen((_) => setFilteredTodos());
  }

  /// 🔍 **Filters todos based on the selected filter & search term.**
  void setFilteredTodos() {
    List<Todo> filteredTodos;

    // 🏷️ **Apply filter (All, Active, Completed)**
    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos =
            todoListCubit.state.todos.where((todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        filteredTodos =
            todoListCubit.state.todos.where((todo) => todo.completed).toList();
        break;
      case Filter.all:
        filteredTodos = todoListCubit.state.todos;
        break;
    }

    // 🔍 **Apply search term filtering**
    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      final searchTerm = todoSearchCubit.state.searchTerm.toLowerCase();
      filteredTodos = filteredTodos
          .where((todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }

    // 🔄 **Emit new filtered state**
    emit(state.copyWith(filteredTodos: filteredTodos));
  }

  /// 🛑 **Close all stream subscriptions when the cubit is disposed.**
  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
