import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/enums/forum.dart';
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
  const NewPublicationPage({super.key,});

  @override
  State<NewPublicationPage> createState() => _NewPublicationPageState();
}

class _NewPublicationPageState extends State<NewPublicationPage> {
  late final Set<Categorias> _selectedFilters = {};
  final TextEditingController perguntaController = TextEditingController();
  final QuillController detalheController = QuillController.basic();
  final ValueNotifier<bool> isFormValid = ValueNotifier(false);
  TipoPublicacao _tipoPublicacao = TipoPublicacao.DUVIDA;

  @override
  void initState() {
    super.initState();

    perguntaController.addListener(_validateForm);
    detalheController.changes.listen((_) => _validateForm());

  }

  void _validateForm() {
    final title = perguntaController.text.trim();
    final plainText = detalheController.document.toPlainText().trim();
    final categorias = _selectedFilters;

    isFormValid.value = title.isNotEmpty && plainText.isNotEmpty && categorias.isNotEmpty;
  }

  @override
  void dispose() {
    perguntaController.dispose();
    detalheController.dispose();
    isFormValid.dispose();
    super.dispose();
  }

   buildElevatedButton() {
     final stateContext = context;
    return
      ValueListenableBuilder<bool>(
          valueListenable: isFormValid,
          builder: (context, isEnabled, _) {
            return ElevatedButton.icon(
        onPressed:
        isEnabled
            ? () async {
          final model = PublicacaoRequestModel(
            titulo: perguntaController.text,
            texto: jsonEncode(detalheController.document.toDelta().toJson()),
            categorias: _selectedFilters,
            tipo:_tipoPublicacao
          );
          final response = await context
              .read<NewPublicationViewModel>()
              .postPublication(model);
          if (response != null && mounted) {
            PublicacaoRouter(response.id).pushReplacement(stateContext);
          }
        }
            : null,
        label: Text('Postar'),
        icon: Icon(Icons.send),
        iconAlignment: IconAlignment.end,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var device = ResponsiveUtils.getDeviceType(context);
    return Consumer<NewPublicationViewModel>(
      builder: (context, viewModel, state) {
        if (viewModel.state == NewPublicationState.loading) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
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

  final List<Map<String,dynamic>> _tipos =[
    {'tipo': TipoPublicacao.DUVIDA, 'label': 'Duvidas'},
    {'tipo': TipoPublicacao.AVISO, 'label': 'Aviso'},
    {'tipo': TipoPublicacao.DICA, 'label': 'Dica'},
    {'tipo': TipoPublicacao.MENTORIA, 'label': 'Mentoria'},
  ];


  Widget _buildTipos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Como você classificaria sua publicação?',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 12),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                color:Theme.of(context).colorScheme.outline
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<TipoPublicacao>(
                value: _tipoPublicacao,
                onChanged: (TipoPublicacao? novoValor) {
                  if (novoValor != null) {
                    setState(() {
                      _tipoPublicacao = novoValor;
                    });
                  }
                },
                items: _tipos.map((item) {
                  return DropdownMenuItem<TipoPublicacao>(
                    value: item['tipo'],
                    child: Padding(
                      padding: const EdgeInsets.only(left:3),
                      child: Text(item['label']),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  ConstrainedBox buildBigScreens(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: ResponsiveUtils.spacingColumn(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 13.0, bottom: 8),
                  child: Text(
                    'Nova Publicação',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(),
              ],
            ),
            PerguntaForm(
              perguntaController: perguntaController,
              detalheController: detalheController,
            ),_buildTipos(),
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
        actions: [buildElevatedButton()],
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PerguntaForm(
                perguntaController: perguntaController,
                detalheController: detalheController,
              ),
              buildListChips(),
            ],
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
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 16,
            top: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 20,
                    ),
                    Text(
                      'Cancelar',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              buildElevatedButton(),
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
          Text(
            'Categorias:',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
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
