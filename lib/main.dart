import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'domain/app_constants/app_strings.dart';
import 'domain/config/observer/app_bloc_observer.dart';
import 'domain/state/app_settings/app_settings_cubit.dart';
import 'domain/utils_and_services/cubits_export.dart';
import 'ui/pages/home_page.dart';

/// 🚀 **[main] - Application entry point.**
/// - Initializes **HydratedBloc** for state persistence.
/// - Sets up **BlocObserver** for global state monitoring.
/// - Runs the app wrapped with **StateManagementProvider**.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🌐🛠️ **Set up a global BLoC observer**
  Bloc.observer = AppBlocObserver();

  /// 💾 **Initialize Hydrated Storage** (State Persistence)
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path),
  );
  HydratedBloc.storage = storage;

  /// 🏁 **Launch the app**
  runApp(const StateManagementProvider());
}

/// 📦 **[StateManagementProvider] - Provides all BLoC dependencies**
/// - Registers **GlobalLoaderCubit, AppSettingsCubit, Todo Cubits**.
/// - Manages **Listener-based & Stream Subscription-based** state shapes.
class StateManagementProvider extends StatelessWidget {
  const StateManagementProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// 🎨 **App Settings Provider** (Manages Theme & State Shape)
        BlocProvider(create: (_) => AppSettingsCubit()),

        /// ✅ **Core Business Logic Providers**
        BlocProvider(create: (_) => TodoListCubit()),
        BlocProvider(create: (_) => TodoFilterCubit()),
        BlocProvider(create: (_) => TodoSearchCubit()),

        /// 🟧 **Providers for Listener-based State Shape**
        BlocProvider(
            create: (context) =>
                ActiveTodoCountCubitWithUsingListenerStateShape(
                    todoListCubit: context.read<TodoListCubit>())),
        BlocProvider(
            create: (context) => FilteredTodosCubitWithListenerStateShape(
                initialTodos: context.read<TodoListCubit>().state.todos)),

        /// 🟦 **Providers for Stream Subscription-based State Shape**
        BlocProvider(
            create: (context) =>
                ActiveTodoCountCubitWithUsingStreamSubscriptionStateShape(
                    todoListCubit: context.read<TodoListCubit>())),
        BlocProvider(
            create: (context) =>
                FilteredTodosCubitWithStreamSubscriptionStateShape(
                    initialTodos: context.read<TodoListCubit>().state.todos,
                    todoFilterCubit: context.read<TodoFilterCubit>(),
                    todoSearchCubit: context.read<TodoSearchCubit>(),
                    todoListCubit: context.read<TodoListCubit>()))
      ],
      child: const AppView(),
    );
  }
}

/// 🎨 **[AppView] - Builds the main MaterialApp**
/// - Listens for theme changes via **AppSettingsCubit**.
class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: AppStrings.appTitle,
          debugShowCheckedModeBanner: false,
          theme: state.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          home: const HomePage(),
        );
      },
    );
  }
}
