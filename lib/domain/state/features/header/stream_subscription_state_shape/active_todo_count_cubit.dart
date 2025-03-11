import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/todo_model.dart';
import '../../todos_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubitWithUsingStreamSubscriptionStateShape extends Cubit<
    ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape> {
  late final StreamSubscription todoListSubscription;

  final TodoListCubit todoListCubit;

  ActiveTodoCountCubitWithUsingStreamSubscriptionStateShape({
    required this.todoListCubit,
  }) : super(
          ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape(
              activeTodoCount: _calculateInitialActiveTodos(todoListCubit)),
        ) {
    // 📡 Підписка на зміни у TodoListCubit
    todoListSubscription =
        todoListCubit.stream.listen((TodoListStateOnCubit todoListState) {
      print('todoListState: $todoListState');

      final int currentActiveTodoCount = _calculateActiveTodos(todoListState);

      // 🚦 Перевірка перед оновленням стану
      if (currentActiveTodoCount != state.activeTodoCount) {
        emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
      }
    });
  }

  // 📊 Метод для розрахунку кількості активних тудушок на старті
  static int _calculateInitialActiveTodos(TodoListCubit todoListCubit) {
    return _calculateActiveTodos(todoListCubit.state);
  }

  // 📈 Метод для розрахунку активних тудушок
  static int _calculateActiveTodos(TodoListStateOnCubit todoListState) {
    return todoListState.todos.where((Todo todo) => !todo.completed).length;
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
