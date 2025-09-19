import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/message_text_field.dart';

class ChatFooter extends StatelessWidget  {
  final Function(String) onSend;

  const ChatFooter({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
              Expanded(child: MessageTextField(onSend: onSend)),
              Icon(
                size: 25,
                color: Color(0xFFA84FCE),
                Icons.camera_alt_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
