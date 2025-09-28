import 'package:flutter/material.dart';

class SortDropdownButton extends StatelessWidget {
  final List<String> menuItems;
  final String selectedItem;
  final ValueChanged<String> onSelected;
  const SortDropdownButton({
    super.key,
    required this.menuItems,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder:
          (BuildContext context) =>
              menuItems.map((item) {
                return PopupMenuItem<String>(value: item, child: Text(item));
              }).toList(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(
            8.0,
          ), // Deixa as bordas arredondadas
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
              selectedItem, // Mostra o valor selecionado
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ],
        ),
      ),
    );
  }
}
