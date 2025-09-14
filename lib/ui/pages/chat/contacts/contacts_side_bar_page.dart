import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/contact_card.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/contacts_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/roles_custom_filter_chip.dart';

import '../../../../guards/roles.dart';

class ContactsSideBarPage extends StatelessWidget {
  const ContactsSideBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      ContactCard(
        profileImageUrl: "https://via.placeholder.com/150",
        name: "Maria Silva",
        lastMessage: "Oi, tudo bem?",
        role: Roles.ROLE_TUTOR,
        unreadMessagesCount: 2,
        lastMessageDate: DateTime.now().subtract(const Duration(minutes: 5)),
        onTap: () => print("Clicou em Maria"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_ALUNO_NAPNE,
        unreadMessagesCount: 3,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_INTERPRETE,
        unreadMessagesCount: 1,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_PROFESSOR,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
      ContactCard(
        profileImageUrl: "",
        name: "João Oliveira",
        lastMessage: "Pode me ajudar?",
        role: Roles.ROLE_ALUNO_NAPNE,
        unreadMessagesCount: 0,
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
        onTap: () => print("Clicou em João"),
      ),
    ];

    final int unreadMessagesCount = contacts.where((contato) => contato.unreadMessagesCount! > 0).length;

    return Expanded(
      child: Container(
        color: Color(0xFFF6FFF0),
        child: Column(
          children: [
            Padding(
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
            Divider(
              color: Color(0xFFE2EBDD),
              thickness: 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                children: [
                  ContactsCustomSearchBar(),
                  SizedBox(height: 20.0,),
                  RolesCustomFilterChips(),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return contacts[index];
                },
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    height: 8.0,
                  );
                }),
              ),
            )
          ]
        ),
      ),
    );
  }
}