import 'package:flutter/material.dart';
import 'filter_block.dart';

class FilterBlockGridParams {
  final String imageAsset;
  final String label;
  final GestureTapCallback onTap;

  FilterBlockGridParams({required this.imageAsset, required this.label, required this.onTap});
}

class FilterBlockGrid extends StatelessWidget {
  const FilterBlockGrid({super.key, required this.filterBlockList});
  final List<FilterBlockGridParams> filterBlockList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // pegando o tamanho do componente pai
        double maxWidth = constraints.maxWidth;
        // width do filter Block
        const itemWidth = 241.0;
        // height do filter Block
        const itemHeight = 201.0;
        // expacamento vertical maximo
        const maxVerticalSpacing = 86.0;
        // a largura maxima que o grid pode ter
        const maxGridWidth = 957.0;

        // calcula quantas colunas cabem, mas no máximo 3
        int crossAxisCount = (maxWidth / itemWidth).floor();
        crossAxisCount = crossAxisCount.clamp(1, 3);

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
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: wrapWidth),
            child: Wrap(
              spacing: horizontalSpacing,
              runSpacing: verticalSpacing,
              children: filterBlockList.map((arg) {
                return SizedBox(
                  width: itemWidth,
                  height: itemHeight,
                  child: FilterBlock(
                    imageAsset: arg.imageAsset,
                    label: arg.label,
                    onTap: arg.onTap,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
