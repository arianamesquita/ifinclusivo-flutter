import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/guards/auth_guard.dart';
import 'package:if_inclusivo/guards/roles.dart';
import 'package:if_inclusivo/ui/core/layout/custom_navigation_drawer.dart';
import 'package:if_inclusivo/ui/core/layout/custom_navigation_rail.dart';
import 'package:if_inclusivo/ui/pages/shell/app_destinations.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }

  bool open = true;

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = true;
    final userRoles = [...Roles.values];

    final auth = AuthGuardShell(isLoggedIn: isLoggedIn, userRoles: userRoles);
    final allowedBranches = auth.allowedBranches();
    var deviceType = ResponsiveUtils.getDeviceType(context);
    return deviceType == DeviceScreenType.desktop
        ? _buildAppWeb(auth, allowedBranches, context, isLoggedIn)
        : deviceType == DeviceScreenType.tablet
        ? _buildAppTablet(auth, allowedBranches, context, isLoggedIn)
        : _buildAppTablet(auth, allowedBranches, context, isLoggedIn);
  }

  Scaffold _buildAppWeb(
    AuthGuardShell auth,
    List<int> allowedBranches,
    BuildContext context,
    bool isLoggedIn,
  ) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            width: open ? 300 : 96, // largura do drawer ou rail
            child:
                open
                    ? _customNavigationDrawer(
                      auth,
                      allowedBranches,
                      context,
                      isLoggedIn,
                      () {
                        setState(() {
                          open = false;
                        });
                      },
                    )
                    : CustomNavigationRail(
                      selectedIndex: auth.mapSelectedIndex(
                        allowedBranches,
                        widget.child.currentIndex,
                      ),
                      onDestinationSelected: (newIndex) {
                        final branch = allowedBranches[newIndex];
                        widget.child.goBranch(branch);
                      },
                      destinations:
                          allowedBranches
                              .map((i) => AppDestinations.rail(context)[i])
                              .toList(),
                      isLoggedIn: isLoggedIn,
                      onPressedMenu: () {
                        setState(() {
                          open = true;
                        });
                      },
                    ),
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  Scaffold _buildAppTablet(
    AuthGuardShell auth,
    List<int> allowedBranches,
    BuildContext context,
    bool isLoggedIn,
  ) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          CustomNavigationRail(
            selectedIndex: auth.mapSelectedIndex(
              allowedBranches,
              widget.child.currentIndex,
            ),
            onDestinationSelected: (newIndex) {
              final branch = allowedBranches[newIndex];
              widget.child.goBranch(branch);
            },
            destinations:
                allowedBranches
                    .map((i) => AppDestinations.rail(context)[i])
                    .toList(),
            isLoggedIn: isLoggedIn,
            onPressedMenu: openDrawer,
          ),
          Expanded(child: widget.child),
        ],
      ),
      drawer: _customNavigationDrawer(
        auth,
        allowedBranches,
        context,
        isLoggedIn,
        closeDrawer,
      ),
    );
  }

  CustomNavigationDrawer _customNavigationDrawer(
    AuthGuardShell auth,
    List<int> allowedBranches,
    BuildContext context,
    bool isLoggedIn,
    void Function() onPressedMenu,
  ) {
    return CustomNavigationDrawer(
      selectedIndex: auth.mapSelectedIndex(
        allowedBranches,
        widget.child.currentIndex,
      ),
      onDestinationSelected: (newIndex) {
        final branch = allowedBranches[newIndex];
        widget.child.goBranch(branch);
      },
      destinations:
          allowedBranches
              .map((i) => AppDestinations.drawer(context)[i])
              .toList(),
      isLoggedIn: isLoggedIn,
      onPressedMenu: onPressedMenu,
    );
  }
}
