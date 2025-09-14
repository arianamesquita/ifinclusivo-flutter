import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/core/animations/hover_effect.dart';
import 'package:if_inclusivo/ui/pages/presentation/widgets/custom_container.dart';
import 'package:if_inclusivo/ui/core/widgets/card_info.dart';
import 'package:if_inclusivo/ui/core/widgets/clickable_link.dart';

import '../../../../routing/app_router.dart';
import '../../../../utils/responsive_utils.dart';
import '../presentation_page.dart';

class AboltNapnePage extends StatelessWidget {
  const AboltNapnePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color1 = Color.fromRGBO(
      114,
      17,
      153,
      1,
    ); // Opacidade 100% é 1, não 100
    final Color color2 = Color.fromRGBO(70, 163, 74, 1);
    List<StackItemInfo> items = [
      StackItemInfo(
        iconPath: 'assets/icons/Livros.png',
        title: 'Educação Especial',
        label:
            'Educação na escola regular com apoio para estudantes com deficiência, autismo e altas habilidades.',
        color: color1,
        onTap: null,
      ),
      StackItemInfo(
        iconPath: 'assets/icons/Napne 1.png',
        title: 'Inclusão',
        label:
            'Garantia de acessibilidade, acolhimento e permanência dos estudantes, respeitando suas diferenças.',
        color: color2,
        onTap: null,
      ),
      StackItemInfo(
        iconPath: 'assets/icons/Quebra Cabeças.png',
        title: 'Transtorno do Espectro Autista',
        label:
            'Dificuldade na comunicação e interação social.\nApoio é essencial para o desenvolvimento.',
        color: color1,
        onTap: null,
      ),
      StackItemInfo(
        iconPath: 'assets/icons/Deficiência.png',
        title: 'Deficiência',
        label:
            'Pessoas com impedimentos podem enfrentar barreiras.\nO objetivo é garantir participação plena na sociedade.',
        color: color2,
        onTap: null,
      ),
      StackItemInfo(
        iconPath: 'assets/icons/Superdotação.png',
        title: 'Altas Habilidades/Superdotação',
        label:
            'Estudantes com alto potencial em áreas como ciência, artes ou esportes precisam de estímulo e desafio.',
        color: color1,
        onTap: null,
      ),
    ];
    final textScale = ResponsiveUtils.fontScale(context);
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final padding = ResponsiveUtils.defaultPadding(context);
    final (double, double) spacing = ResponsiveUtils.spacing(context);
    return CustomContainer(
      alwaysActive: true,
      onBack: () => context.go(AboutUsRoute().location),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1040),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical:
                      deviceType == DeviceScreenType.desktop
                          ? 96
                          : spacing.$2 + 20,
                ),
                child: _buildIntro(context, textScale, deviceType),
              ),

              _buildMainStacks(
                context,
                spacing,
                deviceType,
                textScale,
                items,
                padding,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical:
                      deviceType == DeviceScreenType.desktop
                          ? 116
                          : spacing.$2 + 20,
                ),
                child: _buildMoreInfo(context, textScale),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildMoreInfo(context, textScale) {
    final style = ResponsiveUtils.scaleFontStyle(
      context,
      Theme.of(context).textTheme.headlineSmall!,
    ).copyWith(
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Para mais informações:',
            style: ResponsiveUtils.scaleFontStyle(
              context,
              Theme.of(context).textTheme.headlineSmall!,
            ).copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Text('Fone/Fax:', style: style),
              ClickableLink(
                label: '(64) 3465-1900',
                value: '(64) 3465-1900',
                type: LinkType.phone,
                style: style,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              Text('Email:', style: style),
              ClickableLink(
                label: 'monica.canuto@ifgoiano.edu.br',
                style: style?.copyWith(decoration: TextDecoration.underline),
                value: 'monica.canuto@ifgoiano.edu.br',
                type: LinkType.email,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildMainStacks(
    context,
    (double, double) spacing,
    deviceType,
    textScale,
    List<StackItemInfo> items,
    padding,
  ) {
    return Column(
      spacing: deviceType == DeviceScreenType.desktop ? 31 : spacing.$2,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Conceitos e Diferenças. Saiba um pouco mais...',
            style: ResponsiveUtils.scaleFontStyle(
              context,
              Theme.of(context).textTheme.headlineSmall!,
            ).copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        ...items.map<Widget>((StackItemInfo itemInfo) {
          return buildStackItem(
            itemInfo,
            textScale,
            deviceType,
            context,
            padding,
            spacing,
          );
        }),
      ],
    );
  }

  _buildIntro(context, textScale, deviceType) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 151,
      runSpacing: deviceType == DeviceScreenType.desktop ? 80 : 20,

      children: [
        CardInfo(
          padding: EdgeInsets.only(left: 23, right: 23, top: 18, bottom: 20),
          spacing: 29,
          maxWidth: 470,
          title: '     O QUE É O NAPNE?',
          titleStyle: ResponsiveUtils.scaleFontStyle(
            context,
            Theme.of(context).textTheme.headlineSmall!,
          ).copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
          textAlign: TextAlign.start,
          label:
              "O NAPNE é o Núcleo de Apoio às Pessoas com Necessidades Educacionais Específicas."
              "\n\nSua proposta é promover ações de inclusão e garantir a participação de todos no campus.",
        ),
        SvgPicture.asset('assets/icons/amico.svg'),
      ],
    );
  }

  buildStackItem(
    StackItemInfo itemInfo, // Recebe o objeto com todos os dados
    double fontScale,
    deviceType,
    context,
    padding,
    spacing,
  ) {
    return HoverEffect(
      enableHover: deviceType == DeviceScreenType.desktop,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).colorScheme.onPrimary,
        child: Padding(
          padding:
              deviceType == DeviceScreenType.desktop
                  ? EdgeInsets.symmetric(horizontal: 41, vertical: 20)
                  : padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: deviceType == DeviceScreenType.desktop ? 28 : spacing.$1,
            children: [
              Container(
                width: deviceType == DeviceScreenType.mobile ? 70 : 120,
                height: deviceType == DeviceScreenType.mobile ? 60 : 100,
                decoration: BoxDecoration(
                  color: itemInfo.color,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Image.asset(itemInfo.iconPath)),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  spacing: 5,
                  children: [
                    Text(
                      itemInfo.title,
                      style: ResponsiveUtils.scaleFontStyle(
                        context,
                        Theme.of(context).textTheme.headlineSmall!,
                      ).copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      itemInfo.label,
                      style: ResponsiveUtils.scaleFontStyle(
                        context,
                        Theme.of(context).textTheme.titleLarge!,
                      ).copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      softWrap: true,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
