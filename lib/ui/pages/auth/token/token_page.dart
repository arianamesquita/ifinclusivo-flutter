import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/auth/token/viewmodels/validate_token_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/auth/token/widgets/app_bar_token.dart';
import 'package:if_inclusivo/ui/pages/auth/token/widgets/header_token.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

import '../../../../domain/validators/email_validador.dart';

class TokenPage extends StatefulWidget {
  final String? token;

  const TokenPage({super.key, required this.token});
  @override
  State<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  final _resendEmailController = TextEditingController();
  bool _isResendEmailValid = false;
  final _resendValidator = EmailFieldValidator();

  @override
  void initState() {
    super.initState();
    // 2. Usamos o WidgetsBinding para garantir que o contexto esteja pronto.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.token != null) {
        context.read<ValidateTokenViewModel>().verifyEmail(widget.token!);
      } else {
        context
            .read<ValidateTokenViewModel>()
            .handleInvalidToken(); // Crie este método no ViewModel
      }
    });
    _resendEmailController.addListener(_validateResendEmail);
  }

  void _validateResendEmail() {
    final modelToValidate = EmailModel(email: _resendEmailController.text);
    final result = _resendValidator.validate(modelToValidate);
    final bool isValid = result.isValid;

    if (isValid != _isResendEmailValid) {
      setState(() {
        _isResendEmailValid = isValid;
      });
    }
  }
  @override
  void dispose() {
    _resendEmailController.dispose();
    super.dispose();
  }
  void _handleResendLink() async {
    if (!_isResendEmailValid) return;
    final viewModel = context.read<ValidateTokenViewModel>();
    final email = _resendEmailController.text;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Enviando solicitação...')),
    );
    final resultMessage = await viewModel.resendVerificationEmail(email);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(resultMessage)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceScreenType = ResponsiveUtils.getDeviceType(context);
    return Consumer<ValidateTokenViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBarToken(),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (deviceScreenType == DeviceScreenType.desktop)
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/exceptions/Figuras Decorativas.svg',
                    ),
                  ],
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 50,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildBody(
                        viewModel.state,
                        viewModel.errorMessage,
                        context,
                      ),
                    ],
                  ),
                ),
              ),
              if (deviceScreenType == DeviceScreenType.desktop)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/exceptions/Figuras Decorativas-1.svg',
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(
    TokenValidationState state,
    String errorMessage,
    BuildContext context,
  ) {
    switch (state) {
      case TokenValidationState.loading:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(strokeWidth: 7),
          ),
        );
      case TokenValidationState.success:
        return _buildSucesso(context);
      case TokenValidationState.invalidToken:
      case TokenValidationState.expiredToken:
      case TokenValidationState.serverError:
        return _buildError(errorMessage, context);
    }
  }

  _buildError(title, context) {
    return Column(
      spacing: 30,
      children: [
        HeaderToken(title: title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.shadow.withValues(alpha: 0.2),
                  offset: Offset(0, 5),
                  blurRadius: 15,
                ),
              ],
            ),
            width: 597,
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              spacing: 18,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity, // 🔹 ocupa toda a largura disponível
                  child: Container(
                    color: Theme.of(context).colorScheme.error,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12,
                      ),
                      child: Text(
                        'Falha!',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onError,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                SvgPicture.asset('assets/icons/fail.svg'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Text(
                    'Não foi possivel validar seu e-mail',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      Text(
                        'Digite seu e-mail cadastredo:',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: _resendEmailController,
                        decoration: InputDecoration(
                          hintText: 'exmplo@gmail.com',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 14,
                      left: 36,
                      right: 36,
                    ),
                    child: FilledButton(
                      onPressed: _isResendEmailValid ? _handleResendLink : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                      child: Text('Solicitar novo link'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSucesso(BuildContext context) {
    return Column(
      spacing: 30,
      children: [
        HeaderToken(title: 'Sucesso!', label: 'Seu E-mail foi confirmado'),
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.shadow.withValues(alpha: 0.2),
                      offset: Offset(0, 5),
                      blurRadius: 15,
                    ),
                  ],
                ),
                width: 597,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  spacing: 18,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width:
                          double.infinity, // 🔹 ocupa toda a largura disponível
                      child: Container(
                        color: Theme.of(context).colorScheme.primary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12,
                          ),
                          child: Text(
                            'Sucesso!',
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Image.asset('assets/icons/check.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: Text(
                        'Sua Conta doi validada com sucesso. agora você pode acessar normalmente.',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 14,
                          left: 36,
                          right: 36,
                        ),
                        child: FilledButton(
                          onPressed: () => LoginRoute().go(context),
                          style: FilledButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.titleMedium,
                          ),
                          child: Text('Ir para login'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SvgPicture.asset('assets/icons/Sent Message-amico 1.svg'),
          ],
        ),
      ],
    );
  }
}
