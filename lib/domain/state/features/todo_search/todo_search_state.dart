part of 'todo_search_cubit.dart';

/// 🔍 **State for [TodoSearchCubit]**
/// Stores the current **search term** used for filtering ToDos.
final class TodoSearchStateOnCubit extends Equatable {
  /// 🏗️ **Constructor**
  const TodoSearchStateOnCubit({required this.searchTerm});

  /// 🔄 **Initial State Factory**
  factory TodoSearchStateOnCubit.initial() {
    return const TodoSearchStateOnCubit(searchTerm: '');
  }

  /// 🔍 **Current search term**
  final String searchTerm;

  /// ✅ **Equatable props for efficiency**
  @override
  List<Object> get props => [searchTerm];

  /// 📝 **Readable Debugging String**
  @override
  String toString() => 'TodoSearchState(searchTerm: "$searchTerm")';

  /// 🔄 **Creates a new state with an updated search term**
  TodoSearchStateOnCubit copyWith({String? searchTerm}) {
    return TodoSearchStateOnCubit(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
