import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/chat_app_bar.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/chat_footer.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/status_label.dart';

import '../../../../guards/roles.dart';


class MessagesArea extends StatefulWidget {
  const MessagesArea({super.key});

  @override
  State<MessagesArea> createState() => _MessagesAreaState();
}

class _MessagesAreaState extends State<MessagesArea> {

  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add(_controller.text.trim());
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: Column(
          children: [
            ChatAppBar(profileImageUrl: "url", name: "Florêncio Mares", role: Roles.ROLE_ALUNO, status: Status.ONLINE),
            // Padding(
            //   padding: EdgeInsets.all(24.0),
            //   child: Expanded(
            //     child: ListView.builder(
            //       reverse: true,
            //       itemCount: _messages.length,
            //       itemBuilder: (context, index) {
            //         final message = _messages[(_messages.length - 1) - index];
            //         return Align(
            //           alignment: index % 2 == 0
            //               ? Alignment.centerRight
            //               : Alignment.centerLeft,
            //           child: Container(
            //             margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            //             padding: const EdgeInsets.all(12),
            //             decoration: BoxDecoration(
            //               color: index % 2 == 0
            //                   ? Theme.of(context).colorScheme.primary
            //                   : Theme.of(context).colorScheme.secondary,
            //               borderRadius: BorderRadius.circular(12.0),
            //             ),
            //             child: Text(message, style: Theme.of(context).textTheme.titleMedium?.copyWith(
            //               color: Theme.of(context).colorScheme.onSurface,
            //               fontWeight: FontWeight.w600,
            //             ))
            //           ),
            //         );
            //       }
            //     ),
            //   ),
            // ),
            ChatFooter(),
          ],
        ),
      ),
    );
  }
}
