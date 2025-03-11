import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../domain/state/features/todos_list/todo_list_cubit.dart';
import '../../domain/models/todo_model.dart';
import '../../domain/app_constants/app_strings.dart';

/// 📜 [EditTodoDialog] - Dialog for editing a ToDo.
class EditTodoDialog extends HookWidget {
  final Todo todo;
  const EditTodoDialog({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: todo.desc);

    return AlertDialog(
      title: const Text(AppStrings.editTodoTitle),
      content: TextField(
        controller: textController,
        decoration:
            const InputDecoration(labelText: AppStrings.newTodoDescription),
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(AppStrings.cancelButton),
        ),
        TextButton(
          onPressed: () {
            final newDesc = textController.text.trim();
            if (newDesc.isNotEmpty) {
              context.read<TodoListCubit>().editTodo(todo.id, newDesc);
              Navigator.of(context).pop();
            }
          },
          child: const Text(AppStrings.saveButton),
        ),
      ],
    );
  }
}
