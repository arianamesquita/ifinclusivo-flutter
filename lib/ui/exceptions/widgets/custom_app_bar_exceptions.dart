import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

class CustomAppBarExceptions extends StatelessWidget
    implements PreferredSizeWidget {

  const CustomAppBarExceptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile
        ? AppBar(
          leading: IconButton(tooltip:"Voltar",onPressed: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            } else {
              ForumRouter().go(context);
            }
          },icon:  Icon(Icons.arrow_back, size: 24),),

        )
        : Row(
      children: [Padding(
        padding: const EdgeInsets.only(top: 54.0, left: 39),
        child: buildElevatedButton(context),
      )] ,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);

  Widget buildElevatedButton(BuildContext context) {
    return Tooltip(
      message: 'Voltar à página anterior',
      child: ElevatedButton.icon(
        onPressed: () {
          if (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          } else {
            ForumRouter().go(context);
          }
        },
        label: Text('voltar'),
        icon: Icon(Icons.arrow_back, size: 24),
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.inverseSurface,
          backgroundColor: Colors.transparent,
          elevation: 0,
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
