import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_napne_router.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container.dart';
import 'package:if_inclusivo/ui/core/widgets/card_info.dart';

import '../../../../utils/responsive_utils.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  final Color color1 = Color.fromRGBO(114, 17, 153, 1); // Opacidade 100% é 1, não 100
  final Color color2 = Color.fromRGBO(70, 163, 74, 1);

  List<StackItemInfo> items=[];
  @override
  Widget build(BuildContext context) {
    items = [    StackItemInfo(
      iconPath: 'assets/icons/Mãos.png',
      title: 'Converte Libras',
      label: 'Converte palavras em sinais para deficientes auditivos.',
      color: color1,
      onTap: () {},
    ),
      StackItemInfo(
        iconPath: 'assets/icons/Livro.png',
        title: 'Tópicos',
        label: 'Sugestões de leitura adaptadas para todos.',
        color: color2,
        onTap: () {},
      ),
      StackItemInfo(
        iconPath: 'assets/icons/Chat.png',
        title: 'Fórum',
        label: 'Espaço de diálogo e apoio entre os alunos.',
        color: color1,
        onTap: () {},
      ),
      StackItemInfo(
        iconPath: 'assets/icons/napne.png',
        title: 'NAPNE',
        label: 'Orientação e Sensibilização',
        color: color2,
        onTap: () {
          context.go(AboutNapneRoute().location);
        },
      ),];
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final fontScale = ResponsiveUtils.fontScale(context);
    final spacing = ResponsiveUtils.spacing(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: deviceType == DeviceScreenType.desktop ? 20 : spacing.$1,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical:
                  deviceType == DeviceScreenType.desktop ? 164 : spacing.$2,
            ),
            child: _buildIntro(fontScale, deviceType),
          ),
          _buildMainStacks(context, fontScale, deviceType, spacing),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  deviceType == DeviceScreenType.desktop ? 50 : spacing.$1,
              vertical:
                  deviceType == DeviceScreenType.desktop ? 142 : spacing.$2,
            ),
            child: CardInfo(
              maxWidth: 849,
              title: 'Sobre o IF Inclusivo',
              label:
                  'Desenvolvido por estudantes de Sistemas de Informação do IF Goiano Campus Urutaí em parceria com o NAPNE, para tornar a comunicação e o acesso à informação mais inclusivo.',
            ),
          ),
        ],
      ),
    );
  }

  _buildIntro(fontScale, deviceType) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        if (deviceType == DeviceScreenType.mobile) SizedBox(height: 50),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 426),
          child: Text(
            'Um espaço seguro para Interação e troca de Conhecimentos.',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize:
                  (Theme.of(context).textTheme.headlineLarge?.fontSize ?? 30) *
                  fontScale,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        SvgPicture.asset('assets/pana.svg'),
      ],
    );
  }

  _buildMainStacks(BuildContext context, fontScale, deviceType, spacing) {
    var color1 = Color.fromRGBO(114, 17, 153, 100);
    var color2 = Color.fromRGBO(70, 163, 74, 100);
    final fontScale = ResponsiveUtils.fontScale(context);
    var isDesktop = deviceType == DeviceScreenType.desktop;
    final double itemWidth = isDesktop ? 399 : 200;
    final double horizontalSpacing = isDesktop ? 79 : spacing.$1;

    return Column(
      spacing: deviceType == DeviceScreenType.desktop ? 77 : spacing.$2,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                deviceType == DeviceScreenType.desktop ? 180 : spacing.$1,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 757),
            child: Text(
              'Conheça as principais áreas do sistema e explore o que ele pode oferecer para você.',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize:
                    (Theme.of(context).textTheme.titleLarge?.fontSize ?? 25) *
                    fontScale,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Center(
          child: Wrap(
            alignment:
                WrapAlignment
                    .spaceBetween, // Center funciona bem para ambos os casos
            spacing: horizontalSpacing, // Espaçamento horizontal
            runSpacing: isDesktop ? 54 : spacing.$2, // Espaçamento vertical
            children: items.map<Widget>((itemInfo) {
              return buildStackItem(
                itemInfo, // Passa o objeto inteiro
                fontScale,
                deviceType,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  buildStackItem(
      StackItemInfo itemInfo, // Recebe o objeto com todos os dados
      double fontScale,
      deviceType,
      ) {
    double w = deviceType == DeviceScreenType.mobile ? 200 : 399;
    double h = deviceType == DeviceScreenType.mobile ? 167 : 180;

    return Card(
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.onPrimary,
      child: InkWell(
        onTap: itemInfo.onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            bottom: 25,
            right: 25,
          ),
          child: SizedBox(
            width: w,
            height: h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: deviceType == DeviceScreenType.mobile ? 18 : 36,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      color: itemInfo.color,
                      child: SizedBox(
                        width: deviceType == DeviceScreenType.mobile ? 69 : 118,
                        height: deviceType == DeviceScreenType.mobile ? 59 : 98,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(itemInfo.iconPath),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        itemInfo.title,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize:
                              (Theme.of(
                                    context,
                                  ).textTheme.titleLarge?.fontSize ??
                                  23) *
                              fontScale,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemInfo.label,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize:
                              (Theme.of(
                                    context,
                                  ).textTheme.titleLarge?.fontSize ??
                                  20) *
                              fontScale,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// MOLDE DE DADOS PARA CADA ITEM DO GRID
class StackItemInfo {
  final String iconPath;
  final String title;
  final String label;
  final Color color;
  final void Function() onTap;

  const StackItemInfo({
    required this.iconPath,
    required this.title,
    required this.label,
    required this.color,
    required this.onTap,
  });
}