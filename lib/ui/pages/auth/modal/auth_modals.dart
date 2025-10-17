import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/validators/email_validador.dart';
import 'package:if_inclusivo/domain/validators/password_validator.dart';
import 'package:if_inclusivo/ui/pages/auth/modal/modal_auth_base.dart';
import 'package:if_inclusivo/ui/pages/auth/sign_in/viewModels/login_viewmodel.dart';
import 'package:lucid_validation/lucid_validation.dart';
import 'package:provider/provider.dart';

class AuthModals {
  AuthModals._();

  static Future<void> _showModal({
    required BuildContext context,
    required Widget builder,
    VoidCallback? onClose,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierColor: Color.fromRGBO(59, 105, 57, 0.5),

      builder: (context) {
        return builder;
      },
    ).whenComplete((){
      if(onClose != null) onClose;
    });
  }

  static Future<void> changePasswordSuccess({
    required BuildContext context
  }) {
    return _showModal(
      context: context,
      builder: ModalsAuthBase.small(
        context: context,
        type: ModalType.success,
        title: 'Sucesso',
        child: Row(
          spacing: 16,
          children: [
            ShaderMask(
              shaderCallback:
                  (bounds) => const LinearGradient(
                colors: [
                  Color(0xFF5AA397),
                  Color(0xFF9B74C5),
                ], // rosa → azul
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
            Flexible(
              child: Text(
                'Sua senha foi Alterada com sucesso',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> changePasswordError({required BuildContext context}) {
    return _showModal(
      context: context,
      builder: ModalsAuthBase.small(
        context: context,
        type: ModalType.error,
        title: 'Error',
        child: Row(
          spacing: 16,
          children: [
            Icon(
              Icons.cancel_outlined,
              color: Theme.of(context).colorScheme.error,
              size: 50,
            ),
            Flexible(
              child: Text(
                'Senha Atual Incorreta.',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> resetPasswordSuccess({
    required BuildContext context,
    void Function()? onButtonPressed,
  }) {
    return _showModal(
      context: context,
      builder: ModalsAuthBase.large(
        context: context,
        type: ModalType.success,
        title: 'Sucesso',
        child: Row(
          spacing: 16,
          children: [
            ShaderMask(
              shaderCallback:
                  (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFF5AA397),
                      Color(0xFF9B74C5),
                    ], // rosa → azul
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
            Flexible(
              child: Text(
                'Sua senha foi Alterada com sucesso',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
                maxLines: 5,
              ),
            ),
          ],
        ),
        buttonLabel: 'Ir para login',
        onButtonPressed: onButtonPressed,
      ),
    );
  }

  static Future<void> resetPasswordError({required BuildContext context}) {
    return _showModal(
      context: context,
      builder: ModalsAuthBase.small(
        context: context,
        type: ModalType.error,
        title: 'Error',
        child: Row(
          spacing: 16,
          children: [
            Icon(
              Icons.cancel_outlined,
              color: Theme.of(context).colorScheme.error,
              size: 50,
            ),
            Flexible(
              child: Text(
                'Não foi possível atualizar sua senha, tente mais tarde',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> userCreatedSuccess({required BuildContext context}) {
    return _showModal(
      context: context,
      builder: ModalsAuthBase.small(
        context: context,
        type: ModalType.success,
        title: 'Sucesso',
        child: Row(
          spacing: 16,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
              size: 50,
            ),
            Flexible(
              child: Text(
                'Usuário criado com sucesso!',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> recoverPassword({
    required BuildContext context,
    void Function(String)? onSendPressed,
    void Function()? tryAgain,
    VoidCallback? onClose,
  }) {
    return _showModal(
      context: context,
      onClose: onClose,
      barrierDismissible: true,
      builder: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return PopScope(
            canPop: viewModel.emailState != EmailState.loading,
            onPopInvokedWithResult: (bool c, dynamic){ if(onClose != null) onClose.call();},
            child: switch (viewModel.emailState) {
              EmailState.idle => _RecoverPasswordDialog(
                onSendPressed: onSendPressed,
                onClose: onClose,
              ),
              EmailState.loading => _loading(context: context),
              EmailState.success => _recoverPasswordSuccess(
                context: context,
                onClose: onClose,
              ),
              EmailState.error => _emailNotFound(
                context: context,
                onButtonPressed: tryAgain,
                onClose: onClose,
              ),
            },
          );
        },
      ),
    );
  }

  static Future<void> deleteAccount({
    required BuildContext context,
    void Function(String, BuildContext modalContext)? onSendPressed,
    void Function()? tryAgain,
    VoidCallback? onClose,
  }) {
    return _showModal(
      context: context,
      onClose: onClose,
      barrierDismissible: true,
      builder: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return _DeleteAccountDialog(
            onSendPressed: onSendPressed,
            onClose: onClose,
          );
        },
      ),
    );
  }

  static ModalsAuthBase _emailNotFound({
    required BuildContext context,
    void Function()? onButtonPressed,
    VoidCallback? onClose,
  }) {
    return ModalsAuthBase.large(
      context: context,
      type: ModalType.error,
      onClose: onClose,
      title: 'Error ao recuperar senha',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel_outlined,
            color: Theme.of(context).colorScheme.error,
            size: 50,
          ),
          Text(
            'E-mail não encontrado.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
      buttonLabel: 'Tentar novamente',
      onButtonPressed: onButtonPressed,
    );
  }

  static ModalsAuthBase _recoverPasswordSuccess({
    required BuildContext context,
    VoidCallback? onClose,
  }) {
    return ModalsAuthBase.small(
      context: context,
      type: ModalType.success,
      title: 'Recuperar senha',
      onClose: onClose,
      child: Row(
        spacing: 16,
        children: [
          ShaderMask(
            shaderCallback:
                (bounds) => const LinearGradient(
                  colors: [Color(0xFF5AA397), Color(0xFF9B74C5)], // rosa → azul
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
            child: const Icon(
              Icons.check_circle_outline_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
          Flexible(
            child: Text(
              'Enviamos um link para redefinição de senha no seu e-mail.',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
              maxLines: 8,
            ),
          ),
        ],
      ),
    );
  }

  static ModalsAuthBase _loading({required context}) {
    return ModalsAuthBase.small(
      context: context,
      type: ModalType.info,
      title: 'Carregando..',
      onClose: null,
      child: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _RecoverPasswordDialog extends StatefulWidget {
  final void Function(String email)? onSendPressed;
  final VoidCallback? onClose;

  const _RecoverPasswordDialog({this.onSendPressed, this.onClose});

  @override
  State<_RecoverPasswordDialog> createState() => _RecoverPasswordDialogState();
}

class _RecoverPasswordDialogState extends State<_RecoverPasswordDialog> {
  final _emailController = TextEditingController();
  bool _isEmailValid = false;
  final _resendValidator = EmailFieldValidator();

  @override
  void initState() {
    super.initState();
    // Adiciona um "ouvinte" que será acionado toda vez que o texto mudar.
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    // É crucial remover o ouvinte e limpar o controller para evitar vazamentos de memória.
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    // Pega o texto atual do campo.
    final modelToValidate = EmailModel(email: _emailController.text);
    final result = _resendValidator.validate(modelToValidate);
    final bool isValid = result.isValid;
    if (isValid != _isEmailValid) {
      setState(() {
        _isEmailValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalsAuthBase(
      modalType: ModalType.info,
      size: ModalSize.large,
      title: 'Recuperar senha',
      buttonLabel: 'Enviar link de recuperação',
      onClose: widget.onClose,
      onButtonPressed:
          _isEmailValid
              ? () {
                widget.onSendPressed?.call(_emailController.text);
              }
              : null,
      child: Column(
        spacing: 20,
        children: [
          Row(
            spacing: 16,
            children: [
              ShaderMask(
                shaderCallback:
                    (bounds) => const LinearGradient(
                      colors: [
                        Color(0xFF5AA397),
                        Color(0xFF9B74C5),
                      ], // rosa → azul
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: const Icon(
                  Icons.email_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Text(
                'Recuperar senha com e-mail cadastrado.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Digite seu e-mail cadastrado:',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onSubmitted: (String value) {
              if (_isEmailValid) {
                widget.onSendPressed?.call(_emailController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}


class _DeleteAccountDialog extends StatefulWidget {
  final void Function(String email, BuildContext context)? onSendPressed;
  final VoidCallback? onClose;

  const _DeleteAccountDialog({this.onSendPressed, this.onClose});

  @override
  State<_DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<_DeleteAccountDialog> {
  final _senhaController = TextEditingController();
  bool _isSenhaValid = false;

  @override
  void initState() {
    super.initState();
    // Adiciona um "ouvinte" que será acionado toda vez que o texto mudar.
    _senhaController.addListener(_validateSenha);
  }

  @override
  void dispose() {
    // É crucial remover o ouvinte e limpar o controller para evitar vazamentos de memória.
    _senhaController.removeListener(_validateSenha);
    _senhaController.dispose();
    super.dispose();
  }

  void _validateSenha() {
    // Pega o texto atual do campo.
    final modelToValidate = PasswordModel(password: _senhaController.text);
    final PasswordFieldValidator senhaValidator = PasswordFieldValidator();
    final ValidationResult result = senhaValidator.validate(modelToValidate);
    final bool isValid = result.isValid;
    if (isValid != _isSenhaValid) {
      setState(() {
        _isSenhaValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalsAuthBase(
      modalType: ModalType.error,
      size: ModalSize.large,
      title: 'Exclusão de conta',
      buttonLabel: 'Excluir conta',
      onClose: widget.onClose,
      onButtonPressed:
      _isSenhaValid
          ? () {
        widget.onSendPressed?.call(_senhaController.text, context);
      }
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            spacing: 16,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 50,
                color: Colors.red,
              ),
              Text(
                'A exclusão da conta é permanente e não pode ser desfeita.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Confirme sua senha: ',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(width: 15,),
              Expanded(
                child: TextField(
                  controller: _senhaController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Confirme sua senha: ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onSubmitted: (String value) {
                    if (_isSenhaValid) {
                      widget.onSendPressed?.call(_senhaController.text, context);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}