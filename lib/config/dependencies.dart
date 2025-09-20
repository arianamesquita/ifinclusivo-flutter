import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/data/services/firestore_chat_service.dart';
import 'package:if_inclusivo/data/services/impl/auth_service_impl.dart';
import 'package:if_inclusivo/data/services/impl/firestore_chat_service_impl.dart';
import 'package:if_inclusivo/data/services/impl/user_api_service_impl.dart';
import 'package:if_inclusivo/data/services/user_api_service.dart';
import 'package:if_inclusivo/ui/pages/auth/reset_password/viewmodels/reset_password_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/auth/sign_in/viewModels/login_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/auth/token/viewmodels/validate_token_viewmodel.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth_repository.dart';
import '../data/repositories/impl/auth_repository_impl.dart';
import '../data/services/auth_service.dart';
import '../ui/pages/auth/sing_up/viewModels/registerViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dio_config.dart';

List<SingleChildWidget> providers(SharedPreferences prefs,GoRouter router) {
  return [
    Provider<SharedPreferences>.value(value: prefs),
    Provider<GoRouter>.value(value: router),
    ..._servicesData,
    ..._repositoriesData,
    ..._viewModelsProviders,
  ];
}

//services
List<SingleChildWidget> get _servicesData {
  return [
    Provider<Dio>(
      create:
          (context) => DioConfig.createDio(
            context.read<GoRouter>(),
            context.read<SharedPreferences>(),
          ),
    ),

    Provider<AuthService>(
      create: (context) => AuthServiceImpl(context.read<Dio>()),
    ),
    Provider<FirestoreChatService>(create: (_) => FirestoreChatServiceImpl()),
    Provider<UserApiService>(
      create: (context) => UserApiServiceImpl(dio: context.read<Dio>()),
    ),
  ];
}

// Lista de providers da camada de dados
List<SingleChildWidget> get _repositoriesData {
  return [
    Provider<AuthRepository>(
      create:
          (context) => AuthRepositoryImpl(
            authService: context.read<AuthService>(),
            sharedPreferences: context.read<SharedPreferences>(),
          ),
      dispose: (_, repo) {
        if (repo is AuthRepositoryImpl) {
          repo.dispose();
        }
      },
    ),
  ];
}

//view Models
List<SingleChildWidget> get _viewModelsProviders {
  return [
    ChangeNotifierProvider<RegisterViewModel>(
      create:
          (context) =>
              RegisterViewModel(repository: context.read<AuthRepository>()),
    ),
    ChangeNotifierProvider<ValidateTokenViewModel>(
      create:
          (context) => ValidateTokenViewModel(
            repository: context.read<AuthRepository>(),
          ),
    ),

    ChangeNotifierProvider<ResetPasswordViewModel>(
      create:
          (context) => ResetPasswordViewModel(
            authRepository: context.read<AuthRepository>(),
          ),
    ),
    ChangeNotifierProvider<LoginViewModel>(
      create:
          (context) =>
              LoginViewModel(authRepository: context.read<AuthRepository>()),
    ),

    // ... adicione outros ViewModels aqui
  ];
}
