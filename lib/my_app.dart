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
    _appLinks.getInitialLink().then(_handleDeepLink);
    _appLinks.uriLinkStream.listen(_handleDeepLink);
  }

  void _handleDeepLink(Uri? uri) {
    if (uri == null) return;
    final router = GoRouter.of(context);
    if (uri.path == "/auth/verify-email") {
      final token = uri.queryParameters["token"];
      TokenValidateRouter(token: token).push(context);

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