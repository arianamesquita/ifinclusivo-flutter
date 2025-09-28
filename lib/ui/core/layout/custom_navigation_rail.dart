import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/core/widgets/hoverable_logo.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/auth_repository.dart';

class CustomNavigationRail extends StatefulWidget {
  final int selectedIndex;
  final Function(int)? onDestinationSelected;
  final List<NavigationRailDestination> destinations;
  final bool isLoggedIn;
  final void Function()? onPressedMenu;
  const CustomNavigationRail({
    super.key,
    required this.selectedIndex,
    this.onDestinationSelected,
    required this.destinations,
    required this.isLoggedIn,
    required this.onPressedMenu,
  });

  @override
  State<CustomNavigationRail> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  final ScrollController _railScrollController = ScrollController();

  @override
  void dispose() {
    _railScrollController.dispose();
    super.dispose();
  }

  final double _railWidth = 96;
  final double _scrollbarThickness = 8;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = GoRouter.of(
      context,
    ).state.uri.path.startsWith(NotificationRouter().location);

    return SizedBox(
      width: _railWidth + _scrollbarThickness,
      child: RawScrollbar(
        controller: _railScrollController,
        thumbVisibility: true,
        interactive: true,
        thickness: _scrollbarThickness,
        radius: const Radius.circular(12),
        thumbColor: Theme.of(context).colorScheme.tertiaryContainer,
        scrollbarOrientation: ScrollbarOrientation.right,
        child: SingleChildScrollView(
          controller: _railScrollController,
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: _buildNavigationRail(
                context,
                isSelected,
                (MediaQuery.of(context).size.height > 700),
              ),
            ),
          ),
        ),
      ),
    );
  }

  NavigationRail _buildNavigationRail(
    BuildContext context,
    bool isSelected,
    bool showAllText,
  ) {
    return NavigationRail(
      minWidth: _railWidth,
      destinations: widget.destinations,
      labelType:
          showAllText
              ? NavigationRailLabelType.all
              : NavigationRailLabelType.selected,
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onDestinationSelected,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      indicatorColor: Theme.of(context).colorScheme.primary,
      selectedLabelTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      unselectedLabelTextStyle: Theme.of(context).textTheme.labelLarge
          ?.copyWith(color: Theme.of(context).colorScheme.onTertiary),
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onPrimary,
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onTertiary,
        size: 24,
      ),

      leading: _buildLeading(context, isSelected),
      trailing: _buildTrailing(context),
    );
  }

  Expanded _buildTrailing(BuildContext context) {
    final repository = context.read<AuthRepository>();

    return Expanded(
      child: Column(
        spacing: 4,
        children: [
          Spacer(),
          if (widget.isLoggedIn)
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Column(
                spacing: 4,
                children: [
                  FilledButton(
                    onPressed: () => repository.logout(),
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                    ),
                    child: Icon(Icons.logout),
                  ),
                  Text(
                    'Sair',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Column(
                spacing: 4,
                children: [
                  FilledButton(
                    onPressed: () =>
                      LoginRoute().push(context),
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.tertiaryContainer,
                      foregroundColor:
                          Theme.of(context).colorScheme.onTertiaryContainer,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                    ),
                    child: Icon(Icons.login, size: 24),
                  ),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Padding _buildLeading(BuildContext context, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          IconButton(
            onPressed: widget.onPressedMenu,
            icon: Icon(
              Icons.menu,
              size: 24,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),

          HoverableLogo(
            imagePath: 'assets/logo/logo_short_light.svg',
            height: 80,
            onTap: () {},
          ),
          if (widget.isLoggedIn)
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 5),
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  overlayColor: isSelected ? null : Colors.transparent,
                  shadowColor: isSelected ? null : Colors.transparent,
                ),
                child: Icon(
                  isSelected
                      ? Icons.notifications
                      : Icons.notifications_outlined,
                  size: 24,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
