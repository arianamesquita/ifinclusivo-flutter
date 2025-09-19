import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/contact_card.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/messages_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/contacts_pop_up.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/roles_custom_filter_chip.dart';
import 'package:if_inclusivo/ui/pages/chat/user.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

import '../../../../guards/roles.dart';
import '../../../../routing/app_router.dart';
import '../chat/widgets/status_label.dart';

class ContactsSideBarPage extends StatefulWidget {
  final void Function(String chatId) onTapContact;
  const ContactsSideBarPage({super.key, required this.onTapContact});

  @override
  State<ContactsSideBarPage> createState() => _ContactsSideBarPageState();
}

class _ContactsSideBarPageState extends State<ContactsSideBarPage> {
  final List<ContactCard> _contacts = [];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    final int unreadMessagesCount =
        _contacts.where((contact) => contact.unreadMessagesCount! > 0).length;

    return Container(
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
                          color: Color(0xFFEDF2F7),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            unreadMessagesCount.toString(),
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => ContactsPopUp(
                            contacts: [
                              User(
                                name: "Maria Silva",
                                profileImageURL:
                                    "https://via.placeholder.com/150",
                                role: Roles.ROLE_TUTOR,
                                status: Status.ONLINE,
                                chatId: counter++,
                              ),
                              User(
                                name: "João de Barros",
                                profileImageURL:
                                    "https://via.placeholder.com/150",
                                role: Roles.ROLE_PROFESSOR,
                                status: Status.OFFLINE,
                                chatId: counter++,
                              ),
                              User(
                                name: "Ananda",
                                profileImageURL:
                                    "https://via.placeholder.com/150",
                                role: Roles.ROLE_ALUNO_NAPNE,
                                status: Status.OFFLINE,
                                chatId: counter++,
                              ),
                              User(
                                name: "Fernanda",
                                profileImageURL:
                                    "https://via.placeholder.com/150",
                                role: Roles.ROLE_INTERPRETE,
                                status: Status.AUSENTE,
                                chatId: counter++,
                              ),
                            ],
                            onTapContact: (contact) {
                              setState(() {
                                _contacts.add(
                                  ContactCard(
                                    name: contact.name,
                                    profileImageUrl: contact.profileImageURL,
                                    role: contact.role,
                                    unreadMessagesCount: 0,
                                    lastMessage: "Novo contato adicionado!",
                                    lastMessageDate: DateTime.now(),
                                    onTap: () {
                                      widget.onTapContact(contact.chatId.toString());
                                    },
                                  ),
                                );
                              });
                            },
                          ),
                    );
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFFA84FCE),
                  shape: CircleBorder(),
                  mini: true,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFFE2EBDD), thickness: 2),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Column(
                      children: [
                        MessagesCustomSearchBar(),
                        SizedBox(height: 20.0),
                        RolesCustomFilterChips(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child:
                        _contacts.isEmpty
                            ? Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Text(
                                "Clique em '+' para inciar uma conversa!",
                                textAlign: TextAlign.center,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleSmall?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outline,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                            : ListView.separated(
                              shrinkWrap: true,
                              itemCount: _contacts.length,
                              itemBuilder: (context, index) {
                                return _contacts[index];
                              },
                              separatorBuilder: ((context, index) {
                                return const SizedBox(height: 8.0);
                              }),
                            ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
