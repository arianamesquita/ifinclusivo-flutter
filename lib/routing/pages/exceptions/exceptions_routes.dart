// lib/routing/routes/error_router.dart

part of '../../app_router.dart'; // Aponta para seu arquivo principal de rotas

@TypedGoRoute<UnauthorizedRoute>(path: '/unauthorized')
class UnauthorizedRoute extends GoRouteData with _$UnauthorizedRoute {
  const UnauthorizedRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Unauthorized401();
}

@TypedGoRoute<ForbiddenRoute>(path: '/forbidden')
class ForbiddenRoute extends GoRouteData with _$ForbiddenRoute {
  const ForbiddenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Forbidden403();
}

@TypedGoRoute<ServerErrorRoute>(path: '/server-error')
class ServerErrorRoute extends GoRouteData with _$ServerErrorRoute {
  const ServerErrorRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const InternalServerError500();
}

@TypedGoRoute<NotFoundRoute>(path: '/not-found')
class NotFoundRoute extends GoRouteData with _$NotFoundRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => NotFound404();
}
