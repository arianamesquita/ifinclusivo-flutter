import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';

class ListChipsCard extends StatefulWidget {
  final Set<Categorias> categorias;
  const ListChipsCard({super.key, required this.categorias});

  @override
  State<ListChipsCard> createState() => _ListChipsCardState();
}

class _ListChipsCardState extends State<ListChipsCard> {
  final List<Map<String, dynamic>> _chips = [
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
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chipsToShow =
        _chips
            .where((c) => widget.categorias.contains(c['categoria']))
            .toList();

    return Scrollbar(
      controller: _scrollController,
      child: SizedBox(
        height: 35,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          itemCount: chipsToShow.length,
          itemBuilder: (context, index) {
            final chipData = chipsToShow[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: BoxBorder.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 6,
                  bottom: 6,
                  left: 8,
                  right: 16,
                ),
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      chipData['icon'],
                      size: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      chipData['label'],
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 5);
          },
        ),
      ),
    );
  }
}
