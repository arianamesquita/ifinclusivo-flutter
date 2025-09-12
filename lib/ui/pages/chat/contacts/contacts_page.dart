import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/contact_card.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contatos = [
      ContactCard(
        profileImageUrl: "https://via.placeholder.com/150",
        name: "Maria Silva",
        lastMessage: "Oi, tudo bem?",
        role: RolesChip.PROFESSOR,
        unreadMessagesCount: 2,
        lastMessageDate: DateTime.now().subtract(const Duration(minutes: 5)),
        onTap: () => print("Clicou em Maria"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 3,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 1,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: RolesChip.ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
    ];

    final int unreadMessagesCount = contatos.where((contato) => contato.unreadMessagesCount! > 0).length;

    return Column(
      children: [
        Container(
          color: Color(0xFFF6FFF0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Mensagens",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFEDF2F7)
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            unreadMessagesCount.toString(),
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          )
                        ),
                      ),
                    ]
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFFA84FCE),
                  shape: CircleBorder(),
                  mini: true,
                  child: Icon(Icons.add),
                ),
              ],
            )
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 2,
        ),
        Container(
          color: Color(0xFFF6FFF0),
          child: Padding (
            padding: const EdgeInsets.all(24.0),
            child: Row (
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SearchBar(
                      ),
                    ],
                  ),
                )
              ]
            )
          ),
        ),
        Expanded(
          child: ListView(
            children: contatos,
          ),
        ),
      ]
    );
  }
}