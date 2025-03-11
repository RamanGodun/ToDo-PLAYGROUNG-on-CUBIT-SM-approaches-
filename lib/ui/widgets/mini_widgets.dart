import 'package:flutter/material.dart';

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

/// 🛠️ [DeleteConfirmationDialog] віджет для підтвердження видалення елементу [Todo].
class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you really want to delete?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('NO'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('YES'),
        ),
      ],
    );
  }
}
