import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container.dart';

import '../../core/layout/app_bar_blocked.dart';
import '../../core/layout/footer.dart';
class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {

  Key _scrollViewKey = UniqueKey();


  @override
  void didUpdateWidget(covariant PresentationPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.child != oldWidget.child) {
      setState(() {
        _scrollViewKey = UniqueKey();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: _scrollViewKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBarBlocked(onPressedSingIn: () {}, onPressedSingUp: () {}),
            CustomContainer(child: widget.child),
            Footer(),
          ],
        ),
      ),
    );
  }
}
