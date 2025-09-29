import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/forum/new%20publication/viewmodels/new_poblication_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/new%20publication/widgets/PerguntaForm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quill/flutter_quill.dart';


import '../../../../../domain/models/api/request/gen_requests.dart';
import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../domain/models/enums/categorias.dart';
import '../../../../../utils/responsive_utils.dart';


class NewPublicationPage extends StatefulWidget {
  final PublicacaoDetalhadaModel? model;
  const NewPublicationPage({  super.key, this.model});

  @override
  State<NewPublicationPage> createState() => _NewPublicationPageState();
}

class _NewPublicationPageState extends State<NewPublicationPage> {
  late final Set<Categorias> _selectedFilters = {};
  final TextEditingController perguntaController = TextEditingController();
  final QuillController detalheController = QuillController.basic();

  @override
  void initState() {
    super.initState();
    if(widget.model !=null){
      _selectedFilters.addAll(widget.model!.categorias);
    }
  }
  @override
  void dispose() {
    perguntaController.dispose();
    detalheController.dispose();
    super.dispose();
  }

  ElevatedButton buildElevatedButton() {
    final title =perguntaController.text;
    final content = jsonEncode(detalheController.document.toDelta().toJson());


    return ElevatedButton.icon(
      onPressed:(title.isNotEmpty&&content.isNotEmpty&& _selectedFilters.isNotEmpty)? () async {
        final model = PublicacaoRequestModel(titulo: title, texto: content, categorias: _selectedFilters, parentId: widget.model?.id);
        final response = await context.read<NewPublicationViewModel>().postPublication(model);
        if(response != null) PublicacaoRouter(response.id).pushReplacement(context);
      }: null,
      label: Text('Postar'),
      icon: Icon(Icons.send),
      iconAlignment: IconAlignment.end,
    );
  }


  @override
  Widget build(BuildContext context) {
    var device = ResponsiveUtils.getDeviceType(context);
    return Consumer<NewPublicationViewModel>(
      builder: (context,viewModel, state){
        if(viewModel.state == NewPublicationState.loading){
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(height: 50,width: 50,
                    child: CircularProgressIndicator()),
              ),
            ],
          );
        }
        if (device == DeviceScreenType.mobile) {
          return buildMobile(viewModel.currentUser!);
        } else {
          return buildBigScreens(context);
        }
      },
    );


  }


  final List<Map<String, dynamic>> _filters = [
    {'categoria': Categorias.REDES, 'label': 'Redes', 'icon': Icons.wifi},
    {
      'categoria': Categorias.BANCO_DE_DADOS,
      'label': 'Banco de Dados',
      'icon': Icons.storage,
    },
    {
      'categoria': Categorias.PROGRAMACAO,
      'label': 'Programação',
      'icon': Icons.code,
    },
    {'categoria': Categorias.WEB, 'label': 'Web', 'icon': Icons.web},
    {
      'categoria': Categorias.ESTRUTURA_DE_DADOS,
      'label': 'Estrutura de Dados',
      'icon': Icons.account_tree_outlined,
    },
    {
      'categoria': Categorias.ARQUITETURA_DE_COMPUTADORES,
      'label': 'Arquitetura de Computadores',
      'icon': Icons.hardware_outlined,
    },
  ];
  ConstrainedBox buildBigScreens(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: ResponsiveUtils.spacingColumn(context)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Padding(
              padding: const EdgeInsets.only(top: 13.0,bottom: 8),
              child: Text('Nova Publicação',style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,),
            ), Divider()]),
            PerguntaForm(perguntaController:perguntaController , detalheController: detalheController,),
            buildListChips(),
            buildFunctionsBar(context),
          ],
        ),
      ),
    );
  }

  Scaffold buildMobile(UsuarioResponseModel usuarioResponseModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Publicação'),
        actions: [
          buildElevatedButton(),
        ],
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PerguntaForm(perguntaController:perguntaController , detalheController: detalheController,), buildListChips()],
          ),
        ),
      ),
    );
  }



  Column buildFunctionsBar(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left:  20.0, right: 20.0,bottom: 16, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.cancel_outlined, color: Theme.of(context).colorScheme.onSurface, size: 20,),
                    Text('Cancelar', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                    ),),

                  ],
                ),
              ),
              buildElevatedButton()
            ],
          ),
        ),
      ],
    );
  }



  buildListChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text('Categorias:',style: Theme.of(context).textTheme.labelLarge?.copyWith(color:
          Theme.of(context).colorScheme.onSurface),),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children:
                _filters.map((f) {
                  final label = f['label'] as String;
                  final icon = f['icon'] as IconData;
                  final categoria = f['categoria'] as Categorias;
                  final selected = _selectedFilters.contains(categoria);
                  return FilterChip(
                    label: Text(label),
                    avatar: selected ? null : Icon(icon),
                    selected: selected,
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          _selectedFilters.add(categoria);
                        } else {
                          _selectedFilters.remove(categoria);
                        }
                      });
                    },
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
