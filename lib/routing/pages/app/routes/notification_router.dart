import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/dialog_page.dart';
import '../../../app_router.dart';


class NotificationRouter extends GoRouteData with $NotificationRouter{
  const NotificationRouter();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // Retorna nossa página de Dialog customizada
    return DialogPage(
      builder: (_) => AlertDialog( // Ou qualquer outro widget de popup
        title: const Text('Notificações'),
        content: const Text('Aqui estão suas novas notificações.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('FECHAR'),
          ),
        ],
      ),
    );
  }
}