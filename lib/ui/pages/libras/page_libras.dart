import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/widgets/card_info.dart';
import 'package:if_inclusivo/ui/pages/libras/topics_libras.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/libras_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';

class LibrasPage extends StatelessWidget {
  const LibrasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(height: 100,),
          TopContentLibras(
            title: "CONVERTE LIBRAS",
            searchBar: LibrasCustomSearchBar(),
            subtitle: "Um dicionário de sinais criado para a comunidade",
          ),
          SizedBox(height: 90,),
          TopicsLibras(),
          SizedBox(height: 90,),
          CardInfo(
            title: 'Dicionário de Sinais',
            label: 'Digite palavras e veja a tradução para Libras em vídeos explicativos. \n Um recurso pensado para facilitar a comunicação e promover a inclusão.',
            maxWidth: 592,
          ),
        ],
      ),
    );
  }
}
