import 'package:flutter/material.dart';

// Um modelo simples para representar uma mensagem
class Message {
  final String text;
  final bool isSentByMe; // Para diferenciar mensagens do usuário atual e do outro
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isSentByMe,
    required this.timestamp,
  });
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> _messages = []; // Lista para armazenar as mensagens
  final TextEditingController _textController = TextEditingController(); // Controlador para o campo de texto
  final ScrollController _scrollController = ScrollController(); // Para rolar para a última mensagem

  void _sendMessage() {
    if (_textController.text.trim().isEmpty) {
      return; // Não envia mensagens vazias
    }

    final message = Message(
      text: _textController.text.trim(),
      isSentByMe: true, // Assumindo que esta é a mensagem do usuário atual
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(message);
      _textController.clear(); // Limpa o campo de texto após o envio
    });

    // Rola para a última mensagem
    // Adiciona um pequeno delay para garantir que o ListView foi reconstruído
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    // Simular uma resposta automática (opcional, para teste)
    _simulateResponse(message.text);
  }

  void _simulateResponse(String originalMessageText) {
    // Adiciona um pequeno delay para a resposta não ser instantânea
    Future.delayed(const Duration(seconds: 1), () {
      final response = Message(
        text: "Recebi sua mensagem: '$originalMessageText'",
        isSentByMe: false, // Mensagem do "outro"
        timestamp: DateTime.now(),
      );
      setState(() {
        _messages.add(response);
      });
      // Rola para a última mensagem novamente após a resposta
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Simples'),
      ),
      body: Column(
        children: <Widget>[
          // Área das mensagens
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                // Determina o alinhamento da mensagem com base em quem enviou
                final alignment = message.isSentByMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start;
                final bubbleColor = message.isSentByMe
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey[300];
                final textColor = message.isSentByMe ? Colors.black87 : Colors.black87; // Ou Colors.white para fundos escuros

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: alignment,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: bubbleColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          // Formatar o timestamp como desejar
                          "${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Área de entrada de texto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (text) => _sendMessage(), // Enviar com a tecla "Enter" do teclado
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
