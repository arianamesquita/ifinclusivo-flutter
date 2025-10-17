import 'package:flutter/material.dart';
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
  String _title = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Categorias categoriaSelecionada;

      switch (widget.categoria) {
        case 'REDES':
          categoriaSelecionada = Categorias.REDES;
          _title = 'Redes de Computadores';
          break;
        case 'ARQUITETURA_DE_COMPUTADORES':
          categoriaSelecionada = Categorias.ARQUITETURA_DE_COMPUTADORES;
          _title = 'Arquitetura de Computadores';
          break;
        case 'BANCO_DE_DADOS':
          categoriaSelecionada = Categorias.BANCO_DE_DADOS;
          _title = 'Banco de Dados';
          break;
        case 'ESTRUTURA_DE_DADOS':
          categoriaSelecionada = Categorias.ESTRUTURA_DE_DADOS;
          _title = 'Estrutura de Dados';
          break;
        case 'PROGRAMACAO':
          categoriaSelecionada = Categorias.PROGRAMACAO;
          _title = 'Programação';
          break;
        default:
          categoriaSelecionada = Categorias.WEB;
          _title = 'Web';
      }

      setState(() {});

      await context.read<SpecificTopicViewModel>().fetchLibras(categoriaSelecionada);
    });
  }

  @override
  Widget build(BuildContext context) {
    DeviceScreenType device = ResponsiveUtils.getDeviceType(context);

    return Consumer<SpecificTopicViewModel>(
      builder: (context, viewModel, state) {
        if (viewModel.state == SpecificTopicsState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        List<SpecificTopicGridParams> items = viewModel.models.isEmpty ? [] : viewModel.models.map((model) {
          return SpecificTopicGridParams(
            title: model.palavra,
            description: model.descricao,
            url: model.url!,
            onTap: () => {
              viewModel.setId(model.id),
              viewModel.setVideoUrl(model.url!),
              MidiaRouter(model.id).push(context),
            },
          );
        }).toList();

        return device == DeviceScreenType.mobile
            ? Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Explore os principais sinais de Libras sobre este tema.",
                  ),
                  const SizedBox(height: 90),
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
                title: _title,
                subtitle:
                "Explore os principais sinais de Libras sobre este tema.",
              ),
              const SizedBox(height: 15),
              SpecificTopicGrid(specificTopicsList: items),
            ],
          ),
        );
      },
    );
  }
}
