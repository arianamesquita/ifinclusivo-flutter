import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/roles_custom_chip.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/roles_custom_filter_chip.dart';
import 'package:if_inclusivo/ui/pages/chat/user.dart';

import '../../chat/widgets/status_label.dart';
import 'contacts_custom_search_bar.dart';

class ContactsPopUp extends StatefulWidget {
  final List<User> contacts;
  final void Function(User contact) onTapContact;

  const ContactsPopUp({
    super.key,
    required this.contacts,
    required this.onTapContact,
  });

  @override
  State<ContactsPopUp> createState() => _ContactsPopUpState();
}

class _ContactsPopUpState extends State<ContactsPopUp> {

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Color(0xFFFFFFFF),
      insetPadding: const EdgeInsets.all(50), // deixar responsivo
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 46.0, right: 23.0, left: 23.0, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactsCustomSearchBar(),
            Divider(
              height: 2,
              color: Color(0xFFEAECF0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 24, bottom: 20, left: 24),
              child: RolesCustomFilterChips(),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.contacts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 0,),
                itemBuilder: (context, index) {
                  final contact = widget.contacts[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: contact.profileImageURL.isNotEmpty
                            ? NetworkImage(contact.profileImageURL)
                            : null,
                          child: Icon(Icons.person, size: 24),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: getValuesByStatus(contact.status).color,
                              border: Border.all(
                                color: Colors.white, // borda branca pra destacar do avatar
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Chip(
                      label: Text(
                          getValuesByRole(contact.role, context).label,
                          style: getValuesByRole(contact.role, context).textStyle
                      ),
                      backgroundColor: getValuesByRole(contact.role, context).backgroundColor,
                      shape: getValuesByRole(contact.role, context).border,
                    ),
                    title: Text(
                        contact.name,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      getValuesByStatus(contact.status).label,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.outline, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.of(context).pop(); // fecha o popup
                      widget.onTapContact(contact);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
