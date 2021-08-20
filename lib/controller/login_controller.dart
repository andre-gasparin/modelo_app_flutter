import 'package:shared_preferences/shared_preferences.dart';
import 'package:usarprovide/services/webclients/login_services.dart';

class LoginController {
  static Future<Map<String, dynamic>> fazerLogin(
      String login, String senha) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var resposta = await LoginServices.fazerLogin(login, senha);

    if (resposta['status'] == 'success') {
      final token = resposta['data'];
      await sharedPreferences.setString('token', token);
      return resposta;
    } else {
      return resposta;
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
