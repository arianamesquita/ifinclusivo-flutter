import 'package:flutter/material.dart';

class AppDestinations {
  static List<NavigationRailDestination> rail(BuildContext context) =>
      <NavigationRailDestination>[
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
          icon: SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                size: 20,
              ),
            ),
          ),
          label: Text('Perfil'),
        ),
      ];
  static List<NavigationDrawerDestination> drawer(BuildContext context) =>
      <NavigationDrawerDestination>[
        NavigationDrawerDestination(
          icon: Icon(
            Icons.group_work_outlined,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          selectedIcon: Icon(
            Icons.group_work_rounded,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          label: Text(
            'Fórum',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(
            Icons.sign_language_outlined,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          selectedIcon: Icon(
            Icons.sign_language,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          label: Text(
            'Libras',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(
            Icons.interests_outlined,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          selectedIcon: Icon(
            Icons.interests,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          label: Text(
            'Tópicos',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(
            Icons.chat_outlined,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          selectedIcon: Icon(
            Icons.chat,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          label: Text(
            'Chat',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(
            Icons.dashboard_customize_outlined,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          selectedIcon: Icon(
            Icons.dashboard_customize,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          label: Text(
            'Mais',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                size: 20,
              ),
            ),
          ),
          label: Text(
            'Perfil',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
      ];
}
