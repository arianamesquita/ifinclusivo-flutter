import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/widgets/status_label.dart';

import '../../../../../guards/roles.dart';
import '../../contacts/widgets/roles_custom_chip.dart';

class ChatAppBar extends StatefulWidget {
  final String profileImageUrl;
  final String name;
  final Roles role;
  final Status status;

  const ChatAppBar({
  super.key,
  required this.profileImageUrl,
  required this.name,
  required this.role,
  required this.status,
  });

  @override
  State<ChatAppBar> createState() => _ChatAppBarState();
}

// exemplo: ChatAppBar(profileImageUrl: "url", name: "Florêncio Mares", role: Roles.ROLE_ALUNO, status: Status.ONLINE)

class _ChatAppBarState extends State<ChatAppBar> {
  @override
  Widget build(BuildContext context) {
    final chipValues = getValuesByRole(widget.role, context);
    final statusLabelValues = getValuesByStatus(widget.status);

    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage:
                    widget.profileImageUrl.isNotEmpty
                        ? NetworkImage(widget.profileImageUrl)
                        : null,
                    child: Icon(Icons.person, size: 24),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: statusLabelValues.color,
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              statusLabelValues.label,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.outline, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Chip(
              label: Text(chipValues.label, style: chipValues.textStyle),
              backgroundColor: chipValues.backgroundColor,
              shape: chipValues.border,
            ),
          ],
        ),
      ),
    );
  }
}
