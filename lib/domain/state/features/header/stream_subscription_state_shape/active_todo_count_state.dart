part of 'active_todo_count_cubit.dart';

/// 📊 **State for Active ToDos Count (Stream Subscription State Shape)**
/// Holds the number of **active (uncompleted) todos**.
/// Ensures immutability and adheres to **Equatable** for efficient comparisons.
final class ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape
    extends Equatable {
  /// 🏗️ **Constructor**
  const ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape({
    required this.activeTodoCount,
  });

  /// 🔄 **Initial State Factory**
  factory ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape.initial() {
    return const ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape(
        activeTodoCount: 0);
  }

  final int activeTodoCount;

  /// ✅ **Equatable props for performance optimization**
  @override
  List<Object> get props => [activeTodoCount];

  /// 📝 **Readable Debugging String**
  @override
  String toString() =>
      'ActiveTodoCountState(activeTodoCount: $activeTodoCount)';

  /// 🔄 **Creates a new state with updated values**
  ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountStateOnCubitWithUsingStreamSubscriptionStateShape(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
