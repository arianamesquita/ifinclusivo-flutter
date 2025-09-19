import 'package:flutter/material.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/chat_app_bar.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/chat_footer.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/status_label.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

import '../../../../guards/roles.dart';
import '../../../../utils/date_utils.dart';

class Message {
  final String text;
  final bool isMe; // true = mensagem minha, false = mensagem recebida
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}

class MessagesArea extends StatefulWidget {
  const MessagesArea({super.key, required this.chatId});
  final String chatId;

  @override
  State<MessagesArea> createState() => _MessagesAreaState();
}

class _MessagesAreaState extends State<MessagesArea> {
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();


  void _handleSendMessage(String text) {
    setState(() {
      _messages.add(Message(text: text, isMe: true, timestamp: DateTime.now()));
    });

    _scrollToBottom();

    // Exemplo: resposta simulada do "outro lado"
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _messages.add(Message(text: "Recebi: $text", isMe: false, timestamp: DateTime.now()));
        });
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0, // 0 porque o ListView está reverso
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleResponsiveNavigation();
  }

  void _handleResponsiveNavigation() {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final isMobile = deviceType == DeviceScreenType.mobile;

    if (!isMobile) {
      // 🚀 saiu do mobile → volta para o layout desktop
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ConversationRouter(chatId: widget.chatId).go(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Column(
        children: [
          ChatAppBar(
            profileImageUrl: "url",
            name: "User ${widget.chatId}",
            role: Roles.ROLE_ALUNO_NAPNE,
            status: Status.OFFLINE,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView.builder(
                reverse: true,
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  // Mapeamento para índice cronológico original
                  final int origIndex = _messages.length - 1 - index;
                  final Message message = _messages[origIndex];

                  // isDifferentAuthor -> para espaçamento superior (início de um bloco)
                  final bool isDifferentAuthor = origIndex == 0 ||
                      _messages[origIndex - 1].isMe != message.isMe;

                  // isLastInBlock -> true se a próxima mensagem cronológica (mais nova) existe e for de outro autor,
                  // ou se esta é a última mensagem da lista (mais recente)
                  final bool isLastInBlock = origIndex == _messages.length - 1 ||
                      _messages[origIndex + 1].isMe != message.isMe;
                  return Column(
                    crossAxisAlignment: message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: message.isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5,
                          ),
                          child: Container(
                              margin: EdgeInsets.only(
                                top: isDifferentAuthor
                                    ? 26
                                    : 2, // mais espaço se mudou o autor
                                bottom: 2,
                                left: 0,
                                right: 0
                              ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: message.isMe
                                  ? Color(0xFFA84FCE)
                                  : Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(message.text, style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: message.isMe
                                  ? Color(0xFFFFFFFF)
                                  : Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ))
                          ),
                        ),
                      ),
                      if (isLastInBlock)
                        Padding(
                          padding: EdgeInsets.only(
                            left: message.isMe ? 0 : 12,
                            right: message.isMe ? 12 : 0,
                            top: 2,
                            bottom: 8,
                          ),
                          child: Text(
                            DateFormatUtil.formatMessageTimestamp(message.timestamp),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                    ],
                  );
                }
              ),
            ),
            ),
          ChatFooter(onSend: _handleSendMessage),
        ],
      ),
    );
  }
}
