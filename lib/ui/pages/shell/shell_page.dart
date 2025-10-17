import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/data/repositories/libras_repository.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
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

import '../../../data/repositories/auth_repository.dart';
import '../../../domain/models/api/response/gen_responses.dart';

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
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final librasRepository = context.read<LibrasRepository>();
      var response = await librasRepository.getLibrasByTopic(categorias: Categorias.REDES);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();


    return StreamBuilder<UsuarioResponseModel?>(
      stream: authRepository.authStateChanges,

      initialData: authRepository.currentUser,
      builder: (context, snapshot) {
        final UsuarioResponseModel? currentUser = snapshot.data;
        final bool isLoggedIn = currentUser != null;

        final List<Roles> userRoles = currentUser?.roles?? [];

        final auth = AuthGuardShell(isLoggedIn: isLoggedIn, userRoles: userRoles);
        var deviceType = ResponsiveUtils.getDeviceType(context);
        if (deviceType == DeviceScreenType.mobile) {
          return _buildAppMobile(
            auth,
            auth.allowedBranchesMobile(),
            context,
            isLoggedIn,
          );
        } else {
          return _buildAppWebAndTablet(
            auth,
            auth.allowedBranches(),
            context,
            isLoggedIn,
            authRepository.currentUser
          );
        }
      },
    );
  }

  Scaffold _buildAppWebAndTablet(
    AuthGuardShell auth,
    List<int> allowedBranches,
    BuildContext context,
    bool isLoggedIn,
  UsuarioResponseModel? user

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
                    .map((i) => AppDestinations.rail(context, user?.imgPerfil)[i])
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
        user
      ),
    );
  }

  CustomNavigationDrawer _customNavigationDrawer(
    AuthGuardShell auth,
    List<int> allowedBranches,
    BuildContext context,
    bool isLoggedIn,
    void Function() onPressedMenu,
      UsuarioResponseModel? user

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
              .map((i) => AppDestinations.drawer(context,user?.imgPerfil)[i])
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
    final authRepository = context.read<AuthRepository>();


    return StreamBuilder<UsuarioResponseModel?>(
        stream: authRepository.authStateChanges,

        initialData: authRepository.currentUser,
        builder: (context, snapshot) {
        return Scaffold(
          body: widget.child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: widget.child.currentIndex,
            onDestinationSelected: widget.child.goBranch,
            destinations: AppDestinations.bottom(context,authRepository.currentUser?.imgPerfil),
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
    );
  }
}
