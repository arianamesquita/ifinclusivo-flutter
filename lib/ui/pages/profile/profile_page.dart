
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:if_inclusivo/routing/app_router.dart';

import '../../../utils/responsive_utils.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
    State<ProfilePage> createState() => _ProfilePageState();
}

  class _ProfilePageState extends State<ProfilePage> {
    @override
    void initState() {
      super.initState();
    }
    @override
    void dispose() {
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      final deviceType = ResponsiveUtils.getDeviceType(context);
      final fontScale = ResponsiveUtils.fontScale(context);
      return Scaffold(
        body: Container(
            child: Stack(
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        child: Text("Configurações"),
                        onPressed: () {
                          AccountSecurityRouter().go(context);
                        },
                      ),
                      ElevatedButton(
                        child: Text("EditProfile"),
                        onPressed: () {
                          EditProfileRouter().go(context);
                        },
                      )
                    ],
                  ),
              ]
          )
        )
      );
    }
  }
