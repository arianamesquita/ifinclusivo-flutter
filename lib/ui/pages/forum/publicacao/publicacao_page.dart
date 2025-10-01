import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/domain/models/gen_models.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/viewmodels/publicacao_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/publication_tile.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/publication.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';
import 'package:result_command/src/command.dart';
import 'package:result_dart/functions.dart';

import '../../../../domain/models/enums/categorias.dart';
import '../feed/widgets/sort_dropdown_button.dart';

class PublicacaoPage extends StatefulWidget {
  final int id;
  final PublicacaoViewModel viewModel;
  const PublicacaoPage({super.key, required this.id, required this.viewModel});

  @override
  State<PublicacaoPage> createState() => _PublicacaoPageState();
}

class _PublicacaoPageState extends State<PublicacaoPage> {
  String _selectedOrder = 'Relevância';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ListenableBuilder(
          listenable: widget.viewModel.fetchPublicationCommand,
          builder: (context, _) {
            final publication = widget.viewModel.publication;

            return AppBar(
              title: const Text('Post'),
              centerTitle: true,
              automaticallyImplyLeading: (publication?.pais.isEmpty ?? true),
            );
          },
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveUtils.spacingColumn(context),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListenableBuilder(
                  listenable: widget.viewModel.fetchPublicationCommand,
                  builder: (context, _) {
                    final state =
                        widget.viewModel.fetchPublicationCommand.value;

                    switch (state) {
                      case RunningCommand<PublicacaoCompletaModel>():
                        return const Center(child: CircularProgressIndicator());

                      case FailureCommand<PublicacaoCompletaModel>(
                        :final error,
                      ):
                        return Center(child: Text('Erro: $error'));

                      case SuccessCommand<PublicacaoCompletaModel>(
                        :final value,
                      ):
                        return Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    if (value.pais.isNotEmpty)
                                      buildpais(value, context),
                                    Publication(model: value.atual),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                          ),
                                          child: Divider(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Soluções da comunidade:',
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.labelLarge,
                                              ),
                                              SortDropdownButton(
                                                menuItems: [
                                                  'Relevância',
                                                  'Mais recente',
                                                ],
                                                selectedItem: _selectedOrder,
                                                onSelected: (
                                                  String value,
                                                ) async {
                                                  setState(() {
                                                    _selectedOrder = value;
                                                  });
                                                  final ordenar =
                                                      value == 'Mais recente'
                                                          ? Ordenacao
                                                              .MAIS_RECENTE
                                                          : Ordenacao
                                                              .RELEVANCIA;

                                                  // Agora dispara o command do ViewModel
                                                  widget
                                                      .viewModel
                                                      .fetchRespostasCommand
                                                      .execute(
                                                        widget.id,
                                                        ordenar,
                                                      );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                          ),
                                          child: Divider(),
                                        ),
                                      ],
                                    ),
                                    ListenableBuilder(
                                      listenable:
                                          widget
                                              .viewModel
                                              .fetchRespostasCommand,
                                      builder: (context, _) {
                                        final respostaState =
                                            widget
                                                .viewModel
                                                .fetchRespostasCommand
                                                .value;

                                        switch (respostaState) {
                                          case RunningCommand<
                                            List<PublicacaoDetalhadaModel>
                                          >():
                                            return const Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 80.0,
                                                ),
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );

                                          case FailureCommand<
                                            List<PublicacaoDetalhadaModel>
                                          >(
                                            :final error,
                                          ):
                                            return Center(
                                              child: Text('Erro: $error'),
                                            );

                                          case SuccessCommand<
                                            List<PublicacaoDetalhadaModel>
                                          >(
                                            :final value,
                                          ):
                                            return Column(
                                              children:
                                                  value.map((model) {
                                                    return PublicacaoTile(
                                                      model: model,
                                                    );
                                                  }).toList(),
                                            );

                                          case IdleCommand<
                                            List<PublicacaoDetalhadaModel>
                                          >():
                                          case CancelledCommand<
                                            List<PublicacaoDetalhadaModel>
                                          >():
                                            return const SizedBox.shrink();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Column(
                              children: [
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 16,
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 56,
                                    child: ElevatedButton(
                                      onPressed:
                                          () => context.push(
                                            NewPublicacaoRouter().location,
                                            extra: state.value.atual,
                                          ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Theme.of(
                                              context,
                                            ).colorScheme.surfaceContainerHigh,
                                        foregroundColor:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Responder ${state.value.atual.usuario.nome}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );

                      case IdleCommand<PublicacaoCompletaModel>():
                      case CancelledCommand<PublicacaoCompletaModel>():
                        return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildpais(PublicacaoCompletaModel value, BuildContext context) {
    return Column(
      children:
          value.pais.reversed.map((pai) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    PublicacaoRouter(pai.id).go(context);
                  },
                  mouseCursor: SystemMouseCursors.grab,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                              child: Container(
                                color: Theme.of(context).colorScheme.outline,
                                width: 1,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [Text(pai.usuario.nome), Text(pai.titulo)],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
