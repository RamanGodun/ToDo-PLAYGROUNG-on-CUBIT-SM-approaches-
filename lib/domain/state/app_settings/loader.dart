import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// 🌀 GlobalLoaderCubit - керує станом лоадера на глобальному рівні
class GlobalLoaderCubit extends Cubit<bool> {
  GlobalLoaderCubit() : super(false);

  void startLoading() => emit(true);
  void stopLoading() => emit(false);
}

/// 🌐 GlobalLoaderMiddleware - Middleware для автоматичного керування лоадером
class GlobalLoaderMiddleware<Event, State> extends BlocObserver {
  final GlobalLoaderCubit globalLoaderCubit;

  GlobalLoaderMiddleware({required this.globalLoaderCubit});

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // Якщо подія є асинхронною, показуємо лоадер
    if (event is ShowLoaderEvent) {
      globalLoaderCubit.startLoading();
    } else if (event is HideLoaderEvent) {
      globalLoaderCubit.stopLoading();
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // Закриваємо лоадер при завершенні переходу стану
    if (transition.nextState is! LoadingState) {
      globalLoaderCubit.stopLoading();
    }
  }
}

/// 📦 Приклад подій для керування лоадером
abstract class LoaderEvent {}

class ShowLoaderEvent extends LoaderEvent {}

class HideLoaderEvent extends LoaderEvent {}

/// 🧮 Стан для лоадера
abstract class LoadingState {}
