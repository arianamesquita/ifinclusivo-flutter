import 'package:flutter/material.dart';
import '../../../../../utils/responsive_utils.dart';
import '../../../../core/widgets/card_info.dart';
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
        double screenWidth = constraints.maxWidth;
        const double itemMaxWidth = 202.0;
        const double itemHeight = 156.0;
        final double gridSpacing = screenWidth < 680 ? 20 : 65;

        int crossAxisCount = screenWidth < 680 ? 2 : 3;

        double idealMaxWidth = (crossAxisCount * itemMaxWidth) +
            ((crossAxisCount - 1) * gridSpacing);

        double constraintWidth = 800.0;



        double finalWidth = screenWidth > constraintWidth ? constraintWidth : screenWidth;

        return Column(
          children: [
            Center(
              child: SizedBox(
                width: finalWidth,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filterBlockList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: gridSpacing,
                    mainAxisSpacing: gridSpacing,
                    childAspectRatio: itemMaxWidth / itemHeight,
                  ),
                  itemBuilder: (context, index) {
                    final arg = filterBlockList[index];
                    return FilterBlock(
                      imageAsset: arg.imageAsset,
                      label: arg.label,
                      onTap: arg.onTap,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 37), // Espaçamento do rodapé

            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CardInfo( // Supondo que este widget existe no seu projeto
                title: 'Dicionário de Sinais',
                label:
                'Digite palavras e veja a tradução para Libras em vídeos explicativos.\n\n'
                    'Um recurso pensado para facilitar a comunicação e promover a inclusão.',
                maxWidth: 592,
              ),
            ),
          ],
        );
      },
    );
  }

  _centralized({required Widget child,required context} ) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveUtils.spacingColumn(context),
        ),
        child: child,
      ),
    );
  }
}
