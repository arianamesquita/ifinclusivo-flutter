import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/specific_topic_grid.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';

import '../../../../routing/app_router.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../core/layout/custom_container_shell.dart';

class SpecificTopicPage extends StatelessWidget {
  const SpecificTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      SpecificTopicGridParams(
        plyaerUrl: "assets/player.png",
        title: 'Enderço IP',
        description: "Aprenda o sinal para o identificador único de dispositivos em uma rede.",
        onTap: () {
          context.push(MidiaRouter().location);
          print('tepou');
        },
      ),
      SpecificTopicGridParams(
        plyaerUrl: "assets/player.png",
        title: 'Roteador e WI-FI',
        description: "Aprenda a como sinalizar esses dois equipamentos essenciais.",
        onTap: () {
          context.push(MidiaRouter().location);
          print('tepou');
        },
      ),
      SpecificTopicGridParams(
        plyaerUrl: "assets/player.png",
        title: 'Firewall',
        description: "Veja como sinalizar o conceito de barreira de segurança de redes.",
        onTap: () {
          context.push(MidiaRouter().location);
          print('tepou');
        },
      ),
      SpecificTopicGridParams(
        plyaerUrl: "assets/player.png",
        title: 'Protocolo TCP/IP',
        description: "Aprenda o sinal para o principal protocolo de comunicação.",
        onTap: () {
          context.push(MidiaRouter().location);
          print('tepou');
        },
      ),
    ];

    DeviceScreenType device = ResponsiveUtils.getDeviceType(context);

    return device == DeviceScreenType.mobile
        ? Scaffold(
          appBar: AppBar(title: Text('Redes de Computadores')),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Um dicionário de sinais criado para a comunidade"),
                  SizedBox(height: 90),
                  SpecificTopicGrid(specificTopicsList: items),
                ],
              ),
            ),
          ),
        )
        : CustomContainerShell(
          child: Column(
            children: [
              TopContentLibras(
                title: "Redes de Computadores",
                subtitle: "Um dicionário de sinais criado para a comunidade",
              ),
              SizedBox(height: 15),
              SpecificTopicGrid(specificTopicsList: items),
            ],
          ),
        );
  }
}
