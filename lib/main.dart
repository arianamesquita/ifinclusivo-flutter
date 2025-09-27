import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/core/theme/theme.dart';
import 'package:if_inclusivo/ui/core/theme/util.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;


import 'config/dependencies.dart';
import 'config/firebase_options.dart';

// main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/env/.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());

  final sharedPreferences = await SharedPreferences.getInstance();


  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({
    super.key,
    required this.sharedPreferences,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: providers(sharedPreferences),
      child: Builder(
        builder: (context) {
          final router = context.watch<GoRouter>();
          return MaterialApp.router(
            title: 'IF Inclusivo',
            theme: theme.light(),
            darkTheme: theme.dark(),
            themeMode: ThemeMode.system,
            routerConfig: router,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              FlutterQuillLocalizations.delegate,
            ],
            supportedLocales: const [
            Locale('pt', 'BR'),],
          );
        },
      ),
    );
  }
}
