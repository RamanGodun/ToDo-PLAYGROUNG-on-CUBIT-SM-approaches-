import 'package:flutter_bloc/flutter_bloc.dart';
import '../loader/loader_cubit.dart';

/// 🛠️ **[AppBlocObserver]** - Custom observer for monitoring BLoC/Cubit lifecycle & global loading state.
/// This observer logs key lifecycle events:
/// - 🟢 **onCreate**: When a BLoC/Cubit is initialized.
/// - 📨 **onEvent**: When an event is added to a BLoC.
/// - 🔄 **onChange**: When there is a state change in a BLoC/Cubit.
/// - ➡️ **onTransition**: When a BLoC processes a transition (event → state).
/// - ❌ **onError**: When an error occurs in a BLoC/Cubit.
/// - 🔴 **onClose**: When a BLoC/Cubit is closed and disposed.
class AppBlocObserver extends BlocObserver {
  final GlobalLoaderCubit globalLoaderCubit;

  AppBlocObserver({required this.globalLoaderCubit});

  /// ⏳ **Generates a timestamp** for log messages.
  String _timestamp() => DateTime.now().toIso8601String();

  /// 🟢 **Called when a BLoC/Cubit is created.**
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('🟢 [${_timestamp()}] onCreate -- ${bloc.runtimeType}');
  }

  /// 📨 **Called when an event is added to a BLoC.**
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('📨 [${_timestamp()}] onEvent -- ${bloc.runtimeType}: $event');

    /// 🔄 **Show loader only for specific events**
    if (_shouldShowLoader(event)) {
      globalLoaderCubit.showLoader();
    }
  }

  /// 🔄 **Called when there is a state change in a BLoC/Cubit.**
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('🔄 [${_timestamp()}] onChange -- ${bloc.runtimeType}: $change');
  }

  /// ➡️ **Called when a BLoC processes a transition (event → state).**
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
        '➡️ [${_timestamp()}] onTransition -- ${bloc.runtimeType}: $transition');

    /// ⏹️ **Hide loader when the state update is completed**
    if (_shouldHideLoader(transition.nextState)) {
      globalLoaderCubit.hideLoader();
    }
  }

  /// ❌ **Called when an error occurs in a BLoC/Cubit.**
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(
        '❌ [${_timestamp()}] onError -- ${bloc.runtimeType}: $error\n$stackTrace');
    globalLoaderCubit.hideLoader();
    super.onError(bloc, error, stackTrace);
  }

  /// 🔴 **Called when a BLoC/Cubit is closed and disposed.**
  @override
  void onClose(BlocBase bloc) {
    print('🔴 [${_timestamp()}] onClose -- ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  /// 🔍 **Determines if an event requires showing the loader.**
  bool _shouldShowLoader(Object? event) {
    final List<String> loaderEvents = [
      "FetchTodos",
      "LoadSettings",
      "LoadData",
      "SyncWithServer"
    ];
    return event != null &&
        loaderEvents.any((e) => event.toString().contains(e));
  }

  /// 🔍 **Determines if the next state allows hiding the loader.**
  bool _shouldHideLoader(Object nextState) {
    return !nextState.toString().contains("Loading");
  }
}
