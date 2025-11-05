import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:provider/provider.dart';

import '../../../routing/app_router.dart';
import '../../../utils/responsive_utils.dart';
import '../theme/theme.dart';
import '../widgets/hoverable_logo.dart';

class CustomAppBarBlocked extends StatefulWidget {
  const CustomAppBarBlocked({
    super.key,
    required this.onPressedSingIn,
    required this.onPressedSingUp,
  });
  final VoidCallback? onPressedSingIn;
  final VoidCallback? onPressedSingUp;

  @override
  State<CustomAppBarBlocked> createState() => _CustomAppBarBlockedState();
}

class _CustomAppBarBlockedState extends State<CustomAppBarBlocked>
    with SingleTickerProviderStateMixin {
  late final AuthRepository repository;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 621;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child:
              isMobile
                  ? Padding(
                    padding: ResponsiveUtils.defaultPadding(context),
                    child: Center(
                      child: _buildLogoAndButtonsMobile(isMobile, context),
                    ),
                  )
                  : Padding(
                    padding: EdgeInsets.only(left: 69, top: 11, bottom: 11.0),
                    child: _buildLogoAndButtons(isMobile, context),
                  ),
        ),

        if (!isMobile)
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset("assets/Figuras Decorativas.svg"),
          ),
      ],
    );
  }

  Row _buildLogoAndButtons(bool isMobile, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            alignment:
                isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 15,
            runSpacing: 15,
            children: [
              FittedBox(
                child: HoverableLogo(
                  onTap: () => context.go(AboutUsRoute().location),
                  imagePath: 'assets/logo/logo_expanded_light.svg',
                  height: 138,
                ),
              ),
              ListenableBuilder(
                listenable: repository,
                builder: (context, _) {
                  if (repository.currentUser == null) {
                    return Padding(
                      padding: EdgeInsets.only(top: isMobile ? 12.0 : 0),
                      child: _buildButtons(context),
                    );
                  } else {
                    return _buildUser(repository.currentUser!);
                  }
                },
              ),
            ],
          ),
        ),
        if (!isMobile) SizedBox(width: 238),
      ],
    );
  }

  Row _buildButtons(BuildContext context) {
    final secondary40 =
        MaterialTheme(Theme.of(context).textTheme).extendedColors.first;
    final blue = MaterialTheme(Theme.of(context).textTheme).extendedColors[1];
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: ResponsiveUtils.spacing(context).$1,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: widget.onPressedSingIn,
          style: ElevatedButton.styleFrom(
            backgroundColor: blue.light.color,
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            foregroundColor: blue.light.onColor,
            maximumSize: Size(141.61, 50),
            minimumSize: Size(140, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text('Login'),
        ),

        ElevatedButton(
          onPressed: widget.onPressedSingUp,
          style: ElevatedButton.styleFrom(
            backgroundColor: secondary40.light.color,
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            foregroundColor: secondary40.light.onColor,
            maximumSize: Size(179.5, 50),
            minimumSize: Size(170, 50),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text('Cadastre-se'),
        ),
      ],
    );
  }

  _buildButtonsMobile(BuildContext context) {
    final secondary40 =
        MaterialTheme(Theme.of(context).textTheme).extendedColors.first;
    final blue = MaterialTheme(Theme.of(context).textTheme).extendedColors[1];
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: ResponsiveUtils.spacing(context).$1,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.onPressedSingIn,
            style: ElevatedButton.styleFrom(
              backgroundColor: blue.light.color,
              textStyle: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              foregroundColor: blue.light.onColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text('Login'),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.onPressedSingUp,
            style: ElevatedButton.styleFrom(
              backgroundColor: secondary40.light.color,
              textStyle: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              foregroundColor: secondary40.light.onColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text('Cadastre-se'),
          ),
        ),
      ],
    );
  }

  bool openMenu = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    // Controla a animação do menu (abrir/fechar)
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
    repository = context.read();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      openMenu = !openMenu;
      openMenu ? _controller.forward() : _controller.reverse();
    });
  }

  Widget _buildLogoAndButtonsMobile(bool isMobile, BuildContext context) {
    final color = Theme.of(context).colorScheme.onTertiary;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HoverableLogo(
              onTap: () => context.go(AboutUsRoute().location),
              imagePath: 'assets/logo/logo_expanded_light.svg',
              height: 80,
            ),
            ListenableBuilder(
              listenable: repository,
              builder: (context, _) {
                if (repository.currentUser == null) {
                  return IconButton(
                    onPressed: _toggleMenu,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _controller,
                    ),
                    iconSize: 30,
                    color: color,
                    tooltip: openMenu ? "Fechar menu" : "Abrir menu",
                  );
                } else {
                  if (openMenu) {
                    setState(() {
                      openMenu = false;
                    });
                  }
                  return _buildUser(repository.currentUser!);
                }
              },
            ),
          ],
        ),
        SizeTransition(
          sizeFactor: _expandAnimation,
          axisAlignment: -1.0,
          child: FadeTransition(
            opacity: _expandAnimation,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: _buildButtonsMobile(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUser(UsuarioResponseModel usuarioResponseModel) {
    return UserAvatarMenu(usuario: usuarioResponseModel, onLogout: repository.logout,);
  }

}
class UserAvatarMenu extends StatefulWidget {
  final UsuarioResponseModel usuario;
  final Function()? onLogout;

  const UserAvatarMenu({super.key, required this.usuario, this.onLogout});

  @override
  State<UserAvatarMenu> createState() => _UserAvatarMenuState();
}

class _UserAvatarMenuState extends State<UserAvatarMenu> {
  final GlobalKey _avatarKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    final renderBox = _avatarKey.currentContext!.findRenderObject() as RenderBox;
    final avatarPosition = renderBox.localToGlobal(Offset.zero);
    final avatarSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        final isMobile = ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile;
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _hideOverlay,
                behavior: HitTestBehavior.translucent,
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              left:isMobile? avatarPosition.dx -280 +avatarSize.height:avatarPosition.dx -180,
              top: avatarPosition.dy + avatarSize.height + 8,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(widget.usuario.imgPerfil),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.usuario.nome,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: 20),
                      ListTile(
                        dense: true,
                        leading: const Icon(Icons.home_rounded),
                        title: const Text('Ir para aplicação'),
                        onTap: () {
                          _hideOverlay();
                          ForumRouter().go(context);
                        },
                      ),
                      ListTile(
                        dense: true,
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text('Sair', style: TextStyle(color: Colors.red)),
                        onTap:() {
                          widget.onLogout?.call();
                          _hideOverlay();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    final device = ResponsiveUtils.getDeviceType(context);
    return SizedBox(
      width: device == DeviceScreenType.mobile? 60: 90,
      height: device == DeviceScreenType.mobile? 60: 90,
      child: InkWell(
        key: _avatarKey,
        onTap: _showOverlay,
        child: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(widget.usuario.imgPerfil),
        ),
      ),
    );
  }
}