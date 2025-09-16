import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/message_text_field.dart';

class ChatFooter extends StatefulWidget {
  const ChatFooter({super.key});

  @override
  State<ChatFooter> createState() => _ChatFooterState();
}

class _ChatFooterState extends State<ChatFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              spacing: 10,
              children: [
                Icon(
                  size: 25,
                  color: Color(0xFFA84FCE),
                  Icons.attach_file_rounded,
                ),
                Expanded(child: MessageTextField()),
                Icon(
                  size: 25,
                  color: Color(0xFFA84FCE),
                  Icons.camera_alt_rounded,
                ),
              ],
            )
        )
    );
  }
}
