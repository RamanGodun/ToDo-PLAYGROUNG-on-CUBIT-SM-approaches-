part of 'todo_search_cubit.dart';

final class TodoSearchStateOnCubit extends Equatable {
  const TodoSearchStateOnCubit({
    required this.searchTerm,
  });

  factory TodoSearchStateOnCubit.initial() {
    return const TodoSearchStateOnCubit(searchTerm: '');
  }

  final String searchTerm;

  @override
  List<Object> get props => [searchTerm];

  @override
  String toString() => 'TodoSearchState(searchTerm: $searchTerm)';

  TodoSearchStateOnCubit copyWith({
    String? searchTerm,
  }) {
    return TodoSearchStateOnCubit(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
