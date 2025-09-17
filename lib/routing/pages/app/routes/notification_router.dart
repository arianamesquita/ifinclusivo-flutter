part of '../../../app_router.dart';
@TypedGoRoute<NotificationRouter>(path: AppRoutes.notification)
class NotificationRouter extends GoRouteData with _$NotificationRouter {
  const NotificationRouter();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return DialogPage(
      builder: (_) => AlertDialog(
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