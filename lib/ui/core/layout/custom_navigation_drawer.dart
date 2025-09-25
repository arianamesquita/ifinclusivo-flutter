import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

import '../../../routing/app_router.dart';
import '../widgets/hoverable_logo.dart';

class CustomNavigationDrawer extends StatefulWidget {
  final int selectedIndex;
  final Function(int)? onDestinationSelected;
  final List<NavigationDrawerDestination> destinations;
  final bool isLoggedIn;
  final void Function()? onPressedMenu;
  const CustomNavigationDrawer({
    super.key,
    required this.selectedIndex,
    this.onDestinationSelected,
    required this.destinations,
    required this.isLoggedIn,
    required this.onPressedMenu,
  });

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    final bool isSelected = GoRouter.of(
      context,
    ).state.uri.path.startsWith(NotificationRouter().location);
    return NavigationDrawer(
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onDestinationSelected,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      indicatorColor: Theme.of(context).colorScheme.primary,
      header: _buildLeading(context),
      footer: _buildTrailing(context),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Divider(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        if (widget.isLoggedIn)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FilledButton(
              onPressed: () {
                isSelected
                    ? context.pop()
                    : context.push(NotificationRouter().location);
              },
              style: FilledButton.styleFrom(
                backgroundColor:
                    isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                foregroundColor:
                    isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onTertiary,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                overlayColor: isSelected ? null : Colors.transparent,
                shadowColor: isSelected ? null : Colors.transparent,
              ),
              child: Row(
                spacing: 12,
                children: [
                  Icon(
                    isSelected
                        ? Icons.notifications
                        : Icons.notifications_outlined,
                    size: 24,
                  ),
                  Text(
                    'Notificações',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ...widget.destinations,
        Padding(padding: const EdgeInsets.all(16.0), child: Divider()),
      ],
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: widget.onPressedMenu,
                icon: Icon(
                  Icons.menu_open,
                  size: 24,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ),

              HoverableLogo(
                imagePath: 'assets/logo/logo_expanded_light.svg',
                height: 80,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    final repository = context.read<AuthRepository>();
    return Column(
      children: [
        if (widget.isLoggedIn)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: FilledButton(
              onPressed: () => repository.logout(),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              ),
              child: Row(
                spacing: 12,
                children: [
                  Icon(Icons.logout, size: 24),
                  Text(
                    'Sair',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: FilledButton(
              onPressed: ()=> LoginRoute().push(context),
              style: FilledButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.onTertiaryContainer,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              ),
              child: Row(
                spacing: 12,
                children: [
                  Icon(Icons.login, size: 24),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
