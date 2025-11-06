import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/viewmodels/libras_search_bar_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/libras/topics_libras.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/libras_repository.dart';

class LibrasPage extends StatefulWidget {
  const LibrasPage({super.key});

  @override
  State<LibrasPage> createState() => _LibrasPageState();
}

class _LibrasPageState extends State<LibrasPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibrasSearchBarViewmodel(
        librasRepository: context.read<LibrasRepository>(),
      ),
      child: const TopicLibras(),
    );
  }
}
