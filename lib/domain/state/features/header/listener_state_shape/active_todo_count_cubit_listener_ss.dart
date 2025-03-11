import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/todo_model.dart';
import '../../todos_list/todo_list_cubit.dart';

part 'active_todo_count_state_listener_ss.dart';

class ActiveTodoCountCubitWithUsingListenerStateShape
    extends Cubit<ActiveTodoCountStateOnCubitWithUsingListenerStateShape> {
  final TodoListCubit todoListCubit;

  ActiveTodoCountCubitWithUsingListenerStateShape({
    required this.todoListCubit,
  }) : super(
          ActiveTodoCountStateOnCubitWithUsingListenerStateShape(
            activeTodoCount: _calculateInitialActiveTodos(todoListCubit),
          ),
        );

  // 📊 Метод для розрахунку кількості активних тудушок на старті
  static int _calculateInitialActiveTodos(TodoListCubit todoListCubit) {
    return todoListCubit.state.todos
        .where((Todo todo) => !todo.completed)
        .length;
  }

  // 🧮 Метод для розрахунку активних тудушок та оновлення стану
  void calculateActiveTodoCount() {
    final int activeTodoCount =
        todoListCubit.state.todos.where((Todo todo) => !todo.completed).length;

    if (activeTodoCount != state.activeTodoCount) {
      emit(state.copyWith(activeTodoCount: activeTodoCount));
    }
  }
}
