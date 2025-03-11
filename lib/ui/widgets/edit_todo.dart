import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../domain/state/features/todos_list/todo_list_cubit.dart';
import '../../domain/models/todo_model.dart';
import '../../domain/app_constants/app_strings.dart';

/// ✏️ [EditTodoDialog] - A dialog for editing an existing ToDo.
/// Uses [HookWidget] for state management with [useTextEditingController].
class EditTodoDialog extends HookWidget {
  final Todo todo;
  const EditTodoDialog({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    // 📝 Controller for editing ToDo description.
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// ❌ Cancel button - Closes the dialog without saving changes.
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(AppStrings.cancelButton),
            ),

            /// 💾 Save button - Updates the ToDo and closes the dialog.
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
        ),
      ],
    );
  }
}
