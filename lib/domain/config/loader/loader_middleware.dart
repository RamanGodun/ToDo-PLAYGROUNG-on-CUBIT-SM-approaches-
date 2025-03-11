import 'package:flutter_bloc/flutter_bloc.dart';
import 'loader_cubit.dart';

/// 🌐 [GlobalLoaderMiddleware] - Middleware responsible for automatically managing the global loader state.
/// This observer listens to all bloc events and manages the loader accordingly.
class GlobalLoaderMiddleware extends BlocObserver {
  final GlobalLoaderCubit globalLoaderCubit;

  GlobalLoaderMiddleware({required this.globalLoaderCubit});

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    /// ✅ If an event starts an async operation, trigger the loader.
    if (_isAsyncOperation(event)) {
      globalLoaderCubit.showLoader();
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    /// ⏹️ Hide the loader when the bloc finishes processing.
    if (_isStateComplete(transition.nextState)) {
      globalLoaderCubit.hideLoader();
    }
  }

  /// 🔍 Helper method to determine if an event is an async operation.
  bool _isAsyncOperation(Object? event) {
    return event.toString().contains("Loading") ||
        event.toString().contains("Fetch");
  }

  /// 🔍 Helper method to determine if the state is a completed state.
  bool _isStateComplete(Object nextState) {
    return !nextState.toString().contains("Loading");
  }
}
