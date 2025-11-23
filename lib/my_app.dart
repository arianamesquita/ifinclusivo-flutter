import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/core/theme/theme.dart';
import 'package:if_inclusivo/ui/core/theme/util.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/dependencies.dart';
import 'package:app_links/app_links.dart';


final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();



class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({
    super.key,
    required this.sharedPreferences,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _handleDeepLink(uri);
        });
      }
    });

    // Links enquanto o app já está aberto
    _appLinks.uriLinkStream.listen((uri) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleDeepLink(uri);
      });
    });
  }
  void _handleDeepLink(Uri? uri) {
    if (uri == null) return;

    // -------------------------
    // TRATA LINKS COM HASH (#)
    // -------------------------
    final fragment = uri.fragment;
    // ex: "/auth/verify-email?token=123"
    // ou: "/auth/reset_password?token=456"
    print('fragmentos: $fragment');
    if (fragment.startsWith("/app/forum/post/")) {
      try {
        final uriFrag = Uri.parse(fragment);
        if (uriFrag.pathSegments.isNotEmpty) {
          final idStr = uriFrag.pathSegments.last;
          final id = int.tryParse(idStr);
          if (id != null) {
            PublicacaoRouter(id).go(rootNavigatorKey.currentState!.context);
          }
        }
      } catch (e) {
        print("Erro ao processar link de publicação: $e");
      }
      return;
    }

    if (fragment.startsWith("/auth/verify-email")) {
      final params = Uri.splitQueryString(
        fragment.replaceFirst("/auth/verify-email?", ""),
      );

      final token = params["token"];
      TokenValidateRouter(token: token).go(rootNavigatorKey.currentState!.context);
      return;
    }

    if (fragment.startsWith("/auth/reset_password")) {
      final params = Uri.splitQueryString(
        fragment.replaceFirst("/auth/reset_password?", ""),
      );

      final token = params["token"];
      ResetPasswordRoute(token: token).go(rootNavigatorKey.currentState!.context);
      return;
    }


    // ---------------------------
    // TRATA LINKS SEM HASH
    // (Provavelmente nunca usado)
    // ---------------------------
    if (uri.path == "/auth/verify-email") {
      final token = uri.queryParameters["token"];
      TokenValidateRouter(token: token).go(rootNavigatorKey.currentState!.context);
      return;
    }

    if (uri.path == "/auth/reset_password") {
      final token = uri.queryParameters["token"];
      ResetPasswordRoute(token: token).go(rootNavigatorKey.currentState!.context);
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: providers(widget.sharedPreferences),
      child: Builder(
        builder: (context) {
          final router = context.watch<GoRouter>();

          return MaterialApp.router(
            title: 'IF Inclusivo',
            theme: theme.light(),
            themeMode: ThemeMode.light,
            routerConfig: router,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              FlutterQuillLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('pt', 'BR'),
            ],
          );
        },
      ),
    );
  }
}