import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container.dart';
import '../../../../routing/pages/about_routes/routes/about_napne_router.dart';


class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              context.go(AboutNapneRoute().location);
            }, child: Text('ir para about - napne')),
            SizedBox(height: 1200,)
          ],
        ),
      ),
    );
  }
}
