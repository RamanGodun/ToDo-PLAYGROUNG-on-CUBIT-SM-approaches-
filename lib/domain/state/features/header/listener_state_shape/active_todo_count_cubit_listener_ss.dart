import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/todo_model.dart';
import '../../todos_list/todo_list_cubit.dart';

part 'active_todo_count_state_listener_ss.dart';

/// 📊 **[ActiveTodoCountCubitWithUsingListenerStateShape]**
/// Manages the count of **active (uncompleted) ToDos**.
/// This cubit **listens** to changes in **[TodoListCubit]** and updates the count accordingly.
class ActiveTodoCountCubitWithUsingListenerStateShape
    extends Cubit<ActiveTodoCountStateOnCubitWithUsingListenerStateShape> {
  final TodoListCubit todoListCubit;

  /// 🏗️ **Constructor**
  ActiveTodoCountCubitWithUsingListenerStateShape({
    required this.todoListCubit,
  }) : super(
          ActiveTodoCountStateOnCubitWithUsingListenerStateShape(
            activeTodoCount: _calculateInitialActiveTodos(todoListCubit),
          ),
        );

  /// 🔢 **Initial Active ToDo Count Calculation**
  /// Filters out completed ToDos and returns the count of active ones.
  static int _calculateInitialActiveTodos(TodoListCubit todoListCubit) {
    return todoListCubit.state.todos
        .where((Todo todo) => !todo.completed)
        .length;
  }

  /// 🔄 **Recalculates the active ToDos count and updates the state.**
  void calculateActiveTodoCount() {
    final int activeTodoCount =
        todoListCubit.state.todos.where((Todo todo) => !todo.completed).length;

    if (activeTodoCount != state.activeTodoCount) {
      emit(state.copyWith(activeTodoCount: activeTodoCount));
    }
  }
}
