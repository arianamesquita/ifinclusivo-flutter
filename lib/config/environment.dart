import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get baseUrl {
    if (kReleaseMode) {
      return const String.fromEnvironment('BASE_URL');
    } else {
      final baseUrl = dotenv.env['API_BASE_URL'];
      if (baseUrl == null) {
        throw Exception("A variável BASE_URL não foi encontrada.");
      }
      return baseUrl;
    }
  }

}