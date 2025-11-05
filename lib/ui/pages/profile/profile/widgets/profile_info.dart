import 'package:flutter/material.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../utils/date_utils.dart';

class ProfileInfo extends StatelessWidget {
  final UsuarioResponseModel user;

  const ProfileInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return user.maybeWhen(
      aluno: (id, nome, imgPerfil, login, matricula, biografia, dataCriacao, configAcessibilidadeEntity, roles, token, firebaseToken, curso) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 17,
          children: [
            _buildInfoItem(
              icon: Icons.numbers,
              text: matricula.toString(),
              context: context,
            ),
            _buildInfoItem(
              icon: Icons.school,
              text: curso,
              context: context,
            ), _buildInfoItem(
              icon: Icons.date_range,
              text:'Usuário ${formatTimeAgo(dataCriacao)}'
              ,
              context: context,
            ),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(), // fallback para outros tipos
    );
  }
  _buildInfoItem({required IconData icon,required String text, required BuildContext context}){
    return Container(
      decoration: BoxDecoration(
        border:BoxBorder.all(color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(8)

      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        spacing: 19,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(8)
            ),
            child:
            Icon(icon),
          ),
          Text(text)
        ],
      ),
    );
  }
}
