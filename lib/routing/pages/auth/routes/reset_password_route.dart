part of '../../../app_router.dart';

@TypedGoRoute<ResetPasswordRoute>(path: AppRoutes.resetPassword)
class ResetPasswordRoute extends GoRouteData with _$ResetPasswordRoute{
  final String? token;
  const ResetPasswordRoute({this.token});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    final token = state.uri.queryParameters['token'];
    return ResetPasswordPage( token: token,);
  }

}