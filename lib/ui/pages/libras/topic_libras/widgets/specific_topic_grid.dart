import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/topic_libras/widgets/specific_topic.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

class SpecificTopicGridParams {
  final String title;
  final String url;
  final String description;
  final GestureTapCallback onTap;

  SpecificTopicGridParams({
    required this.title,
    required this.url,
    required this.description,
    required this.onTap,
  });
}

class SpecificTopicGrid extends StatelessWidget {
  final List<SpecificTopicGridParams> specificTopicsList;
  const SpecificTopicGrid({super.key, required this.specificTopicsList});
  @override
  Widget build(BuildContext context) {
   late (double, double) spacing;
    switch (ResponsiveUtils.getDeviceType(context)){

      case DeviceScreenType.mobile:
        spacing = (0,15);
        break;
      case DeviceScreenType.tablet:
        spacing = (20,18);
        break;
      case DeviceScreenType.desktop:
        spacing = (65, 34);
        break;
    }


    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.start,
          spacing: spacing.$1,
          runSpacing: spacing.$2,
          children:
              specificTopicsList.map((arg) {
                return SpecificTopic(
                  title: arg.title,
                  description: arg.description,
                  onTap: arg.onTap,
                  url: arg.url,
                );
              }).toList(),
        ),
      ),
    );
  }
}
