part of '../../../app_router.dart';

const TypedStatefulShellBranch<StatefulShellBranchData> profileBranch =
TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[profileRouter],
);




const TypedGoRoute<AccountSecurityRouter> accountSecurityRouter =
TypedGoRoute<AccountSecurityRouter>(
  path: AppRoutes.accountSecurity, // ex: 'account-security'
);

class AccountSecurityRouter extends GoRouteData with _$AccountSecurityRouter {
  const AccountSecurityRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountSecurityPage();
  }
}

const TypedGoRoute<EditProfileRouter> editProfileRouter =
TypedGoRoute<EditProfileRouter>(
  path: AppRoutes.editProfile,
);

class EditProfileRouter extends GoRouteData with _$EditProfileRouter {
  const EditProfileRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EditProfilePage();
  }
}

const TypedGoRoute<ProfileRouter> profileRouter = TypedGoRoute<ProfileRouter>(
  path: AppRoutes.profile,
  routes: [accountSecurityRouter,editProfileRouter],
);

class ProfileRouter extends GoRouteData with _$ProfileRouter {
  const ProfileRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfilePage();
  }
}
