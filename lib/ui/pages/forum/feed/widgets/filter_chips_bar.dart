import 'package:flutter/material.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

class FilterChipsBar extends StatefulWidget {
  final void Function(List<String> selected, String order)? onChanged;

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
  late Set<String> _selectedFilters = {};

  final List<Map<String, dynamic>> _filters = [
    {'label': 'Redes', 'icon': Icons.wifi},
    {'label': 'Banco de Dados', 'icon': Icons.storage},
    {'label': 'Programação', 'icon': Icons.code},
    {'label': 'Web', 'icon': Icons.web},
    {'label': 'Estrutura de Dados', 'icon': Icons.account_tree_outlined},
    {'label': 'Arquitetura de Computadores', 'icon': Icons.hardware_outlined},
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

        PopupMenuButton<String>(
          onSelected: (String value) {
            // Callback chamado quando um item do menu é selecionado
            setState(() => _selectedOrder = value);
            _notifyChange(); // Chama sua função para notificar a mudança
                    },
          itemBuilder:
              (BuildContext context) => const <PopupMenuEntry<String>>[
                // Itens do seu menu dropdown
                PopupMenuItem<String>(
                  value: 'Relevância',
                  child: Text('Relevância'),
                ),
                PopupMenuItem<String>(
                  value: 'Mais recente',
                  child: Text('Mais recente'),
                ),
              ],
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(
                8.0,
              ), // Deixa as bordas arredondadas
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Text(
                  _selectedOrder, // Mostra o valor selecionado
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _notifyChange() {
    widget.onChanged?.call(_selectedFilters.toList(), _selectedOrder);
  }

  Future<void> _openFilters(BuildContext context) async {
    // Define um ponto de quebra para considerar "mobile"


    // Usa o resultado de showModalBottomSheet ou showDialog
    final Set<String>? result;

    if (ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile) {
      // --- LÓGICA PARA MOBILE: Bottom Sheet ---
      result = await showModalBottomSheet<Set<String>>(
        context: context,
        isScrollControlled: true,
        builder: (_) => _FilterContent(
          initialSelectedFilters: _selectedFilters,
          allFilters: _filters, // Passe sua lista de filtros aqui
        ),
      );
    } else {
      result = await showDialog<Set<String>>(
        context: context,
        builder: (_) => Dialog(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500), // Limita a largura do popup
            child: _FilterContent(
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
class _FilterContent extends StatefulWidget {
  final Set<String> initialSelectedFilters;
  final List<Map<String, dynamic>> allFilters; // Passe a lista de todos os filtros

  const _FilterContent({
    required this.initialSelectedFilters,
    required this.allFilters,
  });

  @override
  State<_FilterContent> createState() => _FilterContentState();
}

class _FilterContentState extends State<_FilterContent> {
  late Set<String> _tempSelectedFilters;

  @override
  void initState() {
    super.initState();
    _tempSelectedFilters = Set<String>.from(widget.initialSelectedFilters);
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
          Text('Filtros', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),

          // Usamos Wrap para que os chips quebrem a linha automaticamente
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: widget.allFilters.map((f) {
              final label = f['label'] as String;
              final icon = f['icon'] as IconData;
              final selected = _tempSelectedFilters.contains(label);
              return FilterChip(
                label: Text(label),
                avatar: selected ? null : Icon(icon),
                selected: selected,
                onSelected: (bool value) {
                  setState(() {
                    if (value) {
                      _tempSelectedFilters.add(label);
                    } else {
                      _tempSelectedFilters.remove(label);
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