import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/guards/auth_guard.dart';
import 'package:if_inclusivo/guards/roles.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container_shell.dart';
import 'package:if_inclusivo/ui/core/layout/custom_navigation_rail.dart';
import 'package:if_inclusivo/ui/pages/shell/app_destinations.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = true;
    final userRoles = [...Roles.values];

    final auth = AuthGuardShell(isLoggedIn: isLoggedIn, userRoles: userRoles);
    final allowedBranches = auth.allowedBranches();
    return Scaffold(
      body: Row(
        children: [
          CustomNavigationRail(
            
            destinations:
                allowedBranches
                    .map((i) => AppDestinations.rail(context)[i])
                    .toList(),
            selectedIndex: auth.mapSelectedIndex(
              allowedBranches,
              widget.child.currentIndex,
            ),
            onDestinationSelected: (newIndex) {
              final branch = allowedBranches[newIndex];
              widget.child.goBranch(branch);
            }, isLoggedIn: isLoggedIn,
          ),
          CustomContainerShell(child: widget.child),
        ],
      ),
    );
  }
}
