import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/data/repositories/account_security_repository.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';
import 'package:if_inclusivo/data/repositories/impl/account_security_repository_impl.dart';
import 'package:if_inclusivo/data/repositories/impl/forum_repository_impl.dart';
import 'package:if_inclusivo/data/repositories/impl/libras_repository_impl.dart';
import 'package:if_inclusivo/data/repositories/libras_repository.dart';
import 'package:if_inclusivo/data/services/account_security_service.dart';
import 'package:if_inclusivo/data/services/forum_service.dart';
import 'package:if_inclusivo/data/services/impl/account_security_service_impl.dart';
import 'package:if_inclusivo/data/services/impl/auth_service_impl.dart';
import 'package:if_inclusivo/data/services/impl/forum_service_impl.dart';
import 'package:if_inclusivo/data/services/impl/libras_service_impl.dart';
import 'package:if_inclusivo/data/services/impl/user_api_service_impl.dart';
import 'package:if_inclusivo/data/services/libras_service.dart';
import 'package:if_inclusivo/data/services/user_api_service.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/auth/reset_password/viewmodels/reset_password_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/auth/sign_in/viewModels/login_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/auth/token/viewmodels/validate_token_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/feed/viewmodels/feed_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/profile/account_security/viewModels/account_security_viewmodel.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth_repository.dart';
import '../data/repositories/impl/auth_repository_impl.dart';
import '../data/services/auth_service.dart';
import '../ui/pages/auth/sing_up/viewModels/registerViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/pages/libras/specific_topic/viewmodels/specific_topic_viewmodel.dart';
import '../ui/pages/forum/new publication/viewmodels/new_poblication_viewmodel.dart';
import 'dio_config.dart';

List<SingleChildWidget> providers(SharedPreferences prefs) {
  return [
    Provider<SharedPreferences>.value(value: prefs),
    ..._authServices,
    ..._servicesData,
    ..._repositoriesData,
    ..._viewModelsProviders,
  ];
}

List<SingleChildWidget> get _authServices {
  return [
    Provider<AuthService>(create: (_) => AuthServiceImpl()),
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
    Provider<GoRouter>(
      create: (context) {
        return createRouter(authRepository: context.read<AuthRepository>());
      },
    ),
    Provider<Dio>(
      create: (context) {
        return DioConfig.createDio(
          context.read<SharedPreferences>(),
          context.read<AuthRepository>(),
          context.read<GoRouter>(), // Passaremos o GoRouter aqui
        );
      },
    ),
  ];
}

List<SingleChildWidget> get _servicesData {
  return [
    Provider<UserApiService>(
      create: (context) => UserApiServiceImpl(dio: context.read<Dio>()),
    ),
    Provider<ForumService>(
      create: (context) => ForumServiceImpl(dio: context.read<Dio>()),
    ),
    Provider<LibrasService>(
      create: (context) => LibrasServiceImpl(dio: context.read<Dio>()),
    ),
    Provider<AccountSecurityService>(
      create: (context) => AccountSecurityServiceImpl(dio: context.read<Dio>()),
    ),
  ];
}

// repositories
List<SingleChildWidget> get _repositoriesData {
  return [
    Provider<ForumRepository>(
      create:
          (context) =>
              ForumRepositoryImpl(service: context.read<ForumService>()),
    ),
    Provider<LibrasRepository>(
      create:
          (context) => LibrasRepositoryImpl(
            librasService: context.read<LibrasService>(),
          ),
    ),
    Provider<AccountSecurityRepository>(
      create:
          (context) => AccountSecurityRepositoryImpl(
        service: context.read<AccountSecurityService>(),
      ),
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

    ChangeNotifierProvider<SpecificTopicViewModel>(
      create:
          (context) => SpecificTopicViewModel(
            librasRepository: context.read<LibrasRepository>(),
          ),
    ),
    ChangeNotifierProvider(
      create:
          (context) => FeedViewModel(
            forumRepository: context.read<ForumRepository>(),
            authRepository:  context.read<AuthRepository>()
          ),
    ),
    ChangeNotifierProvider(
      create:
          (context) => AccountSecurityViewModel(
          accountRepository: context.read<AccountSecurityRepository>(),
      ),
    ),



    // ... adicione outros ViewModels aqui
  ];
}
