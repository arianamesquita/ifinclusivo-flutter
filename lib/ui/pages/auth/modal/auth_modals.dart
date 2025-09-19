import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/validators/email_validador.dart';
import 'package:if_inclusivo/ui/pages/auth/modal/modal_auth_base.dart';

class AuthModals {
  AuthModals._();

  static Future<void> resetPasswordSuccess({required BuildContext context,void Function()? onButtonPressed}) {
    return ModalsAuthBase.showLarge(
      context: context,
      type: ModalType.success,
      title: 'Sucesso',
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
              'Sua senha foi Alterada com sucesso',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
              maxLines: 5,
            ),
          ),
        ],
      ), buttonLabel: 'Ir para login', onButtonPressed: onButtonPressed,
    );
  }

  static Future<void> resetPasswordError({required BuildContext context}) {
    return ModalsAuthBase.showSmall(
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
    );
  }

  static Future<void> recoverPassword({
    required BuildContext context,
    void Function(String)? onSendPressed,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return _RecoverPasswordDialog(onSendPressed: onSendPressed);
      },
    );
  }

  static Future<void> emailNotFound({
    required BuildContext context,
    void Function()? onButtonPressed,
  }) {
    return ModalsAuthBase.showLarge(
      context: context,
      type: ModalType.error,
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

  static Future<void> recoverPasswordSuccess({required BuildContext context}) {
    return ModalsAuthBase.showSmall(
      context: context,
      type: ModalType.success,
      title: 'Recuperar senha',
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
}

class _RecoverPasswordDialog extends StatefulWidget {
  final void Function(String email)? onSendPressed;

  const _RecoverPasswordDialog({this.onSendPressed});

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
                style:Theme.of(context).textTheme.bodyMedium,
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
          ),
        ],
      ),
    );
  }
}
