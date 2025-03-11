part of 'active_todo_count_cubit.dart';

final class ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape
    extends Equatable {
  const ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape.initial() {
    return const ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape(
        activeTodoCount: 0);
  }

  final int activeTodoCount;

  @override
  List<Object> get props => [activeTodoCount];

  @override
  String toString() =>
      'ActiveTodoCountState(activeTodoCount: $activeTodoCount)';

  ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
