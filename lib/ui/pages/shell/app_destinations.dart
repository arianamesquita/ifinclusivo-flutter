import 'package:flutter/material.dart';

class AppDestinations {
  static List<NavigationRailDestination> rail(BuildContext context, String? imgPath) =>
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
          icon: Icon(Icons.dashboard_customize_outlined),
          selectedIcon: Icon(Icons.dashboard_customize),
          label: Text('Mais'),
        ),
        NavigationRailDestination(
          icon: SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundImage:
              (imgPath != null && imgPath.isNotEmpty)
                  ? NetworkImage(imgPath)
                  : null,
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child:imgPath == null ? Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                size: 20,
              ):null,
            ),
          ),
          label: Text('Perfil'),
        ),
      ];
  static List<NavigationDrawerDestination> drawer(BuildContext context,String? imgPath) =>
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
              backgroundImage:
              (imgPath != null && imgPath.isNotEmpty)
                  ? NetworkImage(imgPath)
                  : null,
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child:imgPath == null ? Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                size: 20,
              ):null,
            ),
          ),
          label: Text(
            'Perfil',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
      ];  static List<NavigationDestination> bottom(BuildContext context, String? imgPath) =>
      <NavigationDestination>[
        NavigationDestination(
            icon: Icon(
              Icons.group_work,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
            selectedIcon: Icon(
              Icons.group_work_outlined,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
            label:'Fórum'
        ),

        NavigationDestination(
          icon: Icon(
            Icons.sign_language_outlined,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          selectedIcon: Icon(
            Icons.sign_language,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          label:'Libras'
        ),


        NavigationDestination(
          icon: SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundImage:
              (imgPath != null && imgPath.isNotEmpty)
                  ? NetworkImage(imgPath)
                  : null,
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child:imgPath == null ?Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                size: 20,
              ):null,
            ),
          ),
          label:
            'Perfil',
        ),
      ];
}
