part of 'active_todo_count_cubit_listener_ss.dart';

/// 📊 **State for Active ToDos Count in Listener State Shape**
/// Represents the number of **active (uncompleted) ToDos**.
/// This state is used within **[ActiveTodoCountCubitWithUsingListenerStateShape]**.
final class ActiveTodoCountStateOnCubitWithUsingListenerStateShape
    extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountStateOnCubitWithUsingListenerStateShape({
    required this.activeTodoCount,
  });

  /// 🔄 **Initial State**
  factory ActiveTodoCountStateOnCubitWithUsingListenerStateShape.initial() {
    return const ActiveTodoCountStateOnCubitWithUsingListenerStateShape(
      activeTodoCount: 0,
    );
  }

  /// 🧩 **Equatable Implementation**
  @override
  List<Object> get props => [activeTodoCount];

  /// 📜 **Debugging-Friendly String Representation**
  @override
  String toString() =>
      'ActiveTodoCountState(activeTodoCount: $activeTodoCount)';

  /// ✏️ **Creates a new state instance with updated values**
  ActiveTodoCountStateOnCubitWithUsingListenerStateShape copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountStateOnCubitWithUsingListenerStateShape(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
