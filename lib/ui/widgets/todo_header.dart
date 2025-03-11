import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/state/app_settings/app_settings_cubit.dart';
import '../../domain/utils_and_services/cubits_export.dart';
import 'text_widget.dart';

/// Common reusable widget for Todo Header
class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔄 Retrieve the current state shape mode
    final isListenerStateShape = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingListenerStateShapeForAppFeatures,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextWidget('TODO', TextType.smallHeadline),
        isListenerStateShape
            ? const TodoHeaderForListenerStateShape()
            : const TodoHeaderForStreamSubscriptionStateShape(),
      ],
    );
  }
}

// ! NEXT for stream subscription state-shape
class TodoHeaderForStreamSubscriptionStateShape extends StatelessWidget {
  const TodoHeaderForStreamSubscriptionStateShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<ActiveTodoCountCubitWithUsingStreamSubscriptionStateShape>().state.activeTodoCount} items left',
      style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
    );
  }
}

// !Next is with Listener state shape
class TodoHeaderForListenerStateShape extends StatelessWidget {
  const TodoHeaderForListenerStateShape({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoListCubit, TodoListStateOnCubit>(
      listener: (context, state) {
        context
            .read<ActiveTodoCountCubitWithUsingListenerStateShape>()
            .calculateActiveTodoCount();
      },
      child: BlocBuilder<ActiveTodoCountCubitWithUsingListenerStateShape,
          ActiveTodoCountStateOnCubitWithUsingListenerStateShape>(
        builder: (context, state) {
          return TextWidget(
            '${state.activeTodoCount} items left',
            TextType.titleMedium,
          );
        },
      ),
    );
  }
}
