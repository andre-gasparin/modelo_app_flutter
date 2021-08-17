import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController {
  static Future<bool> fazerLogin(String login, String senha) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('http://192.168.0.111/apiflutter/rest.php');
    var resposta = await http.post(url,
        body: json.encode({
          "password": "$senha",
          "login": "$login",
          "class": "ApplicationAuthenticationRestService",
          "method": "getToken"
        }),
        headers: {
          "Authorization":
              "Basic 53da1d5d4f652dbccd2ba5b139448a0d0b9093a8c1827220298d06b013a8"
        });

    var respostaJson = json.decode(resposta.body);

    if (resposta.statusCode != 200 || respostaJson['status'] == 'error') {
      return false;
    } else {
      final token = respostaJson['data'];
      await sharedPreferences.setString('token', token);
      return true;
    }
  }

  static Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null)
      return true;
    else
      return false;
  }
}
