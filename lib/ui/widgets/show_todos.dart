import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/state/app_settings/app_settings_cubit.dart';
import '../../domain/utils_and_services/cubits_export.dart';
import 'todo_item.dart';

/// 📦 [ShowTodosWidget] dynamically selects the appropriate Todo list widget
/// based on the current **State Shape** (ListenerStateShape / StreamSubscriptionStateShape).
class ShowTodosWidget extends StatelessWidget {
  const ShowTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔄 Retrieve the current state shape mode dynamically
    final isListenerBasedStateShape = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingListenerStateShapeForAppFeatures,
    );

    return isListenerBasedStateShape
        ? const ShowTodosWithListenerStateShape()
        : const ShowTodosForStreamSubscriptionStateShape();
  }
}

// !Next is with stream subscription state shape
class ShowTodosForStreamSubscriptionStateShape extends StatelessWidget {
  const ShowTodosForStreamSubscriptionStateShape({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context
        .watch<FilteredTodosCubitWithStreamSubscriptionStateShape>()
        .state
        .filteredTodos;

    return ListView.separated(
      // ? next two is the alternative using Expanded widget to avoid "unconstrained..." bug
      primary: false,
      shrinkWrap: true,
      itemCount: todos.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: Colors.grey);
      },
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(todos[index].id),
          background: const DismissibleBackground(0),
          secondaryBackground: const DismissibleBackground(1),
          onDismissed: (_) =>
              context.read<TodoListCubit>().removeTodo(todos[index]),
          // confirmDismiss: () {},
          child: TodoItem(todo: todos[index]),
        );
      },
    );
  }
}

// !Next is with Listener state shape
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
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: todos.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.grey);
        },
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            background: const DismissibleBackground(0),
            secondaryBackground: const DismissibleBackground(1),
            onDismissed: (_) =>
                context.read<TodoListCubit>().removeTodo(todos[index]),
            // confirmDismiss: (_) {},
            child: TodoItem(todo: todos[index]),
          );
        },
      ),
    );
  }
}

/// 🛠️ [DismissibleBackground] віджет для відображення червоного фону
/// під час свайпу елементу списку [Todo].
class DismissibleBackground extends StatelessWidget {
  final int direction;

  const DismissibleBackground(this.direction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
