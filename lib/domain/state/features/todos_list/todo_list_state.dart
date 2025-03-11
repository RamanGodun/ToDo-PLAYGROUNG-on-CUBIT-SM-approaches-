// todo_list_state.dart
part of 'todo_list_cubit.dart';

final class TodoListStateOnCubit extends Equatable {
  const TodoListStateOnCubit({
    required this.todos,
  });

  factory TodoListStateOnCubit.initial() {
    return TodoListStateOnCubit(todos: [
      Todo(id: '1', desc: 'Clean the room'),
      Todo(id: '2', desc: 'Wash the dish'),
      Todo(id: '3', desc: 'Do homework'),
    ]);
  }

  final List<Todo> todos;

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodoListState(todos: $todos)';

  TodoListStateOnCubit copyWith({
    List<Todo>? todos,
  }) {
    return TodoListStateOnCubit(
      todos: todos ?? this.todos,
    );
  }
}
