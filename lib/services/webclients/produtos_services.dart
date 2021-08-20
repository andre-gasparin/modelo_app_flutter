import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usarprovide/app_const.dart';
import 'package:usarprovide/model/produtos_model.dart';

class ProdutosServices {
  static listar() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    var url = Uri.parse(appUrl + '/v1/Produto/');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }).timeout(Duration(seconds: 10), onTimeout: () {
      // Time has run out, do what you wanted to do.
      return http.Response('Error', 500); // Replace 500 with your http code.
    });
    final resposta = json.decode(response.body);

    final respostaList = resposta['data']
        .map<ProdutosModel>((resp) => ProdutosModel.fromMap(resp))
        .toList();

    return respostaList;
  }
}
