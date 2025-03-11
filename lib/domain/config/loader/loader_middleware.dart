// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'loader_cubit.dart';

// /// 🌐 **[GlobalLoaderMiddleware]** - Middleware responsible for managing the global loader state.

// /// This observer listens to all **BLoC** events and automatically toggles the loader when needed.
// class GlobalLoaderMiddleware extends BlocObserver {
//   final GlobalLoaderCubit globalLoaderCubit;

//   /// 🆕 **Initializes the middleware with a reference to [GlobalLoaderCubit].**
//   GlobalLoaderMiddleware({required this.globalLoaderCubit});

//   /// 📨 **Listens for events and activates the loader for async operations.**
//   @override
//   void onEvent(Bloc bloc, Object? event) {
//     super.onEvent(bloc, event);

//     /// ✅ If an event starts an async operation, trigger the loader.
//     if (_isAsyncOperation(event)) {
//       globalLoaderCubit.showLoader();
//     }
//   }

//   /// 🔄 **Listens for state transitions and hides the loader when processing is complete.**
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);

//     /// ⏹️ Hide the loader when the bloc finishes processing.
//     if (_isStateComplete(transition.nextState)) {
//       globalLoaderCubit.hideLoader();
//     }
//   }

//   /// 🔍 **Determines if an event represents an asynchronous operation.**
//   bool _isAsyncOperation(Object? event) {
//     return event.toString().contains("Loading") ||
//         event.toString().contains("Fetch");
//   }

//   /// 🔍 **Checks if the next state indicates the operation is complete.**
//   bool _isStateComplete(Object nextState) {
//     return !nextState.toString().contains("Loading");
//   }
// }
