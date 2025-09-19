import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/core/widgets/hoverable_logo.dart';
import 'package:if_inclusivo/ui/pages/auth/modal/auth_modals.dart';
import 'package:if_inclusivo/ui/pages/auth/reset_password/viewmodels/reset_password_viewmodel.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  final String? token;
  const ResetPasswordPage({super.key, this.token});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _arePasswordsValid = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePasswords);
    _confirmPasswordController.addListener(_validatePasswords);
  }

  @override
  void dispose() {
    _passwordController.removeListener(_validatePasswords);
    _confirmPasswordController.removeListener(_validatePasswords);
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswords() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    final bool isValid = password.length >= 6 && password == confirmPassword;

    if (isValid != _arePasswordsValid) {
      setState(() {
        _arePasswordsValid = isValid;
      });
    }
  }

  void _updatePassword() {
    if (!_arePasswordsValid) return;

    FocusScope.of(context).unfocus();

    final viewModel = Provider.of<ResetPasswordViewModel>(
      context,
      listen: false,
    );

    final token = widget.token ?? '';
    final newPassword = _passwordController.text;

    viewModel.verifyEmail(token, newPassword);
  }

  void _setupListener(BuildContext context, ResetPasswordViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (viewModel.state) {
        case ResetPasswordState.success:
          AuthModals.resetPasswordSuccess(
            context: context,
            onButtonPressed: () => LoginRoute().go(context),
          );
          viewModel.resetState();
          break;
        case ResetPasswordState.invalidToken:
        case ResetPasswordState.expiredToken:
        case ResetPasswordState.serverError:
          AuthModals.resetPasswordError(context: context);
          viewModel.resetState();
          break;
        default:
          // Não faz nada nos outros estados (idle, loading)
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordViewModel>(
      builder: (context, viewModel, child) {
        _setupListener(context, viewModel);
        return Scaffold(
          appBar: AppBar(
            title: HoverableLogo(
              imagePath: 'assets/logo/logo_expanded_light.svg',
              height: 90,
              onTap: () {},
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            toolbarHeight: 100,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            foregroundColor: Theme.of(context).colorScheme.onTertiary,
            child: Icon(Icons.help_outline_rounded),
          ),
          body:
              viewModel.state == ResetPasswordState.loading
                  ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(strokeWidth: 7),
                      ),
                    ),
                  )
                  : _buildBody(context),
        );
      },
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Redefinir Senha',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _buildContainerPassword(),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: SvgPicture.asset('assets/icons/Login-bro 1.svg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildContainerPassword() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 557),
        child: Column(
          spacing: 20,
          children: [
            _buildPasswordField(
              context: context,
              controller: _passwordController,
              labelText: 'Nova senha',
              isVisible: _isPasswordVisible,
              onVisibilityToggle: () {
                setState(() => _isPasswordVisible = !_isPasswordVisible);
              },
            ),

            _buildPasswordField(
              context: context,
              controller: _confirmPasswordController,
              labelText: 'Confirmar nova senha',
              isVisible: _isConfirmPasswordVisible,
              onVisibilityToggle: () {
                setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed:  _arePasswordsValid ? _updatePassword : null,
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Salvar nova senha'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextField(
          controller: controller,
          obscureText: !isVisible, // Controla a visibilidade do texto
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            suffixIcon: IconButton(
              icon: Icon(
                // Muda o ícone baseado na visibilidade
                isVisible ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: onVisibilityToggle,
            ),
          ),
        ),
      ],
    );
  }
}
