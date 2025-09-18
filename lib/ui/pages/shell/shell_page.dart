import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/guards/auth_guard.dart';
import 'package:if_inclusivo/guards/roles.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/core/layout/custom_navigation_drawer.dart';
import 'package:if_inclusivo/ui/core/layout/custom_navigation_rail.dart';
import 'package:if_inclusivo/ui/core/widgets/hoverable_logo.dart';
import 'package:if_inclusivo/ui/pages/auth/sing_up/viewModels/registerViewModel.dart';
import 'package:if_inclusivo/ui/pages/shell/app_destinations.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

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

  Widget _buildAppMobile(
    AuthGuardShell auth,
    List<int>
    allowedBranches, // Esta lista ainda pode ser usada para controle de acesso
    BuildContext context,
    bool isLoggedIn,
  ) {
    return BuildMobileAPP(child: widget.child);
  }
}

class BuildMobileAPP extends StatefulWidget {
  final StatefulNavigationShell child;

  const BuildMobileAPP({super.key, required this.child});

  @override
  State<BuildMobileAPP> createState() => _BuildMobileAPPState();
}

class _BuildMobileAPPState extends State<BuildMobileAPP>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int lastIndexTabBar = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      if (_tabController.index == 0) {
        widget.child.goBranch(0); // Fórum
        setState(() => lastIndexTabBar = 0);
      } else {
        widget.child.goBranch(2); // Tópicos
        setState(() => lastIndexTabBar = 2);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isHomePage =
        widget.child.currentIndex == 0 || widget.child.currentIndex == 2;

    // garante que o TabController fique alinhado com a branch
    if (widget.child.currentIndex == 0 && _tabController.index != 0) {
      _tabController.index = 0;
    } else if (widget.child.currentIndex == 2 && _tabController.index != 1) {
      _tabController.index = 1;
    }

    return Scaffold(
      appBar:
          isHomePage
              ? AppBar(
                toolbarHeight: 76,
                title: SvgPicture.asset(
                  'assets/logo/logo_expanded_dark.svg',
                  height: 60,
                ),
                actions: [
                  IconButton(
                    onPressed: () => NotificationRouter().push(context),
                    icon: Icon(
                      Icons.notifications_outlined,
                      size: 24,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
                actionsPadding: EdgeInsets.symmetric(vertical: 16),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: const [
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
          if (currentBranch == 0 || currentBranch == 2) return 0; // Home
          if (currentBranch == 1) return 1; // Libras
          if (currentBranch == 3) return 2; // Chat
          if (currentBranch == 5) return 3; // Profile
          return 0;
        }(),
        onDestinationSelected: (newIndex) {
          switch (newIndex) {
            case 0:
              widget.child.goBranch(lastIndexTabBar); // volta à última tab
              break;
            case 1:
              widget.child.goBranch(1);
              break;
            case 2:
              widget.child.goBranch(3);
              break;
            case 3:
              widget.child.goBranch(5);
              break;
          }
        },
        destinations: AppDestinations.bottom(context),
        indicatorColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        labelTextStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
      ),
    );
  }
}
