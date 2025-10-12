import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/layout/app_bar_blocked.dart';
import '../../core/layout/footer.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBarBlocked(
                onPressedSingIn: () {
                  context.push('/login');
                },
                onPressedSingUp: () {
                  context.push('/register');
                },
              ),
              widget.child,
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
class StackItemInfo {
  final String iconPath;
  final String title;
  final String label;
  final Color color;
  final void Function()? onTap;

  const StackItemInfo({
    required this.iconPath,
    required this.title,
    required this.label,
    required this.color,
    this.onTap,
  });
}
