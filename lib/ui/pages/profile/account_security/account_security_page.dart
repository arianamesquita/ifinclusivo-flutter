
import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/auth/modal/auth_modals.dart';
import 'package:if_inclusivo/ui/pages/profile/account_security/viewModels/account_security_viewmodel.dart';
import 'package:lucid_validation/lucid_validation.dart';
import 'package:provider/provider.dart';

import '../../../../domain/validators/password_validator.dart';
import '../../../../utils/responsive_utils.dart';

class AccountSecurityPage extends StatefulWidget{
  const AccountSecurityPage({super.key});

  @override
  State<AccountSecurityPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<AccountSecurityPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final PasswordFieldValidator senhaValidator = PasswordFieldValidator();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool isSenhaError = false;
  String errorSenha = '';
  bool isValid = false;
  bool isLoading = false;
  bool password1Visible = false;
  bool password2Visible = false;
  bool password3Visible = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  bool _validateForm() {
    return true;
    //final ValidationResult result = loginValidator.validate(loginModel);
    //return result.isValid;
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final fontScale = ResponsiveUtils.fontScale(context);

    return Consumer<AccountSecurityViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.surface,
              scrolledUnderElevation: 0,
              elevation: 0),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    if (deviceType == DeviceScreenType.desktop)
                      _buildIntro(context),
                    Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 40),
                                Text(
                                  "Segurança da Conta",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSurface,
                                    fontStyle: FontStyle.normal,
                                    fontSize: (Theme.of(context).textTheme.headlineMedium?.fontSize ?? 25) * fontScale,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Gerencie suas credenciais e opções de segurança",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(118, 80, 132, 1),
                                    fontStyle: FontStyle.normal,
                                    fontSize: (Theme.of(context).textTheme.headlineSmall?.fontSize ?? 20) * fontScale,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: deviceType == DeviceScreenType.desktop
                                      ? 800
                                      : deviceType == DeviceScreenType.tablet
                                      ? 500
                                      : constraints.maxWidth, // ocupa tela toda no mobile
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(80.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Alterar Senha",
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontStyle: FontStyle.normal,
                                          fontSize: (Theme.of(context).textTheme.headlineSmall?.fontSize ?? 23) * fontScale,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Form(
                                        key: _formKey,
                                        onChanged: _validateForm,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // ---------------- Campo Senha Atual ----------------
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                "Senha Atual",
                                                style: TextStyle(
                                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 18) * fontScale,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 6,
                                                    offset: Offset(0, 3),
                                                  )
                                                ],
                                              ),
                                              child: TextFormField(
                                                controller: _passwordController,
                                                style: const TextStyle(color: Color.fromRGBO(22, 29, 27, 1)),
                                                obscureText: !password1Visible,
                                                decoration: InputDecoration(
                                                  hintText: 'Digite sua senha atual',
                                                  filled: true,
                                                  fillColor: const Color.fromRGBO(252, 249, 248, 1),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  errorText: isSenhaError ? errorSenha : null,
                                                  suffixIcon: IconButton(
                                                    icon: Icon(password1Visible ? Icons.visibility_off : Icons.visibility),
                                                    onPressed: () {
                                                      setState(() {
                                                        password1Visible = !password1Visible;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  final password = PasswordModel(password: value ?? '');
                                                  final ValidationResult result = senhaValidator.validate(password);
                                                  if (result.isValid) {
                                                    setState(() => isSenhaError = false);
                                                    return null;
                                                  }
                                                  setState(() {
                                                    isSenhaError = true;
                                                    errorSenha = 'Deve conter 6 letras.';
                                                  });
                                                  return errorSenha;
                                                },
                                                onChanged: (String text) {
                                                  setState(() {
                                                    isValid = _validateForm();
                                                  });
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 20),

                                            // ---------------- Campo Nova Senha ----------------
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                "Nova Senha",
                                                style: TextStyle(
                                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 18) * fontScale,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 6,
                                                    offset: Offset(0, 3),
                                                  )
                                                ],
                                              ),
                                              child: TextFormField(
                                                controller: _newPasswordController,
                                                style: const TextStyle(color: Color.fromRGBO(22, 29, 27, 1)),
                                                obscureText: !password2Visible,
                                                decoration: InputDecoration(
                                                  hintText: 'Digite sua nova senha',
                                                  filled: true,
                                                  fillColor: const Color.fromRGBO(252, 249, 248, 1),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  errorText: isSenhaError ? errorSenha : null,
                                                  suffixIcon: IconButton(
                                                    icon: Icon(password2Visible ? Icons.visibility_off : Icons.visibility),
                                                    onPressed: () {
                                                      setState(() {
                                                        password2Visible = !password2Visible;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  final newpassword = PasswordModel(password: value ?? '');
                                                  final ValidationResult result = senhaValidator.validate(newpassword);
                                                  if (result.isValid) {
                                                    setState(() => isSenhaError = false);
                                                    return null;
                                                  }
                                                  setState(() {
                                                    isSenhaError = true;
                                                    errorSenha = 'Deve conter 6 letras.';
                                                  });
                                                  return errorSenha;
                                                },
                                                onChanged: (String text) {
                                                  setState(() {
                                                    isValid = _validateForm();
                                                  });
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 20),

                                            // ---------------- Confirmar Nova Senha ----------------
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                "Confirmar Nova Senha",
                                                style: TextStyle(
                                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 18) * fontScale,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 6,
                                                    offset: Offset(0, 3),
                                                  )
                                                ],
                                              ),
                                              child: TextFormField(
                                                controller: _confirmPasswordController,
                                                style: const TextStyle(color: Color.fromRGBO(22, 29, 27, 1)),
                                                obscureText: !password3Visible,
                                                decoration: InputDecoration(
                                                  hintText: 'Confirme sua nova senha',
                                                  filled: true,
                                                  fillColor: const Color.fromRGBO(252, 249, 248, 1),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  errorText: isSenhaError ? errorSenha : null,
                                                  suffixIcon: IconButton(
                                                    icon: Icon(password3Visible ? Icons.visibility_off : Icons.visibility),
                                                    onPressed: () {
                                                      setState(() {
                                                        password3Visible = !password3Visible;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  if (value == _newPasswordController.text) {
                                                    setState(() => isSenhaError = false);
                                                    return null;
                                                  }
                                                  setState(() {
                                                    isSenhaError = true;
                                                    errorSenha = 'Deve conter 6 letras.';
                                                  });
                                                  return errorSenha;
                                                },
                                                onChanged: (String text) {
                                                  setState(() {
                                                    isValid = _validateForm();
                                                  });
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 30),

                                            // ---------------- Botão Salvar ----------------
                                            SizedBox(
                                              width: double.infinity,
                                              child: ListenableBuilder(
                                                listenable: viewModel.updatePasswordCommand,
                                                builder: (context, _) {
                                                  final state = viewModel.updatePasswordCommand.value;
                                                  return ElevatedButton(
                                                    onPressed: state.isRunning ? null : () async {
                                                      await viewModel.updatePasswordCommand.execute(
                                                        UpdatePasswordRequestModel(
                                                            senhaAtual: _passwordController.text,
                                                            novaSenha: _newPasswordController.text)
                                                      );
                                                      if (state.isSuccess) {
                                                        AuthModals.changePasswordSuccess(context: context);
                                                      } else {
                                                        AuthModals.changePasswordError(context: context);
                                                      }
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: const Color.fromRGBO(76, 159, 132, 1),
                                                      foregroundColor: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(12.0),
                                                      child: state.isRunning
                                                          ? const SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child: CircularProgressIndicator(
                                                          color: Colors.white,
                                                          strokeWidth: 2,
                                                        ),
                                                      )
                                                          : Text(
                                                        'Salvar nova senha',
                                                        style: TextStyle(
                                                          fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 18) * fontScale,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              ),
                                            ),
                                            const SizedBox(height: 40),

                                            // ---------------- Excluir Conta ----------------
                                            Text(
                                              "Excluir Conta",
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.onSurface,
                                                fontStyle: FontStyle.normal,
                                                fontSize: (Theme.of(context).textTheme.headlineSmall?.fontSize ?? 23) * fontScale,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              "A exclusão da conta é permanente e não pode ser desfeita.",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(118, 80, 132, 1),
                                                fontStyle: FontStyle.normal,
                                                fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 20) * fontScale,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(height: 20),

                                            // ---------------- Botão Excluir ----------------
                                            SizedBox(
                                              width: double.infinity,
                                              child: ListenableBuilder(
                                                listenable: viewModel.deleteAccountCommand,
                                                builder: (context, _) {
                                                final state = viewModel.deleteAccountCommand.value;
                                                  return ElevatedButton(
                                                    onPressed: state.isRunning ? null : () async {
                                                      AuthModals.deleteAccount(
                                                          context: context,
                                                          onSendPressed: (senhadigitada, modalContext) async {
                                                            Navigator.pop(modalContext);
                                                            await viewModel.deleteAccountCommand.execute(
                                                                senhadigitada
                                                            );
                                                            final result = viewModel.deleteAccountCommand.value;
                                                            if(result.isSuccess){
                                                              AboutUsRoute().go(context);
                                                            } else if (result.isFailure){
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                  const SnackBar(content: Text('Senha incorreta.'))
                                                              );
                                                            }
                                                          }
                                                      );
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: const Color.fromRGBO(184, 31, 30, 1),
                                                      foregroundColor: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(12.0),
                                                      child: state.isRunning
                                                          ? const SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child: CircularProgressIndicator(
                                                          color: Colors.white,
                                                          strokeWidth: 2,
                                                        ),
                                                      )
                                                          : Text(
                                                        'Excluir conta',
                                                        style: TextStyle(
                                                          fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 18) * fontScale,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }
    );
  }


  _buildIntro(context) {
    return Stack(
      children: [
        Positioned(
          left:
          MediaQuery.of(context).size.width < 1240
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width * 0.55,
          top:
          MediaQuery.of(context).size.width < 1240
              ? MediaQuery.of(context).size.width * 0.60
              : MediaQuery.of(context).size.width * 0.10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/profile/profile1.png',
              height: 549,
            ),
          ),
        ),
      ],
    );
  }
}
