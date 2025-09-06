import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/widgets/clickable_link.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceType = ResponsiveUtils.getDeviceType(context);
    var (double w,double h)  = ResponsiveUtils.spacing(context);
    var fontScale = ResponsiveUtils.fontScale(context);
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.tertiary),
      width: double.infinity,
      child: Padding(
        padding: ResponsiveUtils.defaultPadding(context),
        child:Center(child:
            deviceType == DeviceScreenType.mobile
                ? Column(

                  children: [
                    _buildInfoHelper(context, fontScale),
                    SizedBox(height:  h),
                    _buildInstituteName(context, fontScale),
                  ],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildInfoHelper(context, fontScale),
                    SizedBox(width: w,),
                    Flexible(
                        fit: FlexFit.loose,child: _buildInstituteName(context, fontScale)),
                  ],
                ),),
      ),
    );
  }

  Widget _buildInstituteName(BuildContext context, double fontScale) {
    return Text(
      'INSTITUTO FEDERAL GOIANO - CAMPUS URUTAÍ',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: Theme.of(context).colorScheme.onTertiary,
        fontSize: (Theme.of(context).textTheme.headlineSmall?.fontSize ??24)*fontScale,
      ),
      softWrap: true,
      maxLines: 4,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildInfoHelper(BuildContext context, double fontScale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        Text(
          'Precisa de ajuda?',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onTertiary,
            fontWeight: FontWeight.w600,
            fontSize:
            ((Theme.of(context).textTheme.titleLarge?.fontSize ?? 22) + 1)*fontScale,
          ),
        ),
        ClickableLink(
          label: 'ifinclusivo@gmail.com',
          value: 'ifinclusivo@gmail.com',
          type: LinkType.email,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onTertiary,
            fontSize: (Theme.of(context).textTheme.titleLarge?.fontSize ?? 22)*fontScale
          ),
        ),
      ],
    );
  }
}
