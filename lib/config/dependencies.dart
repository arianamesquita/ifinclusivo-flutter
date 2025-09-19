import 'package:if_inclusivo/ui/pages/auth/reset_password/viewmodels/reset_password_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/auth/sign_in/viewModels/login_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/auth/token/viewmodels/validate_token_viewmodel.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../data/repositories/userRepository/auth_repository.dart';
import '../data/repositories/userRepository/auth_repository_impl.dart';
import '../data/services/auth_service.dart';
import '../ui/pages/auth/sing_up/viewModels/registerViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> providers(SharedPreferences prefs) {
  return [
    Provider<SharedPreferences>.value(value: prefs),
    ..._servicesData,
    ..._repositoriesData,
    ..._viewModelsProviders,
  ];
}

//services
List<SingleChildWidget> get _servicesData {
  return [Provider<AuthService>(create: (_) => AuthService())];
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
          (context) =>
              ValidateTokenViewModel(repository: context.read<AuthRepository>()),
    ),

    ChangeNotifierProvider<ResetPasswordViewModel>(
      create:
          (context) =>
              ResetPasswordViewModel(authRepository: context.read<AuthRepository>()),
    ),
    ChangeNotifierProvider<LoginViewModel>(
      create:
          (context) =>
              LoginViewModel(authRepository: context.read<AuthRepository>()),
    ),

    // ... adicione outros ViewModels aqui
  ];
}
