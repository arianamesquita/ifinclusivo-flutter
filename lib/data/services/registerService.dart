

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:if_inclusivo/domain/models/user/userModel.dart';

class RegisterService{
  final String baseURL = dotenv.env['API_URL'] ?? 'http://localhost:8080';

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseURL/users'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      print(response);
      print(data.map((e) => UserModel.fromJson(e)).toList());
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar usuários');
    }
  }
}