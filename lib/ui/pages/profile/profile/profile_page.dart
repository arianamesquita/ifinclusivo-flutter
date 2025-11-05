import 'package:flutter/material.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/ui/pages/profile/profile/widgets/profile_info.dart';
import 'package:if_inclusivo/ui/pages/profile/profile/widgets/profile_preview.dart';
import 'package:provider/provider.dart';

import '../../../../utils/responsive_utils.dart';

class ProfilePage extends StatefulWidget {
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
    final repository = context.read<AuthRepository>();
    final user = repository.currentUser;
    if (user == null) {
      return Scaffold(body: Center(child: Text('error ao carregar usuario')));
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 21,
                ),
                child:
                    deviceType == DeviceScreenType.mobile
                        ? Column(spacing: 15,
                          mainAxisSize: MainAxisSize.min,
                          children: _buildInfosMobile(user),
                        )
                        : Row(
                          spacing:
                              deviceType == DeviceScreenType.tablet
                                  ? 50
                                  : 100,

                          children: _buildInfos(user),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildInfos(UsuarioResponseModel user) {
    return [
      ProfilePreview(user: user),
      Expanded(child: ProfileInfo(user: user)),
    ];
  }

  List<Widget> _buildInfosMobile(UsuarioResponseModel user) {
    return [ProfilePreview(user: user), ProfileInfo(user: user)];
  }
}
