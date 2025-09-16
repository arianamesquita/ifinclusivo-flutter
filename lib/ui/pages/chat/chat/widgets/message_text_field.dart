import 'package:flutter/material.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({super.key});

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.send_rounded, color: Color(0xFFA84FCE), size: 20,)),
        hintText: "Digite a mensagem",
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.outline,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          //borderSide: BorderSide(color: Color(0xFFA84FCE), width: 10.0), não está funcionando
        )
      )
    );
  }
}
