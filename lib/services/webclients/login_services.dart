import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usarprovide/app_const.dart';

class LoginServices {
  static Future fazerLogin(String login, String senha) async {
    var url = Uri.parse(appUrl + '/rest.php');
    var respostaJson = await http.post(url,
        body: json.encode({
          "password": "$login",
          "login": "$senha",
          "class": "ApplicationAuthenticationRestService",
          "method": "getToken"
        }),
        headers: {
          "Authorization":
              "Basic 53da1d5d4f652dbccd2ba5b139448a0d0b9093a8c1827220298d06b013a8"
        }).timeout(Duration(seconds: 10), onTimeout: () {
      // Time has run out, do what you wanted to do.
      return http.Response('Error', 500); // Replace 500 with your http code.
    });

    var resposta = json.decode(respostaJson.body);
    //Verifica o retorno, se estiver correto retorna, senão retorna um erro
    if (respostaJson.statusCode != 200) {
      resposta['status'] = 'error';
      resposta['data'] = 'Erro de conexão com o servidor.';
    }

    return resposta;
  }
}
