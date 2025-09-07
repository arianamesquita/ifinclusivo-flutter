import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container.dart';

import '../../../../routing/pages/about_routes/routes/about_us_router.dart';



class AboltNapnePage extends StatelessWidget {
  const AboltNapnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(onPressed: (){
            context.go(AboutUsRoute().location);
          }, child: Text('ir para about - us'))
        ],
      ),
    );
  }
}
