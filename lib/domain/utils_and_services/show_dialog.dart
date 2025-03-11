import 'package:flutter/material.dart';
import '../../ui/widgets/create_todo_dialog.dart';

/// 💬 [DialogService] provides reusable dialogs throughout the app.
abstract class DialogService {
  /// 📝 Shows a dialog for creating a new ToDo.
  static void showCreateTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreateTodoDialog(),
    );
  }

  /// ⏳ Shows a loading dialog with a centered `CircularProgressIndicator`.
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // ❌ Не дозволяє закрити, поки не закриємо вручну
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// ❌ Closes any open dialogs.
  static void closeDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
