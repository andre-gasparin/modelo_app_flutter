import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usarprovide/app_const.dart';

import 'package:usarprovide/model/produtos_model.dart';

class ProdutosController {
  static Future<List<ProdutosModel>> listarProduto() async {
    var url = Uri.parse(appUrl + '/dados.php');
    var response = await http.get(url);
    final responseMap = jsonDecode(response.body);

    var retorno = responseMap
        .map<ProdutosModel>((resp) => ProdutosModel.fromMap(resp))
        .toList();

    if (response.statusCode == 200) {
      return retorno;
    } else {
      return retorno;
    }
  }

  static salvarProduto(ProdutosModel produto) {
    print('${produto.nome} e aaa descricao: ${produto.descricao}');
  }
}
