part of '../../../../app_router.dart';

class MidiaRouter extends GoRouteData with _$MidiaRouter {
  const MidiaRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ModalMidiaPageLibras(
      titulo: 'Endereço IP',
      timestamp: 'Adicionado em sexta-feira, 22 de março de 2024',
      description: 'Libras significa Língua Brasileira de Sinais. Através dela, é possível promover mais acessibilidade na comunicação para pessoas deficientes auditivas.',
      relacionados: [],
    );
  }
}
