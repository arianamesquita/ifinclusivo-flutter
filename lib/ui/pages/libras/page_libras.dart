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
    // 1. Use ChangeNotifierProvider para criar e fornecer a VM
    return ChangeNotifierProvider(
      create: (context) => LibrasSearchBarViewmodel(
        // Use context.read para pegar o repositório que já deve estar provido acima
        librasRepository: context.read<LibrasRepository>(),
      ),
      // 2. TopicLibras agora é um 'child' e não precisa mais do parâmetro 'vm'
      child: const TopicLibras(),
    );
  }
}
