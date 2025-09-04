import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final List<String>? destinations; // pode ser string para simplificar

  const CustomAppBar({
    super.key,
    this.selectedIndex = 0,
    this.onDestinationSelected,
    this.destinations,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(129);
}

class _CustomAppBarState extends State<CustomAppBar> {

  late List<String> _items;

  @override
  void initState() {
    super.initState();
    // Se não vier nada, usa padrão
    _items = widget.destinations ??
        ['Fórum', 'Libras', 'Tópicos', 'Chat'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.tertiary),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 14.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/logo_oficial.png',
                  height: 100,
                ),
              ),
            ),

            Expanded(
              flex: 3,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1265),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          _items.length,
                              (index) => NavigateItem(
                            label: _items[index],
                            isSelect: widget.selectedIndex == index,
                            onTap: () =>
                                widget.onDestinationSelected?.call(index),
                          ),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {},
                          label: Text('Usuario '),
                          icon: Icon(Icons.account_circle_outlined),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(229, 53),
                            iconSize: 32,
                            padding: EdgeInsets.symmetric(
                              vertical: 10.5,
                              horizontal: 13.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            backgroundColor: Color.fromRGBO(98, 191, 98, 100),
                            foregroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                            textStyle: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigateItem extends StatefulWidget {
  final String label;
  final bool isSelect;
  final VoidCallback onTap;
  final String? tooltip; // Tooltip opcional

  const NavigateItem({
    super.key,
    required this.label,
    required this.isSelect,
    required this.onTap,
    this.tooltip,
  });

  @override
  State<NavigateItem> createState() => _NavigateItemState();
}

class _NavigateItemState extends State<NavigateItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Cores para estados selecionado/não selecionado
    final backgroundColor = widget.isSelect
        ? colorScheme.primary
        : colorScheme.tertiaryContainer;

    final textColor = widget.isSelect
        ? colorScheme.onPrimary
        : colorScheme.onTertiaryContainer;

    // Hover: apenas uma leve variação na cor
    final hoverColor = widget.isSelect
        ? colorScheme.primary.withValues(alpha: 0.7)
        : colorScheme.tertiaryContainer.withValues(alpha: 0.7);

    final content = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      height: 47,
      width: 159,
      decoration: BoxDecoration(
        color: _isHovering ? hoverColor : backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        style: textTheme.titleLarge!.copyWith(color: textColor),
        child: Text(widget.label, textAlign: TextAlign.center),
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.tooltip != null
            ? Tooltip(
          message: widget.tooltip!,
          child: content,
        )
            : content,
      ),
    );
  }
}

