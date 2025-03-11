import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/enums.dart';

part 'todo_filter_state.dart';

/// 🔍 **[TodoFilterCubit]** - Manages the filtering of ToDo items.
/// Allows switching between **All, Active, and Completed** ToDos.
class TodoFilterCubit extends Cubit<TodoFilterStateOnCubit> {
  /// 🏗️ **Constructor** → Initializes with default **All** filter.
  TodoFilterCubit() : super(TodoFilterStateOnCubit.initial());

  /// 🔄 **Changes the current filter state.**
  void changeFilter(Filter newFilter) {
    if (newFilter != state.filter) {
      emit(state.copyWith(filter: newFilter));
    }
  }
}
