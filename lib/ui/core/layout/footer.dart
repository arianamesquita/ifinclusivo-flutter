import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:if_inclusivo/ui/core/widgets/clickable_link.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 306, // altura do footer
      width: double.infinity,
      child: Stack(
        children: [
          /// SVG de trás
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/footer/Rectangle 414.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          /// SVG da frente
          Positioned.fill(
            top: 50,
            child: SvgPicture.asset(
              "assets/footer/Rectangle 413.svg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 240,
                  vertical: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          'Precisa de ajuda?',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ClickableLink(label: 'ifinclusivo@gmail.com', value: 'ifinclusivo@gmail.com',type: LinkType.email,
                        style:  Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500,
                        ),)
                      ],
                    ),
                    Text(
                      'INSTITUTO FEDERAL GOIANO - CAMPUS URUTAÍ',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
