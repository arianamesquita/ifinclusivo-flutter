import 'package:flutter/cupertino.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/specific_topic.dart';

class SpecificTopicGridParams {
  final String plyaerUrl;
  final String title;
  final String description;
  final GestureTapCallback onTap;

  SpecificTopicGridParams({required this.plyaerUrl, required this.title, required this.description, required this.onTap,});
}

class SpecificTopicGrid extends StatelessWidget{
  final List<SpecificTopicGridParams> specificTopicsList;
  const SpecificTopicGrid({super.key, required this.specificTopicsList});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // pegando o tamanho do componente pai
        double maxWidth = constraints.maxWidth;
        // width do filter Block
        const itemWidth = 387.0;
        // height do filter Block
        const itemHeight = 361.0;
        // expacamento vertical maximo
        const maxVerticalSpacing = 86.0;
        // a largura maxima que o grid pode ter
        const maxGridWidth = 957.0;

        // calcula quantas colunas cabem, mas no máximo 3
        int crossAxisCount = (maxWidth / itemWidth).floor();
        crossAxisCount = crossAxisCount.clamp(1, 2);

        // largura total dos itens
        double totalItemsWidth = crossAxisCount * itemWidth;

        // calcula o espaçamento horizontal proporcionalmente
        double horizontalSpacing = crossAxisCount > 1
            ? ((maxWidth < maxGridWidth ? maxWidth : maxGridWidth) -
            totalItemsWidth) /
            (crossAxisCount - 1)
            : 0;

        // calcula o espaçamento vertical
        double verticalSpacing = maxVerticalSpacing *
            ((maxWidth < maxGridWidth ? maxWidth : maxGridWidth) / maxGridWidth);

        // largura real do Wrap para centralizar
        double wrapWidth =
            totalItemsWidth + (crossAxisCount - 1) * horizontalSpacing;

        return Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: wrapWidth),
              child: Wrap(
                spacing: horizontalSpacing,
                runSpacing: verticalSpacing,
                children: specificTopicsList.map((arg) {
                  return SizedBox(
                    width: itemWidth,
                    height: itemHeight,
                    child: SpecificTopic(
                      title: arg.title,
                      description: arg.description,
                      urlVideo: arg.plyaerUrl,
                      onTap: arg.onTap,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

}