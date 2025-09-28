import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/viewmodels/specific_topic_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/widgets/specific_topic_grid.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';
import 'package:provider/provider.dart';

import '../../../../routing/app_router.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../core/layout/custom_container_shell.dart';

class SpecificTopicPage extends StatefulWidget {
  final String categoria;
  const SpecificTopicPage({super.key, required this.categoria});

  @override
  State<SpecificTopicPage> createState() => _SpecificTopicPageState();
}

class _SpecificTopicPageState extends State<SpecificTopicPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.categoria != null) {
        Categorias categorias = Categorias.REDES;
        if (widget.categoria == Categorias.REDES.name)
          categorias == Categorias.REDES;
        if (widget.categoria == Categorias.ARQUITETURA_DE_COMPUTADORES)
          categorias == Categorias.ARQUITETURA_DE_COMPUTADORES;
        if (widget.categoria == Categorias.BANCO_DE_DADOS.name)
          categorias == Categorias.BANCO_DE_DADOS;
        if (widget.categoria == Categorias.WEB.name)
          categorias == Categorias.WEB;
        if (widget.categoria == Categorias.ESTRUTURA_DE_DADOS.name)
          categorias == Categorias.ESTRUTURA_DE_DADOS;
        if (widget.categoria == Categorias.PROGRAMACAO.name)
          categorias == Categorias.PROGRAMACAO;
        await context.read<SpecificTopicViewModel>().fetchLibras(categorias);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DeviceScreenType device = ResponsiveUtils.getDeviceType(context);

    return Consumer<SpecificTopicViewModel>(
      builder: (context, viewModel, state) {
        if (viewModel.state == SpecificTopicsState.loading) {
          return Center(child: CircularProgressIndicator());
        }
        print(viewModel.models);

        List<SpecificTopicGridParams> items = viewModel.models == null || viewModel.models.isEmpty
            ? []
            : viewModel.models
            .map(
              (model) => SpecificTopicGridParams(
            plyaerUrl: model.url!,
            title: model.palavra,
            description: model.descricao,
            onTap: () => MidiaRouter().push(context),
          ),
        )
            .toList();
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
                    subtitle:
                        "Um dicionário de sinais criado para a comunidade",
                  ),
                  SizedBox(height: 15),
                  SpecificTopicGrid(specificTopicsList: items),
                ],
              ),
            );
      },
    );
  }
}
