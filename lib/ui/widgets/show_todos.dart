import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_2ss_playground/domain/app_constants/app_constants.dart';
import '../../domain/models/todo_model.dart';
import '../../domain/state/app_settings/app_settings_cubit.dart';
import '../../domain/utils_and_services/cubits_export.dart';
import 'todo_item.dart';

/// 📦 [ShowTodosWidget] dynamically selects the appropriate Todo list widget
/// based on the current **State Shape** (ListenerStateShape / StreamSubscriptionStateShape).
class ShowTodosWidget extends StatelessWidget {
  const ShowTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isListenerBasedStateShape = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingListenerStateShapeForAppFeatures,
    );

    return isListenerBasedStateShape
        ? const ShowTodosWithListenerStateShape()
        : const ShowTodosForStreamSubscriptionStateShape();
  }
}

// ! 🔵 **Stream Subscription-Based State Shape**
class ShowTodosForStreamSubscriptionStateShape extends StatelessWidget {
  const ShowTodosForStreamSubscriptionStateShape({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context
        .watch<FilteredTodosCubitWithStreamSubscriptionStateShape>()
        .state
        .filteredTodos;

    return _buildTodoList(context, todos);
  }
}

// ! 🟠 **Listener-Based State Shape**
class ShowTodosWithListenerStateShape extends StatelessWidget {
  const ShowTodosWithListenerStateShape({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context
        .watch<FilteredTodosCubitWithListenerStateShape>()
        .state
        .filteredTodos;

    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListCubit, TodoListStateOnCubit>(
          listener: (context, state) {
            context
                .read<FilteredTodosCubitWithListenerStateShape>()
                .setFilteredTodos(
                  context.read<TodoFilterCubit>().state.filter,
                  state.todos,
                  context.read<TodoSearchCubit>().state.searchTerm,
                );
          },
        ),
        BlocListener<TodoFilterCubit, TodoFilterStateOnCubit>(
          listener: (context, state) {
            context
                .read<FilteredTodosCubitWithListenerStateShape>()
                .setFilteredTodos(
                  state.filter,
                  context.read<TodoListCubit>().state.todos,
                  context.read<TodoSearchCubit>().state.searchTerm,
                );
          },
        ),
        BlocListener<TodoSearchCubit, TodoSearchStateOnCubit>(
          listener: (context, state) {
            context
                .read<FilteredTodosCubitWithListenerStateShape>()
                .setFilteredTodos(
                  context.read<TodoFilterCubit>().state.filter,
                  context.read<TodoListCubit>().state.todos,
                  state.searchTerm,
                );
          },
        ),
      ],
      child: _buildTodoList(context, todos),
    );
  }
}

// ? 🔧 ** Method for list building **
Widget _buildTodoList(BuildContext context, List<Todo> todos) {
  return ListView.separated(
    primary: false,
    shrinkWrap: true,
    itemCount: todos.length,
    separatorBuilder: (BuildContext context, int index) {
      return const Divider(
          color: AppConstants.darkSurfaceColor, thickness: 0.5);
    },
    itemBuilder: (BuildContext context, int index) {
      return SlidableTodoItem(todo: todos[index]);
    },
  );
}
