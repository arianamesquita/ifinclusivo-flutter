import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/enums/status.dart';

class LibrasTile extends StatelessWidget {
  final String palavra;
  final Status status;
  final bool fill;

  // Callbacks nullable pois dependem do construtor usado
  final VoidCallback? onAprove;
  final VoidCallback? onDisapprove;
  final VoidCallback? onView;
  final VoidCallback? onEdite;
  final VoidCallback? onDelete;

  // Construtor Privado Base (para uso interno dos named constructors)
  const LibrasTile._({
    super.key,
    required this.palavra,
    required this.status,
    this.onAprove,
    this.onDisapprove,
    this.onView,
    this.onEdite,
    this.onDelete,
    required this.fill,
  });

  // --- Construtor 1: Estado EM ANÁLISE ---
  // Exige apenas os callbacks de aprovação e reprovação
  const LibrasTile.emAnalise({
    Key? key,
    required String palavra,
    required VoidCallback onAprove,
    required VoidCallback onDisapprove,
    bool fill = false,
  }) : this._(
         key: key,
         palavra: palavra,
         status: Status.EMANALISE,
         onAprove: onAprove,
         onDisapprove: onDisapprove,
         fill: fill,
       );

  // --- Construtor 2: Estado APROVADO ---
  // Exige os callbacks de CRUD (Ver, Editar, Deletar)
  const LibrasTile.aprovado({
    Key? key,
    required String palavra,
    required VoidCallback onView,
    required VoidCallback onEdite,
    required VoidCallback onDelete,
    bool fill = false,
  }) : this._(
         key: key,
         palavra: palavra,
         status: Status.APROVADO,
         onView: onView,
         onEdite: onEdite,
         onDelete: onDelete,
         fill: fill,
       );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 23.0, horizontal: 16),
      decoration: BoxDecoration(
          color: fill? colorScheme.surfaceContainerHigh:null,
          border: Border.all(width: 3, color: colorScheme.surfaceContainerHigh),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              palavra,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: Text(
              status.nomeEmPortugues,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                color:
                    status == Status.EMANALISE
                        ? colorScheme.onPrimaryContainer
                        : colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(
            width: 155,
            child:
                status == Status.EMANALISE
                    ? _buildActionsEmAnalise(context)
                    : _buildActionsAprove(context),
          ),
        ],
      ),
    );
  }

  _buildActionsEmAnalise(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 14,
      children: [
        IconButton(
          onPressed: onAprove,
          tooltip: 'Aprovar',
          icon: Icon(Icons.check),
          iconSize: 24,
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
          ),
        ),
        IconButton(
          onPressed: onDisapprove,
          icon: Icon(Icons.close),
          tooltip: 'Reprovar',
          iconSize: 24,
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
            foregroundColor: colorScheme.onError,
          ),
        ),
      ],
    );
  }

  _buildActionsAprove(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15,
      children: [
        IconButton(
          onPressed: onView,
          tooltip: 'Consultar',
          icon: Icon(Icons.visibility_outlined),
          iconSize: 24,
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
          ),
        ),
        IconButton(
          onPressed: onEdite,
          icon: Icon(Icons.edit_outlined),
          tooltip: 'Editar',
          iconSize: 24,
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
        ),
        IconButton(
          onPressed: onDelete,
          tooltip: 'Apagar',
          iconSize: 24,
          icon: Icon(Icons.delete_forever_outlined),
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
            foregroundColor: colorScheme.onError,
          ),
        ),
      ],
    );
  }
}
