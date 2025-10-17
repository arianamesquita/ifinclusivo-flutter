import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../routing/app_router.dart';

class PublicationBottomBar extends StatelessWidget {
  final PublicacaoDetalhadaModel value;
  const PublicationBottomBar({
    super.key, required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed:
                    () => context.push(
                  NewPublicacaoRouter().location,),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHigh,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Responder ${value.usuario.nome}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
