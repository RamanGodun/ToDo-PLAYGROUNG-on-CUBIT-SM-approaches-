import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/utils_and_services/cubits_export.dart';
import 'mini_widgets.dart';
import 'todo_item.dart';

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
            onDismissed: (_) {
              context.read<TodoListCubit>().removeTodo(todos[index]);
            },
            confirmDismiss: (_) {
              return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const DeleteConfirmationDialog();
                },
              );
            },
            child: TodoItem(todo: todos[index]),
          );
        },
      ),
    );
  }
}
