import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/core/layout/app_bar.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container.dart';
import 'package:if_inclusivo/ui/core/layout/custom_navigation_rail.dart';
import 'package:if_inclusivo/ui/core/layout/footer.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomNavigationRail(
            selectedIndex: widget.child.currentIndex,
            onDestinationSelected: widget.child.goBranch,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [CustomContainer(child: widget.child), Footer()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
