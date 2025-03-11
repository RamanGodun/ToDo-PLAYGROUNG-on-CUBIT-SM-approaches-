import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_app_cubit_2ss_playground/ui/widgets/text_widget.dart';
import '../../domain/app_constants/app_constants.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/state/features/todos_list/todo_list_cubit.dart';
import '../../domain/utils_and_services/helpers.dart';

/// 📜 [CreateTodoDialog] - Dialog for adding new ToDo tasks.
class CreateTodoDialog extends HookWidget {
  const CreateTodoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final newTodoController = useTextEditingController();

    return AlertDialog(
      title: const TextWidget(AppStrings.newTodoTitle, TextType.smallHeadline),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height *
              AppConstants.dialogMaxHeightRatio,
        ),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  style: Helpers.getTextTheme(context).titleLarge,
                  controller: newTodoController,
                  decoration: const InputDecoration(
                      labelText: AppStrings.todoInputHint),
                  autofocus: true,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const TextWidget(
                AppStrings.cancelButton,
                TextType.titleSmall,
                color: AppConstants.errorColor,
              ),
            ),
            TextButton(
              onPressed: () {
                final todoDesc = newTodoController.text.trim();
                if (todoDesc.isNotEmpty) {
                  context.read<TodoListCubit>().addTodo(todoDesc);
                  Navigator.of(context).pop();
                }
              },
              child: const TextWidget(
                AppStrings.addButton,
                TextType.button,
                color: AppConstants.darkPrimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
