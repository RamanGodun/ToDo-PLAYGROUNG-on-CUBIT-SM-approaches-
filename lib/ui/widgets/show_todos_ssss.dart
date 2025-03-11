// !Next is with stream subscription state shape

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/utils_and_services/cubits_export.dart';
import 'mini_widgets.dart';
import 'todo_item.dart';

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
    );
  }
}
