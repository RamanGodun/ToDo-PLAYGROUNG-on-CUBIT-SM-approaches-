import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_2ss_playground/domain/utils_and_services/helpers.dart';
import 'package:todo_app_cubit_2ss_playground/ui/widgets/text_widget.dart';
import '../../domain/app_constants/app_constants.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/models/enums.dart';
import '../../domain/utils_and_services/cubits_export.dart';
import '../../domain/utils_and_services/debounce.dart';

class SearchAndFilterTodo extends StatelessWidget {
  SearchAndFilterTodo({super.key});
  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      children: [
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            filterButton(context, Filter.all, AppStrings.filterAll),
            filterButton(context, Filter.active, AppStrings.filterActive),
            filterButton(context, Filter.completed, AppStrings.filterCompleted),
          ],
        ),
        Divider(color: Helpers.getColorScheme(context).onSurface, thickness: 3),
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter, String label) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: TextWidget(
        label,
        TextType.titleMedium,
        color: textColor(context, filter),
      ),
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<TodoFilterCubit>().state.filter;
    return currentFilter == filter
        ? AppConstants.activeFilter
        : AppConstants.darkSurfaceColor;
  }
}
