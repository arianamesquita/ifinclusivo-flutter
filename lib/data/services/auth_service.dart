import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService {
  Future<Map<String, dynamic>> login(String email, String password);

  Future<void> logout();

  Future<Map<String, dynamic>> registerTutor(Map<String, dynamic> tutorData);

  Future<String> verifyEmail(String token);

  Future<String> forgotPassword(String email);

  Future<String> resetPassword(String token, String newPassword);

  Future<String> updatePassword(
    String email,
    String currentPassword,
    String newPassword,
  );
}
