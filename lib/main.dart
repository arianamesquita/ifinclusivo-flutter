import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/core/theme/theme.dart';
import 'package:if_inclusivo/ui/core/theme/util.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/dependencies.dart';
import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/env/.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final router = createRouter();
  final sharedPreferences = await SharedPreferences.getInstance();

  // Remova o MultiProvider daqui
  runApp(MyApp(
    router: router,
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  final SharedPreferences sharedPreferences; // Recebe o SharedPreferences

  const MyApp({
    super.key,
    required this.router,
    required this.sharedPreferences,
  });


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
      providers: providers(sharedPreferences, router),
      child: MaterialApp.router(
        title: 'IF Inclusivo',
        theme: theme.light(),
        darkTheme: theme.dark(),
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}

