import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/domain/app_constants/app_strings.dart';
import 'core/domain/app_settings_on_cubit/app_settings_cubit.dart';
import 'core/domain/app_settings_on_cubit/loader.dart';
import 'core/domain/config/observer/app_bloc_observer.dart';
import 'core/domain/utils/show_dialog.dart';
import 'core/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  // HydratedBloc.storage.clear(); // ? only in test mode (delete persistence data)

  runApp(const StateManagementProvider());
}

class StateManagementProvider extends StatelessWidget {
  const StateManagementProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsCubit>(create: (context) => AppSettingsCubit()),

        /// 🟧 Providers for "Listeners" state-shape
        /// 🟦 Providers for "Stream Subscription" state-shape
      ],
      child: const GlobalLoaderProvider(),
    );
  }
}

/// 🎯 [GlobalLoaderProvider] wraps the app with a global loading state management
class GlobalLoaderProvider extends StatelessWidget {
  const GlobalLoaderProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalLoaderCubit>(
      create: (_) => GlobalLoaderCubit(),
      child: BlocListener<GlobalLoaderCubit, bool>(
        listener: (context, isLoading) => isLoading
            ? DialogService.showLoadingDialog(context)
            : DialogService.closeDialog(context),
        child: const AppView(),
      ),
    );
  }
}

/// 📱 [AppView] builds the main MaterialApp and listens for theme changes
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
