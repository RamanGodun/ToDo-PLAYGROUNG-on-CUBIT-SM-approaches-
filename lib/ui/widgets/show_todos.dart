import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_2ss_playground/domain/app_constants/app_constants.dart';
import '../../domain/models/todo_model.dart';
import '../../domain/state/app_settings/app_settings_cubit.dart';
import '../../domain/utils_and_services/cubits_export.dart';
import 'todo_item.dart';

/// 📌 [ShowTodosWidget] - A dynamic widget that displays ToDo items.
/// Depending on the selected **State Shape** (Listener-Based / Stream Subscription-Based),
/// it chooses the appropriate method to handle state updates.
class ShowTodosWidget extends StatelessWidget {
  const ShowTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// 🔄 Retrieves the current **State Shape Mode** from [AppSettingsCubit].
    final isListenerBasedStateShape = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingListenerStateShapeForAppFeatures,
    );

    return isListenerBasedStateShape
        ? const ShowTodosWithListenerStateShape()
        : const ShowTodosForStreamSubscriptionStateShape();
  }
}

/// ! 🔵 [ShowTodosForStreamSubscriptionStateShape] - Displays ToDos using **Stream Subscription-Based State Shape**.
/// It listens for updates from **FilteredTodosCubitWithStreamSubscriptionStateShape**.
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

/// ! 🟠 [ShowTodosWithListenerStateShape] - Displays ToDos using **Listener-Based State Shape**.
/// It uses multiple **BlocListener** instances to update the filtered ToDos list.
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
        /// 🎯 Listens for changes in the ToDo list and updates the filtered list.
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

        /// 🔍 Listens for filter changes and updates the filtered ToDos list.
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

        /// 🔎 Listens for search term changes and updates the filtered ToDos list.
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

/// 🔧 [_buildTodoList] - Builds a list of **SlidableTodoItem** widgets.
Widget _buildTodoList(BuildContext context, List<Todo> todos) {
  return ListView.separated(
    primary: false,
    shrinkWrap: true,
    itemCount: todos.length,
    separatorBuilder: (BuildContext context, int index) {
      return const Divider(
        color: AppConstants.secondaryColor4LightTheme,
        thickness: 0.3,
      );
    },
    itemBuilder: (BuildContext context, int index) {
      return SlidableTodoItem(todo: todos[index]);
    },
  );
}
