import 'package:flutter/material.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../routing/app_router.dart';

class ProfilePreview extends StatelessWidget {
  final UsuarioResponseModel user;
  const ProfilePreview({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 189,
            height: 189,
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.imgPerfil),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17.0,bottom: 21),
            child: Column(
              spacing: 8,
              children: [
                Text(
                  user.nome,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  user.login,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                Text(
                  user.biografia ?? 'sem biografia',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: () => EditProfileRouter().go(context),
                child: Text('Editar Perfil'),
              ),
              IconButton(
                onPressed:()=> AccountSecurityRouter().go(context),
                icon: Icon(Icons.settings),
                color: Theme.of(context).colorScheme.primary,
                tooltip: 'Configurações',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
