// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $notificationRouter,
  $mobileConversationRoute,
  $shellAppRouter,
  $shellAboutRoute,
  $shellAuthRoute,
];

RouteBase get $notificationRouter => GoRouteData.$route(
  path: '/app/notification',

  factory: _$NotificationRouter._fromState,
);

mixin _$NotificationRouter on GoRouteData {
  static NotificationRouter _fromState(GoRouterState state) =>
      const NotificationRouter();

  @override
  String get location => GoRouteData.$location('/app/notification');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mobileConversationRoute => GoRouteData.$route(
  path: '/app/chat/con/:chatId',

  factory: _$MobileConversationRoute._fromState,
);

mixin _$MobileConversationRoute on GoRouteData {
  static MobileConversationRoute _fromState(GoRouterState state) =>
      MobileConversationRoute(chatId: state.pathParameters['chatId']!);

  MobileConversationRoute get _self => this as MobileConversationRoute;

  @override
  String get location => GoRouteData.$location(
    '/app/chat/con/${Uri.encodeComponent(_self.chatId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellAppRouter => StatefulShellRouteData.$route(
  factory: $ShellAppRouterExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/forum',

          factory: _$ForumRouter._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/libras',

          factory: _$LibrasRouter._fromState,
          routes: [
            GoRouteData.$route(
              path: 'midia',

              factory: _$MidiaRouter._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/topicos',

          factory: _$TopicoRouter._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        StatefulShellRouteData.$route(
          factory: $ChatShellExtension._fromState,
          branches: [
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/chat',

                  factory: _$ChatRouter._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':chatId',

                      factory: _$ConversationRouter._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/more',

          factory: _$MorePageRouter._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/profile',

          factory: _$ProfileRouter._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellAppRouterExtension on ShellAppRouter {
  static ShellAppRouter _fromState(GoRouterState state) =>
      const ShellAppRouter();
}

mixin _$ForumRouter on GoRouteData {
  static ForumRouter _fromState(GoRouterState state) => const ForumRouter();

  @override
  String get location => GoRouteData.$location('/app/forum');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$LibrasRouter on GoRouteData {
  static LibrasRouter _fromState(GoRouterState state) => const LibrasRouter();

  @override
  String get location => GoRouteData.$location('/app/libras');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MidiaRouter on GoRouteData {
  static MidiaRouter _fromState(GoRouterState state) => const MidiaRouter();

  @override
  String get location => GoRouteData.$location('/app/libras/midia');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$TopicoRouter on GoRouteData {
  static TopicoRouter _fromState(GoRouterState state) => const TopicoRouter();

  @override
  String get location => GoRouteData.$location('/app/topicos');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $ChatShellExtension on ChatShell {
  static ChatShell _fromState(GoRouterState state) => const ChatShell();
}

mixin _$ChatRouter on GoRouteData {
  static ChatRouter _fromState(GoRouterState state) => const ChatRouter();

  @override
  String get location => GoRouteData.$location('/chat');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ConversationRouter on GoRouteData {
  static ConversationRouter _fromState(GoRouterState state) =>
      ConversationRouter(chatId: state.pathParameters['chatId']!);

  ConversationRouter get _self => this as ConversationRouter;

  @override
  String get location =>
      GoRouteData.$location('/chat/${Uri.encodeComponent(_self.chatId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MorePageRouter on GoRouteData {
  static MorePageRouter _fromState(GoRouterState state) =>
      const MorePageRouter();

  @override
  String get location => GoRouteData.$location('/app/more');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ProfileRouter on GoRouteData {
  static ProfileRouter _fromState(GoRouterState state) => const ProfileRouter();

  @override
  String get location => GoRouteData.$location('/app/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellAboutRoute => StatefulShellRouteData.$route(
  factory: $ShellAboutRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/presentation',

          factory: _$AboutUsRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/presentation/about-napne',

          factory: _$AboutNapneRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellAboutRouteExtension on ShellAboutRoute {
  static ShellAboutRoute _fromState(GoRouterState state) =>
      const ShellAboutRoute();
}

mixin _$AboutUsRoute on GoRouteData {
  static AboutUsRoute _fromState(GoRouterState state) => const AboutUsRoute();

  @override
  String get location => GoRouteData.$location('/presentation');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$AboutNapneRoute on GoRouteData {
  static AboutNapneRoute _fromState(GoRouterState state) =>
      const AboutNapneRoute();

  @override
  String get location => GoRouteData.$location('/presentation/about-napne');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellAuthRoute => StatefulShellRouteData.$route(
  factory: $ShellAuthRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/login', factory: _$LoginRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/register',

          factory: _$RegisterRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellAuthRouteExtension on ShellAuthRoute {
  static ShellAuthRoute _fromState(GoRouterState state) =>
      const ShellAuthRoute();
}

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
