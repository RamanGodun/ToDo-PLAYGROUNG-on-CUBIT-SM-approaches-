import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_2ss_playground/domain/utils_and_services/helpers.dart';
import 'package:todo_app_cubit_2ss_playground/ui/widgets/text_widget.dart';
import '../../domain/app_constants/app_constants.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/models/enums.dart';
import '../../domain/utils_and_services/cubits_export.dart';
import '../../domain/utils_and_services/debounce.dart';

/// 🔎 [SearchAndFilterTodo] - Widget for searching and filtering ToDo items.
/// Provides a search bar and filter buttons to switch between different task categories.
class SearchAndFilterTodo extends StatelessWidget {
  SearchAndFilterTodo({super.key});

  /// ⏳ Implements a debounce mechanism to prevent excessive state updates.
  final debounce = Debounce(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      children: [
        /// 🔍 Search input field
        TextField(
          style: Helpers.getTextTheme(context).titleMedium,
          decoration: const InputDecoration(
            labelText: AppStrings.searchTodosLabel,
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              debounce.run(() {
                context.read<TodoSearchCubit>().setSearchTerm(newSearchTerm);
              });
            }
          },
        ),
        const SizedBox(height: 10.0),

        /// 🏷️ Filter buttons for task categories
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _filterButton(context, Filter.all, AppStrings.filterAll),
            _filterButton(context, Filter.active, AppStrings.filterActive),
            _filterButton(
                context, Filter.completed, AppStrings.filterCompleted),
          ],
        ),

        /// ➖ Divider for UI separation
        Divider(color: Helpers.getColorScheme(context).onSurface, thickness: 3),
      ],
    );
  }
}

/// 🔘 [_FilterButton] - Creates a reusable filter button.
Widget _filterButton(BuildContext context, Filter filter, String label) {
  return TextButton(
    onPressed: () => context.read<TodoFilterCubit>().changeFilter(filter),
    child: TextWidget(
      label,
      TextType.titleMedium,
      color: _getTextColor(context, filter),
    ),
  );
}

/// 🎨 [_getTextColor] - Returns the appropriate color for the filter button.
Color _getTextColor(BuildContext context, Filter filter) {
  final currentFilter = context.watch<TodoFilterCubit>().state.filter;
  return currentFilter == filter
      ? AppConstants.activeFilter
      : AppConstants.darkSurfaceColor;
}
