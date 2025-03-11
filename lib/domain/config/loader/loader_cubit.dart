import 'package:flutter_bloc/flutter_bloc.dart';

/// 🌀 **[GlobalLoaderCubit]** - Manages the global loading state.

/// This cubit is used to show and hide loading indicators across the application.
class GlobalLoaderCubit extends Cubit<bool> {
  /// 🆕 **Initializes the loader in a hidden state (`false`).**
  GlobalLoaderCubit() : super(false);

  /// 🚀 **Triggers the loading state (shows the loader).**
  void showLoader() => emit(true);

  /// ✅ **Stops the loading state (hides the loader).**
  void hideLoader() => emit(false);
}
