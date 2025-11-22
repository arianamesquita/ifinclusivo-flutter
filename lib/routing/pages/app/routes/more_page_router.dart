part of '../../../app_router.dart';

const moreBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[morePageRouter],
);

const morePageRouter = TypedGoRoute<MorePageRouter>(
  path: AppRoutes.more,
  routes: [managementLibrasRouter],
);

class MorePageRouter extends GoRouteData with _$MorePageRouter {
  const MorePageRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CustomContainerShell(
      child: Placeholder(
        color: Colors.yellow,
        child: ElevatedButton(
          onPressed: () => ManagementLibrasRouter().go(context),
          child: Text("gerenciar libras"),
        ),
      ),
    );
  }
}

const managementLibrasRouter = TypedGoRoute<ManagementLibrasRouter>(
  path: AppRoutes.managementLibras,
);

class ManagementLibrasRouter extends GoRouteData with _$ManagementLibrasRouter {
  const ManagementLibrasRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ManagementPage();
  }
}
