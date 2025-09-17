import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/chat/contacts/widgets/roles_custom_chip.dart';
import '../../../../../guards/roles.dart';

class RolesCustomFilterChips extends StatefulWidget {
  const RolesCustomFilterChips({super.key});

  @override
  State<RolesCustomFilterChips> createState() => _RolesCustomFilterChipsState();
}

class _RolesCustomFilterChipsState extends State<RolesCustomFilterChips> {
  final Set<Roles> _selectedRoles = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Roles.values.map((role) {
          final values = getValuesByRole(role, context);
          final isSelected = false;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(
                values.label,
                style: values.textStyle,
              ),
              backgroundColor: values.backgroundColor,
              shape: values.border,
              selected: isSelected,
              showCheckmark: false,
              // não mostra o "check"
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedRoles.add(role);
                  } else {
                    _selectedRoles.remove(role);
                  }
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
