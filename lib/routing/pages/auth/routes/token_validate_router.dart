part of '../../../app_router.dart';


@TypedGoRoute<TokenValidateRouter>(path: AppRoutes.token)
class TokenValidateRouter extends GoRouteData with _$TokenValidateRouter{
  final String? token;
  const TokenValidateRouter({this.token});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    final token = state.uri.queryParameters['token'];
    return TokenPage(token: token,);
  }

}