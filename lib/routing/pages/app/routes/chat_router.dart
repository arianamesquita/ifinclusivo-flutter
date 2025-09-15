part of '../../../app_router.dart';


class ChatShell extends StatefulShellRouteData{
  const ChatShell();

  @override
  Widget builder(
      BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,
      ) {
    return  ChatPage(child: navigationShell);
  }
}

// Definições das rotas que o shell interno vai controlar
class ChatRouter extends GoRouteData  with _$ChatRouter{
  const ChatRouter();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    // Esta é a tela que aparece quando nenhuma conversa está selecionada (rota /chat)
    return const Center(
        child: Text('Selecione uma conversa para começar'));
  }
}


class ConversationRouter extends GoRouteData with _$ConversationRouter {
  const ConversationRouter({required this.chatId});
  final String chatId;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    // Esta é a tela da conversa em si (rota /chat/123)
    return MessagesArea(chatId: chatId);
  }
}


@TypedGoRoute<MobileConversationRoute>(path: '${AppRoutes.chat}/con/:chatId')
class MobileConversationRoute extends GoRouteData with _$MobileConversationRoute {
  const MobileConversationRoute({required this.chatId});
  final String chatId;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(body: MessagesArea(chatId: chatId));
  }
}
