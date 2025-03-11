import 'package:flutter_bloc/flutter_bloc.dart';

/// 🌀 [GlobalLoaderCubit] - Manages the global loading state.
/// Used to display and hide loading indicators across the application.
class GlobalLoaderCubit extends Cubit<bool> {
  GlobalLoaderCubit() : super(false);

  /// 🚀 Triggers the loading state.
  void showLoader() => emit(true);

  /// ✅ Stops the loading state.
  void hideLoader() => emit(false);
}
