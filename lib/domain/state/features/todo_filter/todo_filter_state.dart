part of 'todo_filter_cubit.dart';

final class TodoFilterStateOnCubit extends Equatable {
  const TodoFilterStateOnCubit({
    required this.filter,
  });

  factory TodoFilterStateOnCubit.initial() {
    return const TodoFilterStateOnCubit(filter: Filter.all);
  }

  final Filter filter;

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  TodoFilterStateOnCubit copyWith({
    Filter? filter,
  }) {
    return TodoFilterStateOnCubit(
      filter: filter ?? this.filter,
    );
  }
}
