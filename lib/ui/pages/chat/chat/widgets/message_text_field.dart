import 'package:flutter/material.dart';

class MessageTextField extends StatefulWidget {
  final Function(String) onSend;
  const MessageTextField({super.key, required this.onSend});

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // controla o foco


  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty)
      return;

    widget.onSend(text); // avisa o pai (ChatFooter) que o usuário enviou uma mensagem
    _controller.clear();

    // mantém o foco ativo
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onSubmitted: (_) => _handleSend(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        suffixIcon: IconButton(
            onPressed: _handleSend, // chama a função de enviar e mantém foco
            icon: Icon(Icons.send_rounded, color: Color(0xFFA84FCE), size: 20,)),
        hintText: "Digite a mensagem",
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.outline,
        ),

        // borda quando não está focado
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 2.0),
        ),

        // borda quando está focado
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFFA84FCE), width: 1.5),
        ),

        // fallback (caso algo dê errado)
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      )
    );
  }
}
