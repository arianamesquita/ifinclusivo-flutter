import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class StickyHeaderScrollView extends StatelessWidget {
  final ScrollController? controller;
  final Widget header;
  final Widget stickyHeader;
  final List<Widget> body;

  const StickyHeaderScrollView({
    super.key,
    this.controller,
    required this.header,
    required this.stickyHeader,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: controller,
        slivers: [
          SliverToBoxAdapter(child: header),

          SliverPinnedHeader(
            child: stickyHeader,
          ),

          ...body,
        ],
      ),
    );
  }
}