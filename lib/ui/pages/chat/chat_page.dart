import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/contacts_side_bar_page.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    DeviceScreenType deviceScreenType = ResponsiveUtils.getDeviceType(context);

    return deviceScreenType == DeviceScreenType.mobile
        ? ContactsSideBarPage(
          onTapContact:
              (id) => MobileConversationRoute(chatId: id).push(context),
        )
        : Shortcuts(
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.escape): const ActivateIntent(),
          },
          child: Actions(
            actions: {
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (intent) {
                  ChatRouter().go(context);
                  return null;
                },
              ),
            },
            child: Focus(
              autofocus: true,
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 380,
                      minWidth: 250,
                    ),
                    child: ContactsSideBarPage(
                      onTapContact:
                          (id) => ConversationRouter(chatId: id).go(context),
                    ),
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 350),
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleResponsiveNavigation();
  }

  void _handleResponsiveNavigation() {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final isMobile = deviceType == DeviceScreenType.mobile;
    final state = GoRouterState.of(context);
    final chatId = state.pathParameters['chatId'];

    if (isMobile && chatId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          MobileConversationRoute(chatId: chatId).push(context);
        }
      });
    }
  }
}
