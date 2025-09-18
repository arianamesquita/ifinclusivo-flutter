part of '../../../../app_router.dart';

class MidiaRouter extends GoRouteData with _$MidiaRouter{
  const MidiaRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ModalMidiaPageLibras(titulo: '', timestamp: DateTime.timestamp(), description: '', relacionados: [], urlVideo: '',);
  }
}