import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/app_constants/app_constants.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/state/app_settings/app_settings_cubit.dart';
import '../../domain/utils_and_services/helpers.dart';
import '../../domain/utils_and_services/overlay_service.dart';
import '../../domain/utils_and_services/show_dialog.dart';
import '../widgets/search_and_filter_todo.dart';
import '../widgets/show_todos.dart';
import '../widgets/todo_header.dart';

part 'state_shape_toggle_icon.dart';
part 'theme_toggle_icon.dart';

/// 🏠 [HomePage] - The main screen of the application.
/// Provides toggles for switching between light/dark themes and state shape modes
/// (ListenerStateShape / StreamSubscriptionStateShape).
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 45),
            child: TodoHeader(),
          ),
          actions: const [
            ThemeToggleIcon(),
            StateShapeToggleIcon(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const SizedBox(height: 20.0),
              SearchAndFilterTodo(),
              const ShowTodosWidget(),
            ],
          ),
        ),
        floatingActionButton: const AddTodoFAB(),
      ),
    );
  }
}

/// ➕ [AddTodoFAB] - Floating Action Button для створення нової тудушки.
class AddTodoFAB extends StatelessWidget {
  const AddTodoFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100, right: 10),
      child: FloatingActionButton(
        mini: true,
        backgroundColor: Helpers.getColorScheme(context).primary,
        onPressed: () => DialogService.showCreateTodoDialog(context),
        child: const Icon(Icons.add, color: AppConstants.overlayDarkTextColor),
      ),
    );
  }
}
