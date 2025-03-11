part of 'active_todo_count_cubit_listener_ss.dart';

final class ActiveTodoCountStateOnCubitWithUsingListenerStateShape
    extends Equatable {
  const ActiveTodoCountStateOnCubitWithUsingListenerStateShape({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountStateOnCubitWithUsingListenerStateShape.initial() {
    return const ActiveTodoCountStateOnCubitWithUsingListenerStateShape(
        activeTodoCount: 0);
  }

  final int activeTodoCount;

  @override
  List<Object> get props => [activeTodoCount];

  @override
  String toString() =>
      'ActiveTodoCountState(activeTodoCount: $activeTodoCount)';

  ActiveTodoCountStateOnCubitWithUsingListenerStateShape copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountStateOnCubitWithUsingListenerStateShape(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
