import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/forum/feed/widgets/sort_dropdown_button.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

import '../../../../../domain/models/enums/categorias.dart';

class FilterChipsBar extends StatefulWidget {
  final void Function(List<Categorias> selected, String order)? onChanged;

  const FilterChipsBar({super.key, this.onChanged});

  @override
  State<FilterChipsBar> createState() => _FilterChipsBarState();
}

class _FilterChipsBarState extends State<FilterChipsBar> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // Libere o controller para evitar vazamentos de memória
    _scrollController.dispose();
    super.dispose();
  }

  String _selectedOrder = 'Relevância';
  late Set<Categorias> _selectedFilters = {};

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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        Row(
          children: [
            IconButton.filled(
              onPressed: () => _openFilters(context),
              icon: Icon(Icons.filter_list_rounded),
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            if (_selectedFilters.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionChip(
                  avatar: Icon(Icons.clear_all_rounded),
                  label: Text('Limpar (${_selectedFilters.length.toString()})'),
                  onPressed: () {
                    setState(() {
                      _selectedFilters.removeAll(_selectedFilters.toList());
                    });
                  },
                  
                ),
              ),
          ],
        ),
        SortDropdownButton(menuItems: ['Relevância','Mais recente'], selectedItem: _selectedOrder, onSelected: (String value){
          setState(() => _selectedOrder = value);
          _notifyChange();
        })

      ],
    );
  }

  void _notifyChange() {
    widget.onChanged?.call(_selectedFilters.toList(), _selectedOrder);
  }

  Future<void> _openFilters(BuildContext context) async {
    // Define um ponto de quebra para considerar "mobile"


    // Usa o resultado de showModalBottomSheet ou showDialog
    final Set<Categorias>? result;

    if (ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile) {
      // --- LÓGICA PARA MOBILE: Bottom Sheet ---
      result = await showModalBottomSheet<Set<Categorias>>(
        context: context,
        isScrollControlled: true,
        builder: (_) => ChipsSelectContent(
          title: 'Filtros:',
          initialSelectedFilters: _selectedFilters,
          allFilters: _filters, // Passe sua lista de filtros aqui
        ),
      );
    } else {
      result = await showDialog<Set<Categorias>>(
        context: context,
        builder: (_) => Dialog(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500), // Limita a largura do popup
            child: ChipsSelectContent(
              title: 'Filtros:',
              initialSelectedFilters: _selectedFilters,
              allFilters: _filters, // Passe sua lista de filtros aqui
            ),
          ),
        ),
      );
    }

    if (result != null) {
      setState(() {
        _selectedFilters = result!;
        _notifyChange();
      });
    }
  }



}
class ChipsSelectContent extends StatefulWidget {
  final String title;
  final Set<Categorias> initialSelectedFilters;
  final List<Map<String, dynamic>> allFilters; // Passe a lista de todos os filtros

  const ChipsSelectContent({super.key,
    required this.initialSelectedFilters,
    required this.allFilters, required this.title,
  });

  @override
  State<ChipsSelectContent> createState() => _ChipsSelectContentState();
}

class _ChipsSelectContentState extends State<ChipsSelectContent> {
  late Set<Categorias> _tempSelectedFilters;

  @override
  void initState() {
    super.initState();
    _tempSelectedFilters = Set<Categorias>.from(widget.initialSelectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),

          // Usamos Wrap para que os chips quebrem a linha automaticamente
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: widget.allFilters.map((f) {
              final label = f['label'] as String;
              final icon = f['icon'] as IconData;
              final categoria = f['categoria'] as Categorias;
              final selected = _tempSelectedFilters.contains(categoria);
              return FilterChip(
                label: Text(label),
                avatar: selected ? null : Icon(icon),
                selected: selected,
                onSelected: (bool value) {
                  setState(() {
                    if (value) {
                      _tempSelectedFilters.add(categoria);
                    } else {
                      _tempSelectedFilters.remove(categoria);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          // Botões de Ação
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _tempSelectedFilters.clear();
                  });
                },
                child: const Text('Limpar'),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, _tempSelectedFilters);
                },
                child: const Text('Aplicar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}