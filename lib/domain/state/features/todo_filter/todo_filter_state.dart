part of 'todo_filter_cubit.dart';

/// 🔍 **State for ToDo Filtering**
/// Holds the selected **filter type** for displaying ToDos.
final class TodoFilterStateOnCubit extends Equatable {
  /// 🏗️ **Constructor**
  const TodoFilterStateOnCubit({required this.filter});

  /// 🔄 **Initial State Factory**
  factory TodoFilterStateOnCubit.initial() {
    return const TodoFilterStateOnCubit(filter: Filter.all);
  }

  /// 🎯 **Current Selected Filter**
  final Filter filter;

  /// ✅ **Equatable props for efficiency**
  @override
  List<Object> get props => [filter];

  /// 📝 **Readable Debugging String**
  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  /// 🔄 **Creates a new state with an updated filter**
  TodoFilterStateOnCubit copyWith({Filter? filter}) {
    return TodoFilterStateOnCubit(filter: filter ?? this.filter);
  }
}
