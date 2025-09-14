import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/topics_libras.dart';

class LibrasPage extends StatelessWidget {
  const LibrasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TopicLibras(),
        ],
      ),
    );
  }
}
