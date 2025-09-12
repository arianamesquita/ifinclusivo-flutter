import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../utils/date_utils.dart';

enum RolesChip { PROFESSOR, TUTOR, ALUNO_NAPNE, INTERPRETE }

class ContactCard extends StatefulWidget {
  final String profileImageUrl;
  final String name;
  final String lastMessage;
  final RolesChip role;
  final VoidCallback? onTap;
  final int? unreadMessagesCount;
  final DateTime lastMessageDate;

  const ContactCard({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.lastMessage,
    required this.role,
    this.onTap,
    this.unreadMessagesCount,
    required this.lastMessageDate,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  late DateTime lastMessageState;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    lastMessageState = widget.lastMessageDate;

    _timer = Timer.periodic(Duration(seconds: 20), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final values = _getValuesByRole(widget.role, context);

    return Material(
      color: (widget.unreadMessagesCount != null && widget.unreadMessagesCount! > 0)
          ? Color(0xFFC8FFC0)
          : Color.fromRGBO(97, 94, 240, 0.04),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage:
                          widget.profileImageUrl.isNotEmpty
                              ? NetworkImage(widget.profileImageUrl)
                              : null,
                      child: Icon(Icons.person, size: 28),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.lastMessage,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Chip(
                              label: Text(values.label, style: values.textStyle),
                              backgroundColor: values.backgroundColor,
                              shape: values.border,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    TimeAgoUtil.timeAgo(lastMessageState),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Só mostra o contador se houver mensagens não lidas
                  if (widget.unreadMessagesCount != null &&
                      widget.unreadMessagesCount! > 0)
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green, // mudar para secondary
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0, left: 4.0, right: 4.0, top: 2.0),
                            child: Center(child: Icon(Icons.warning_rounded, size: 14, color: Theme.of(context).colorScheme.onSecondary)),
                          ),
                        ),
                        Text(
                          widget.unreadMessagesCount.toString(),
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.green, // mudar para secondary
                          ),
                        ),
                      ],
                    )
                  else
                    const SizedBox(
                      height: 20,
                    ), // Placeholder para manter o alinhamento se não houver contador
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChipValues {
  final String label;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final StadiumBorder? border;

  _ChipValues(this.label, this.textStyle, this.backgroundColor, this.border);
}

_ChipValues _getValuesByRole(RolesChip role, BuildContext context) {
  TextStyle? baseStyle = Theme.of(
    context,
  ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold);

  switch (role) {
    case RolesChip.PROFESSOR:
      return _ChipValues(
        "Professor",
        baseStyle?.copyWith(color: Color(0xFFDD6B20)),
        Color(0xFFFEEBC8),
        StadiumBorder(side: BorderSide(color: Color(0xFFFEEBC8), width: 1)),
      );
    case RolesChip.TUTOR:
      return _ChipValues(
        "Tutor",
        baseStyle?.copyWith(color: Color(0xFF718096)),
        Color.fromRGBO(97, 94, 240, 0.04),
        StadiumBorder(side: BorderSide(color: Color(0xFFCBD5E0), width: 1)),
      );
    case RolesChip.ALUNO_NAPNE:
      return _ChipValues(
        "Aluno",
        baseStyle?.copyWith(color: Color(0xFF38A169)),
        Color(0xFFC6F6D5),
        StadiumBorder(side: BorderSide(color: Color(0xFFC6F6D5), width: 1)),
      );
    case RolesChip.INTERPRETE:
      return _ChipValues(
        "Intérprete",
        baseStyle?.copyWith(color: Color(0xFF275C7C)),
        Color(0xFFC6F6D5),
        StadiumBorder(side: BorderSide(color: Color(0xFFC6F6D5), width: 1)),
      );
  }
}
