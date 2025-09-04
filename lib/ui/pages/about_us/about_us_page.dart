import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/layout/app_bar.dart';
import 'package:if_inclusivo/ui/core/layout/app_bar_blocked.dart';
import 'package:if_inclusivo/ui/core/layout/footer.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBlocked(
        onPressedSingIn: (){},
        onPressedSingUp: (){},
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Placeholder()),
            Footer()
          ],
        ),
      ),
    );
  }
}
