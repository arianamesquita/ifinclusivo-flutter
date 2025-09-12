import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/core/widgets/hoverable_logo.dart';

import '../../../routing/app_routes.dart';

class CustomNavigationRail extends StatefulWidget {
  final int selectedIndex;
  final Function(int)? onDestinationSelected;
  const CustomNavigationRail({
    super.key,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  @override
  State<CustomNavigationRail> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  final int notificationIndex = 5;
  final int profileIndex = 6;

  int? previousIndex;
  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.selectedIndex == profileIndex;

    return NavigationRail(
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.group_work_outlined),
          selectedIcon: Icon(Icons.group_work_rounded),
          label: Text('Fórum'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.sign_language_outlined),
          selectedIcon: Icon(Icons.sign_language),
          label: Text('Libras'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.interests_outlined),
          selectedIcon: Icon(Icons.interests),
          label: Text('Tópicos'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.chat_outlined),
          selectedIcon: Icon(Icons.chat),
          label: Text('Chat'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.dashboard_customize_outlined),
          selectedIcon: Icon(Icons.dashboard_customize),
          label: Text('Mais'),
        ),
        NavigationRailDestination(
          icon: Badge(
            label: Text('3'),
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            textColor: Theme.of(context).colorScheme.onSecondaryContainer,
            child: Icon(Icons.notifications_outlined),
          ),
          selectedIcon: Badge(
            label: Text('3'),
            child: Icon(Icons.notifications),
          ),
          label: Text('Notificações'),
        ),
      ],
      labelType: NavigationRailLabelType.all,
      selectedIndex: widget.selectedIndex == notificationIndex
          ? notificationIndex
          : widget.selectedIndex,
      onDestinationSelected:(index) async {
        if (index == notificationIndex) {
          previousIndex = widget.selectedIndex;
          widget.onDestinationSelected?.call(notificationIndex);
          await context.push(AppRoutes.notification);
          if (previousIndex != null) {
            widget.onDestinationSelected?.call(previousIndex!);
            previousIndex = null;
          }
        } else {
          widget.onDestinationSelected?.call(index);
        }
      },
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

      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(
                Icons.menu,
                size: 24,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),

            HoverableLogo(
              imagePath: 'assets/favicon.png',
              height: 101,
              onTap: () {},
            ),
          ],
        ),
      ),
      trailing: Expanded(
        child: Column(
          spacing: 4,
          children: [
            Spacer(),
            InkWell(
              onTap: () {
                widget.onDestinationSelected?.call(profileIndex);
                context.go(AppRoutes.profile); // navega para branch do shell
              },

              borderRadius: BorderRadius.circular(12),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [ CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      size: 24,
                    ),
                  ),
                    Text(
                      'Perfil',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
