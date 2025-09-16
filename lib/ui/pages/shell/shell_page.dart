import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/guards/auth_guard.dart';
import 'package:if_inclusivo/guards/roles.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/core/layout/custom_navigation_drawer.dart';
import 'package:if_inclusivo/ui/core/layout/custom_navigation_rail.dart';
import 'package:if_inclusivo/ui/core/widgets/hoverable_logo.dart';
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

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = true;
    final userRoles = [...Roles.values];

    final auth = AuthGuardShell(isLoggedIn: isLoggedIn, userRoles: userRoles);
    var deviceType = ResponsiveUtils.getDeviceType(context);
    return deviceType == DeviceScreenType.mobile
        ? _buildAppMobile(
          auth,
          auth.allowedBranchesMobile(),
          context,
          isLoggedIn,
        )
        : _buildAppWebAndTablet(
          auth,
          auth.allowedBranches(),
          context,
          isLoggedIn,
        );
  }

  Scaffold _buildAppWebAndTablet(
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

  int lastIndexTabBar = 1;

  Widget _buildAppMobile(
    AuthGuardShell auth,
    List<int>
    allowedBranches, // Esta lista ainda pode ser usada para controle de acesso
    BuildContext context,
    bool isLoggedIn,
  ) {
    final bool isHomePage =
        widget.child.currentIndex == 0 || widget.child.currentIndex == 2;
    setState(() {
      lastIndexTabBar = (widget.child.currentIndex == 2) ? 1 : 0;
    });
    return DefaultTabController(
      length: 2, // Temos 2 abas: Fórum e Tópicos
      initialIndex: lastIndexTabBar,
      child: Scaffold(
        appBar:
            isHomePage
                ? AppBar(
                  title: SvgPicture.asset(
                    'assets/favicon-expanded-green.svg',
                    height: 55,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () =>NotificationRouter().push(context),
                      icon: Icon(Icons.notifications_outlined, size: 24),
                    ),
                  ],
                  bottom: TabBar(
                    onTap: (index) {
                      if (index == 0) {
                        widget.child.goBranch(0); // Rota do Fórum
                        setState(() {
                          lastIndexTabBar = 0;
                        });
                      } else if (index == 1) {
                        widget.child.goBranch(2);
                        setState(() {
                          lastIndexTabBar = 2;
                        });
                      }
                    },
                    tabs: const <Widget>[
                      Tab(text: 'Fórum', icon: Icon(Icons.group_work_outlined)),
                      Tab(
                        text: 'Tópicos',
                        icon: Icon(Icons.dashboard_customize_outlined),
                      ),
                    ],
                  ),
                )
                : null,

        body: SafeArea(child: widget.child),
        bottomNavigationBar: NavigationBar(
          selectedIndex: () {
            final currentBranch = widget.child.currentIndex;
            if (currentBranch == 0 || currentBranch == 2) return 0; // Fórum/Tópicos -> Início
            if (currentBranch == 1) return 1; // Libras
            if (currentBranch == 3) return 2; // Chat
            if (currentBranch == 5) return 3; // Chat
            return 0; // Padrão
          }(),
          onDestinationSelected: (newIndex) {
            switch (newIndex) {
              case 0:
                widget.child.goBranch(
                  lastIndexTabBar,
                ); // Clicou em Início -> vai para Fórum
                break;
              case 1:
                widget.child.goBranch(1); // Clicou em Libras -> vai para Libras
                break;
              case 2:
                widget.child.goBranch(3); // Clicou em Chat -> vai para Chat
              case 3:
                widget.child.goBranch(5);// clicou em Profile
                break;
            }
          },
          destinations: AppDestinations.bottom(context),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelTextStyle: WidgetStatePropertyAll(
            Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
