import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarBlocked extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBarBlocked({
    super.key,
    required this.onPressedSingIn,
    required this.onPressedSingUp,
  });
  final VoidCallback? onPressedSingIn;
  final VoidCallback? onPressedSingUp;

  @override
  State<CustomAppBarBlocked> createState() => _CustomAppBarBlockedState();

  @override
  Size get preferredSize => const Size.fromHeight(270);
}

class _CustomAppBarBlockedState extends State<CustomAppBarBlocked> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 206,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 278,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/logo_oficial_expanded.png',
                    height: 100,
                  ),
                ),
                Row(
                  spacing: 32,
                  children: [
                    ElevatedButton(
                      onPressed: widget.onPressedSingIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(28, 122, 229, 100),
                        textStyle: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 54,
                          vertical: 17,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      child: Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: widget.onPressedSingUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        textStyle: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 17,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      child: Text('Cadastre-se'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset("assets/Figuras Decorativas.svg"),
        ),
      ],
    );
  }
}
