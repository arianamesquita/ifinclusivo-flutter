// lib/ui/pages/auth/login_dialog_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/validators/email_validador.dart';
import 'package:if_inclusivo/domain/validators/login_validator.dart';
import 'package:if_inclusivo/domain/validators/password_validator.dart';
import 'package:if_inclusivo/ui/pages/auth/modal/auth_modals.dart';
import 'package:if_inclusivo/ui/pages/auth/sign_in/viewModels/login_viewmodel.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:lucid_validation/lucid_validation.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
import '../../../core/widgets/hoverable_logo.dart';

class LoginDialogContent extends StatefulWidget {
  const LoginDialogContent({super.key});
  static const Color color1 = Color.fromRGBO(
    168,
    79,
    206,
    1,
  ); // Opacidade 100% é 1, não 100
  static const Color color2 = Color.fromRGBO(233, 246, 242, 1);

  @override
  State<LoginDialogContent> createState() => _LoginDialogContentState();
}

class _LoginDialogContentState extends State<LoginDialogContent> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final EmailFieldValidator emailValidator = EmailFieldValidator();
  final PasswordFieldValidator senhaValidator = PasswordFieldValidator();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginFieldValidator loginValidator = LoginFieldValidator();
  final LoginModel loginModel = LoginModel();

  bool isEmailError = false;
  String errorEmail = '';
  bool isSenhaError = false;
  String errorSenha = '';
  bool isValid = false;
  bool isLoading = false;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    final ValidationResult result = loginValidator.validate(loginModel);
    return result.isValid;
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoggedIn) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.canPop()) {
              context.pop();
            } else {
              ForumRouter().go(context);
            }
          });
        }
        return Scaffold(
          body:
              deviceType == DeviceScreenType.mobile
                  ? _buildMobile(viewModel)
                  : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          LoginDialogContent.color2,
                          LoginDialogContent.color1,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [
                          0.6362,
                          0.3638,
                        ], // metade roxo, metade branco
                      ),
                    ),
                    child: Stack(
                      children: [
                        if (deviceType == DeviceScreenType.desktop)
                          _buildIntro(context),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Container(
                                  width:
                                      deviceType == DeviceScreenType.desktop
                                          ? 500
                                          : deviceType ==
                                              DeviceScreenType.tablet
                                          ? 400
                                          : 300,
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 97,
                                        ),
                                        child: Text(
                                          "Bem-Vindo de Volta",
                                          style: textTheme.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      buildForm(viewModel),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 50,
                                        ),
                                        child: _buildButtonLogin(viewModel),
                                      ),
                                      _helperButtons(viewModel, textTheme),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (deviceType == DeviceScreenType.desktop)
                              const Expanded(flex: 1, child: SizedBox()),
                          ],
                        ),
                      ],
                    ),
                  ),
        );
      },
    );
  }

  _buildMobile(viewModel) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/icons/Backdround.png',
            fit: BoxFit.cover, // muito importante
          ),
        ),

        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Bem-Vindo de Volta",
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        'assets/icons/Mobile login-pana 1.svg',
                      ),
                    ),
                  ),
                  buildForm(viewModel),
                  Padding(
                    padding: const EdgeInsets.only(top: 47.0, bottom: 25),
                    child: _buildButtonLogin(viewModel),
                  ),
                  _helperButtons(viewModel, textTheme),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildButtonLogin(LoginViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width:
          ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile
              ? null
              : double.infinity,
      child: FilledButton(
        onPressed:
            isLoading
                ? null
                : () async {
                  setState(() => isLoading = true);
                  final credentials = LoginRequestModel(
                    login: _loginController.text,
                    senha: _passwordController.text,
                  );
                  final success = await viewModel.login(credentials);
                  setState(() => isLoading = false);
                  if (success) {
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Bem vindo de volta")),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Usuário ou senha inválidos"),
                      ),
                    );
                  }
                },
        style: FilledButton.styleFrom(
          foregroundColor: colorScheme.onSecondary,
          backgroundColor: colorScheme.secondary,
          padding:
              ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile
                  ? EdgeInsets.symmetric(vertical: 5, horizontal: 95)
                  : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              isLoading
                  ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  )
                  : Text(
                    'Entrar',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSecondary,
                    ),
                  ),
        ),
      ),
    );
  }

  Form buildForm(LoginViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      onChanged: _validateForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 9, bottom: 13),
                child: Text("Login", style: textTheme.bodyLarge),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _loginController,
                  decoration: InputDecoration(
                    hintText: 'Digite seu login',
                    filled: true,
                    constraints: BoxConstraints(maxWidth: 489),
                    fillColor: colorScheme.surfaceContainerLowest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ), // dá a borda Material
                  ),
                  validator: (String? value) {
                    final email = EmailModel(email: value ?? '');
                    final ValidationResult result = emailValidator.validate(
                      email,
                    );
                    if (result.isValid) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() => isEmailError = false);
                      });
                      return null;
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        isEmailError = true;
                        errorEmail = 'E-mail inválido, ex: joaosilva@gmail.com';
                      });
                    });
                    return null;
                  },
                  onChanged: (String text) {
                    setState(() {
                      isValid = _validateForm();
                    });
                  },
                ),
              ),
              if (isEmailError)
                Padding(
                  padding: const EdgeInsets.only(left: 9, top: 8),
                  child: Text(
                    errorEmail,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 9, bottom: 13),
                child: Text("Senha", style: textTheme.bodyLarge),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'Digite sua senha',
                    filled: true,
                    fillColor: colorScheme.surfaceContainerLowest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ), // dá a borda Material
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (String? value) {
                    final password = PasswordModel(password: value ?? '');
                    final ValidationResult result = senhaValidator.validate(
                      password,
                    );

                    if (result.isValid) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() => isSenhaError = false);
                      });
                      return null;
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        isSenhaError = true;
                        errorSenha = 'Deve conter 6 letras.';
                      });
                    });
                    return null;
                  },
                  onChanged: (String text) {
                    setState(() {
                      isValid = _validateForm();
                    });
                  },
                ),
              ),
              if (isSenhaError)
                Padding(
                  padding: const EdgeInsets.only(left: 9, top: 8),
                  child: Text(
                    errorSenha,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Column _helperButtons(LoginViewModel viewModel, TextTheme textTheme) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            AuthModals.recoverPassword(
              context: context,
              onSendPressed: (String email) {
                viewModel.sendToken(email);
              },
              onClose: () {
                viewModel.resetState();
              },
              tryAgain: () {
                viewModel.resetState();
              },
            );
          },
          style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
          child: Text(
            'Esqueci minha Senha',

            style: textTheme.bodyLarge?.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Text('Não possui conta?', style: textTheme.bodyLarge),
            TextButton(
              style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
              onPressed: () {
                RegisterRoute().pushReplacement(context);
              },
              child: Text(
                'Cadastre-se',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildIntro(context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HoverableLogo(
                      onTap: () => AboutUsRoute().go(context),
                      imagePath: 'assets/logo/logo_expanded_light.svg',
                      height: 114,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right:
              MediaQuery.of(context).size.width < 1240
                  ? MediaQuery.of(context).size.width * 0.12
                  : MediaQuery.of(context).size.width * 0.20,
          top:
              MediaQuery.of(context).size.width < 1240
                  ? MediaQuery.of(context).size.width * 0.60
                  : MediaQuery.of(context).size.width * 0.10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/login_register/login_notebook.png',
              height: 513,
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            'assets/login_register/login_decorativa.png',
            height: 150,
          ),
        ),
      ],
    );
  }
}
