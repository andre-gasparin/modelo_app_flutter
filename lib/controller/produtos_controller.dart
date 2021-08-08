import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:usarprovide/model/produtos_model.dart';

class ProdutosController {
  static Future<List<ProdutosModel>> listarProduto() async {
    var url = Uri.parse('http://192.168.0.111/dados.php');
    var response = await http.get(url);
    final responseMap = jsonDecode(response.body);
    // var retorno = responseMap['data'].map<ProdutosModel>((value) {
    //   // tinha que mapea pois estava vindo uma list do objeto
    //   ProdutosModel.fromJson(value);
    // }).toList();
    var retorno = responseMap
        .map<ProdutosModel>((resp) => ProdutosModel.fromMap(resp))
        .toList();

    if (response.statusCode == 200) {
      return retorno;
    } else {
      print(response.statusCode);
      return retorno;
    }
  }

  static salvarProduto(ProdutosModel produto) {
    print('${produto.nome} e aaa descricao: ${produto.descricao}');
  }
}
