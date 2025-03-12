import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_2ss_playground/domain/app_constants/app_strings.dart';
import 'package:todo_app_cubit_2ss_playground/ui/widgets/text_widget.dart';
import '../../domain/models/todo_model.dart';
import '../../domain/utils_and_services/cubits_export.dart';
import '../../domain/utils_and_services/helpers.dart';
import '../../domain/utils_and_services/show_dialog.dart';

/// 🎯 **[SlidableTodoItem]** - A `TodoItem` wrapped with swipe actions.
/// Allows users to **edit** or **delete** a ToDo item via swipe gestures.
class SlidableTodoItem extends StatelessWidget {
  final Todo todo;
  const SlidableTodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Helpers.getColorScheme(context);

    return Slidable(
      key: ValueKey(todo.id),

      /// 🟦 **Left Swipe: Edit Action**
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => DialogService.editTodo(context, todo),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            label: AppStrings.editButton,
          ),
        ],
      ),

      /// 🟥 **Right Swipe: Delete Action**
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => context.read<TodoListCubit>().removeTodo(todo),
            backgroundColor: colorScheme.error,
            foregroundColor: colorScheme.onError,
            icon: Icons.delete,
            label: AppStrings.deleteButton,
          ),
        ],
      ),

      /// 📌 **Main ToDo Item**
      child: TodoItem(todo: todo),
    );
  }
}

/// ✅ **[TodoItem]** - A single ToDo item in the list.
/// Displays the **checkbox** and **ToDo description**.
class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final textColor =
        Helpers.getColorScheme(context).onSurface.withOpacity(0.85);
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (_) => context.read<TodoListCubit>().toggleTodo(todo.id),
      ),
      title: TextWidget(
        todo.desc,
        TextType.titleMedium,
        color: textColor,
      ),
    );
  }
}
