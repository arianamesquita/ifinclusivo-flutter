import 'package:flutter/cupertino.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/widgets/specific_topic.dart';

class SpecificTopicGridParams {
  final String playerUrl;
  final String title;
  final String description;
  final GestureTapCallback onTap;

  SpecificTopicGridParams({
    required this.playerUrl,
    required this.title,
    required this.description,
    required this.onTap,
  });
}

class SpecificTopicGrid extends StatelessWidget {
  final List<SpecificTopicGridParams> specificTopicsList;

  const SpecificTopicGrid({super.key, required this.specificTopicsList});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // tamanho do componente pai
        double maxWidth = constraints.maxWidth;
        // dimensões fixas de cada card
        const itemWidth = 387.0;
        const itemHeight = 361.0;
        // espaçamento máximo
        const maxVerticalSpacing = 86.0;
        const maxGridWidth = 957.0;

        // calcula quantas colunas cabem (no máx 2)
        int crossAxisCount = (maxWidth / itemWidth).floor();
        crossAxisCount = crossAxisCount.clamp(1, 2);

        // largura total dos itens
        double totalItemsWidth = crossAxisCount * itemWidth;

        // espaçamento horizontal
        double horizontalSpacing =
        crossAxisCount > 1
            ? ((maxWidth < maxGridWidth ? maxWidth : maxGridWidth) -
            totalItemsWidth) /
            (crossAxisCount - 1)
            : 0;

        // espaçamento vertical proporcional
        double verticalSpacing =
            maxVerticalSpacing *
                ((maxWidth < maxGridWidth ? maxWidth : maxGridWidth) / maxGridWidth);

        // largura real do Wrap
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
                      urlVideo: arg.playerUrl,
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
