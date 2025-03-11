import 'package:flutter/material.dart';

import '../app_constants/app_constants.dart';
import '../app_constants/app_strings.dart';
import '../../ui/widgets/text_widget.dart';
import 'helpers.dart';

/// 💬 [DialogService] provides reusable dialogs throughout the app.
abstract class DialogService {
  /// ⚠️ Shows an alert dialog with the provided [text].
  static void showAlertDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height *
                AppConstants.dialogMaxHeightRatio,
          ),
          child: Center(
            child: TextWidget(
              text,
              TextType.button,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Center(
              child: TextWidget(
                AppStrings.okButton,
                TextType.titleMedium,
                color: Helpers.getColorScheme(context).primary,
              ),
            ),
          ),
        ],
      ),
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
