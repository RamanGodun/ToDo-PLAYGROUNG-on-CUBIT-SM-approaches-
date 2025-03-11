import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_state.dart';

/// 🔍 **[TodoSearchCubit]** - Manages the search functionality for ToDo items.
/// Updates the search term and filters ToDos accordingly.
class TodoSearchCubit extends Cubit<TodoSearchStateOnCubit> {
  /// 🏗️ **Constructor** → Initializes with an empty search term.
  TodoSearchCubit() : super(TodoSearchStateOnCubit.initial());

  /// 🔄 **Updates the search term.**
  /// Prevents unnecessary state updates if the term hasn't changed.
  void setSearchTerm(String newSearchTerm) {
    if (newSearchTerm.trim() != state.searchTerm) {
      emit(state.copyWith(searchTerm: newSearchTerm.trim()));
    }
  }
}
