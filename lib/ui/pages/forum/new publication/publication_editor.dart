import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/domain/models/enums/forum.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/forum/new%20publication/viewmodels/new_poblication_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/new%20publication/widgets/publication_form.dart';
import 'package:if_inclusivo/utils/forum_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:result_command/src/command.dart';

import '../../../../../domain/models/api/request/gen_requests.dart';
import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../domain/models/enums/categorias.dart';
import '../../../../../utils/responsive_utils.dart';

class PublicationEditorPage extends StatefulWidget {
  final PublicacaoDetalhadaModel? publicacaoDetalhadaModel;
  const PublicationEditorPage({super.key, this.publicacaoDetalhadaModel});

  @override
  State<PublicationEditorPage> createState() => _PublicationEditorPageState();
}

class _PublicationEditorPageState extends State<PublicationEditorPage> {
  late final PublicationEditorViewModel _viewModel;
  final Set<Categorias> _selectedCategories = {};
  final TextEditingController _titleController = TextEditingController();
  final QuillController _bodyController = QuillController.basic();
  final FocusNode _focusNodeTitle = FocusNode();
  final FocusNode _focusNodeBody = FocusNode();

  TipoPublicacao _typePublication = TipoPublicacao.DUVIDA;
  String? _titleError;
  String? _bodyError;
  bool _titleTouched = false;
  bool _bodyTouched = false;
  bool _categoryIsEmpty = false;

  @override
  void initState() {
    super.initState();
    _viewModel = PublicationEditorViewModel(forumRepository: context.read());

    final pub = widget.publicacaoDetalhadaModel;
    if (pub != null) {
      _titleController.text = pub.titulo;
      _bodyController.document = loadDocument(text: pub.texto);
      _selectedCategories.addAll(pub.categorias);
      _typePublication = pub.tipo;
    }

    _focusNodeBody.addListener(() {
      setState(() {});
    });

    _focusNodeTitle.addListener(() {
      setState(() {});
    });
    _titleController.addListener(_handlerValidateTitle);
    _bodyController.addListener(_handlerValidateBody);
    _viewModel.addPublicationCommand.addListener(_handlerPostCommand);
    _viewModel.updatePublicationCommand.addListener(_handlerUpdateCommand);
  }

  _handlerPostCommand(){
    final cmd = _viewModel.addPublicationCommand;
    switch(cmd.value){

      case IdleCommand<PublicacaoDetalhadaModel>():
      case CancelledCommand<PublicacaoDetalhadaModel>():
      case RunningCommand<PublicacaoDetalhadaModel>():
        return;
      case FailureCommand<PublicacaoDetalhadaModel>():
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro ao Publicar'),
              content: Text('Não foi possível criar a publicação. Por favor, tente novamente.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    // Fecha o AlertDialog
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        cmd.reset();
      case SuccessCommand<PublicacaoDetalhadaModel>(:final value):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Publicação criada com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        cmd.reset();
        PublicacaoRouter(value.id).go(context);

    }
  }

  _handlerUpdateCommand(){
    final cmd = _viewModel.updatePublicationCommand;
    switch(cmd.value){

      case IdleCommand<PublicacaoDetalhadaModel>():
      case CancelledCommand<PublicacaoDetalhadaModel>():
      case RunningCommand<PublicacaoDetalhadaModel>():
        return;
      case FailureCommand<PublicacaoDetalhadaModel>():
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro ao Publicar'),
              content: Text('Não foi possível criar a publicação. Por favor, tente novamente.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    // Fecha o AlertDialog
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        cmd.reset();
      case SuccessCommand<PublicacaoDetalhadaModel>(:final value):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Publicação atualizada com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        cmd.reset();
        if (context.mounted) {
          context.pop(true);
        }
        break;

    }
  }

  _handlerValidateTitle() {
    final titleLength = _titleController.text.trim().length;
    final isEmpty = _titleController.text.trim().isEmpty;

    if (!_titleTouched && isEmpty) {
      return;
    } else if (!isEmpty) {
      setState(() {
        _titleTouched = true;
      });
    }

    setState(() {
      _titleError =
          isEmpty
              ? 'O titulo não pode ser vazio'
              : (titleLength > 255)
              ? 'Limite de caracteres excedido'
              : null;
    });
  }

  _handlerValidateBody() {
    final isEmpty = _bodyController.document.toPlainText().trim().isEmpty;
    final detailLength = _bodyController.document.toPlainText().trim().length;

    if (!_bodyTouched && isEmpty) {
      return;
    } else if (!isEmpty) {
      setState(() {
        _bodyTouched = true;
      });
    }

    setState(() {
      _bodyError =
          isEmpty
              ? 'O campo não pode ser vazio'
              : (detailLength > 3000)
              ? 'Limite de caracteres excedido'
              : null;
    });
  }

  bool _validateForm() {
    final categorias = _selectedCategories;
    if (categorias.isEmpty) {
      setState(() {
        _categoryIsEmpty = true;
        _bodyTouched = true;
        _titleTouched = true;
      });
    }
    _handlerValidateBody();
    _handlerValidateTitle();
    return _titleError == null && _bodyError == null && categorias.isNotEmpty;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  buildElevatedButton() {
    return FilledButton.icon(
      onPressed: () async {
        if (!_validateForm()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'existe campos com erros, verifique e tente novamente',
              ),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        final model = PublicacaoRequestModel(
          titulo: _titleController.text,
          texto: jsonEncode(_bodyController.document.toDelta().toJson()),
          categorias: _selectedCategories,
          tipo: _typePublication,
        );
        if (widget.publicacaoDetalhadaModel == null) {
          _viewModel.addPublicationCommand.execute(model);
        } else {
          _viewModel.updatePublicationCommand.execute(
            widget.publicacaoDetalhadaModel!.id,
            model,
          );
        }
      },
      label: Text(
        (widget.publicacaoDetalhadaModel != null) ? 'Atualizar' : 'Postar',
      ),
      icon: Icon(
        (widget.publicacaoDetalhadaModel != null) ? Icons.edit : Icons.send,
      ),
      iconAlignment: IconAlignment.end,
    );
  }

  @override
  Widget build(BuildContext context) {
    var device = ResponsiveUtils.getDeviceType(context);
    return ListenableBuilder(
      listenable: Listenable.merge([
        _viewModel.addPublicationCommand,
        _viewModel.updatePublicationCommand,
      ]),
      builder: (context, _) {
        if (_viewModel.addPublicationCommand.value.isRunning ||
            _viewModel.updatePublicationCommand.value.isRunning) {
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
          return buildMobile();
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

  final List<Map<String, dynamic>> _tipos = [
    {'tipo': TipoPublicacao.DUVIDA, 'label': 'Duvidas'},
    {'tipo': TipoPublicacao.AVISO, 'label': 'Aviso'},
    {'tipo': TipoPublicacao.DICA, 'label': 'Dica'},
    {'tipo': TipoPublicacao.MENTORIA, 'label': 'Mentoria'},
  ];

  Widget _buildTipos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
      child: Row(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Como você classificaria sua publicação?',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              softWrap: true,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<TipoPublicacao>(
              value: _typePublication,
              onChanged: (TipoPublicacao? novoValor) {
                if (novoValor != null) {
                  setState(() {
                    _typePublication = novoValor;
                  });
                }
              },
              items:
                  _tipos.map((item) {
                    return DropdownMenuItem<TipoPublicacao>(
                      value: item['tipo'],
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(item['label']),
                      ),
                    );
                  }).toList(),
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

            PublicationForm(
              titleController: _titleController,
              bodyController: _bodyController,
              focusTitle: _focusNodeTitle,
              focusBody: _focusNodeBody,
              errorBody: _bodyError,
              errorTitle: _titleError,
            ),
            buildListChips(),
            if (widget.publicacaoDetalhadaModel == null) _buildTipos(),
            buildFunctionsBar(context),
          ],
        ),
      ),
    );
  }

  Scaffold buildMobile() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Publicação'),
        actions: [buildElevatedButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PublicationForm(
              titleController: _titleController,
              bodyController: _bodyController,
              focusTitle: _focusNodeTitle,
              focusBody: _focusNodeBody,
              errorBody: _bodyError,
              errorTitle: _titleError,
            ),
            buildListChips(),
            if (widget.publicacaoDetalhadaModel == null) _buildTipos(),
          ],
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            spacing: 10,
            children: [
              Text(
                'Categorias:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (_categoryIsEmpty)
                Tooltip(
                  message: 'Selecione uma categoria',
                  child: Icon(
                    Icons.info,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
            ],
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children:
                _filters.map((f) {
                  final label = f['label'] as String;
                  final icon = f['icon'] as IconData;
                  final categoria = f['categoria'] as Categorias;
                  final selected = _selectedCategories.contains(categoria);
                  return FilterChip(
                    label: Text(label),
                    avatar: selected ? null : Icon(icon),
                    selected: selected,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    shape:
                        _categoryIsEmpty
                            ? RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.error,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            )
                            : null,
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          _selectedCategories.add(categoria);
                          if (_categoryIsEmpty) {
                            setState(() {
                              _categoryIsEmpty = false;
                            });
                          }
                        } else {
                          _selectedCategories.remove(categoria);
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
