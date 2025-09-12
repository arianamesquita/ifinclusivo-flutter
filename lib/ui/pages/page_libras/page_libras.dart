import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/page_libras/widgets/libras_custom_search_bar.dart';

import '../../core/filter_block/filter_block_grid.dart';

class LibrasPage extends StatelessWidget {
  const LibrasPage({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      FilterBlockGridParams(label: 'Teste', icon: Icons.storage, onTap: (){print("qualquer ");},),
      FilterBlockGridParams(label: 'Teste', icon: Icons.storage, onTap: (){print("qualquer ");},),
      FilterBlockGridParams(label: 'Teste', icon: Icons.storage, onTap: (){print("qualquer ");},),
      FilterBlockGridParams(label: 'Teste', icon: Icons.storage, onTap: (){print("qualquer ");},),
      FilterBlockGridParams(label: 'Teste', icon: Icons.storage, onTap: (){print("qualquer ");},),
      FilterBlockGridParams(label: 'Teste', icon: Icons.storage, onTap: (){print("qualquer ");},),
    ];

    return Material(
      color: const Color.fromRGBO(242, 242, 242, 1),
      child: Column(
        children: [
          const LibrasCustomSearchBar(),
          Expanded(child: FilterBlockGrid(filterBlockList: items)),
        ],
      ),
    );
  }
}
