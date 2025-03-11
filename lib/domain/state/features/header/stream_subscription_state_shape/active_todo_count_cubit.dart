import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/todo_model.dart';
import '../../todos_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

/// 📡 **Cubit for Active ToDos Count (Stream Subscription State Shape)**
/// This cubit listens to **[TodoListCubit]** updates via stream subscription and
/// dynamically updates the active (uncompleted) todos count.
class ActiveTodoCountCubitWithUsingStreamSubscriptionStateShape extends Cubit<
    ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape> {
  late final StreamSubscription<TodoListStateOnCubit> _todoListSubscription;

  final TodoListCubit todoListCubit;

  /// 🏗️ **Constructor**
  ActiveTodoCountCubitWithUsingStreamSubscriptionStateShape({
    required this.todoListCubit,
  }) : super(
          ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape(
            activeTodoCount: _calculateActiveTodos(todoListCubit.state),
          ),
        ) {
    // 📡 Subscribing to `TodoListCubit` state changes
    _todoListSubscription =
        todoListCubit.stream.listen(_onTodoListStateChanged);
  }

  /// 🔄 **Handles state changes from `TodoListCubit`**
  void _onTodoListStateChanged(TodoListStateOnCubit todoListState) {
    final int currentActiveTodoCount = _calculateActiveTodos(todoListState);

    // 🚦 Prevent unnecessary state emissions
    if (currentActiveTodoCount != state.activeTodoCount) {
      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    }
  }

  /// 📊 **Calculates active ToDos count**
  static int _calculateActiveTodos(TodoListStateOnCubit todoListState) {
    return todoListState.todos.where((Todo todo) => !todo.completed).length;
  }

  /// 🛑 **Cleanup on disposal**
  @override
  Future<void> close() {
    _todoListSubscription.cancel();
    return super.close();
  }
}
