import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/specific_topic_grid.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';

import '../../../../utils/responsive_utils.dart';
import '../../../core/layout/custom_container_shell.dart';

class SpecificTopicPage extends StatelessWidget {
  const SpecificTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      SpecificTopicParams(
        "assets/player.png",
        'Enderço IP',
        "Aprenda o sinal para o identificador único de dispositivos em uma rede.",
        () {
          print("tepou endereço ip");
        },
      ),
      SpecificTopicParams(
        "assets/player.png",
        'Roteador e WI-FI',
        "Aprenda a como sinalizar esses dois equipamentos essenciais.",
        () {
          print("tepou roteador e wifi");
        },
      ),
      SpecificTopicParams(
        "assets/player.png",
        'Firewall',
        "Veja como sinalizar o conceito de barreira de segurança de redes.",
        () {
          print("tepou firewall");
        },
      ),
      SpecificTopicParams(
        "assets/player.png",
        'Protocolo TCP/IP',
        "Aprenda o sinal para o principal protocolo de comunicação.",
        () {
          print("tepou protocolo tcp/ip");
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
