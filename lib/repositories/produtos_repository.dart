import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meuappnovo/models/produtos_model.dart';

class ProdutosRepository {
  Future<List<ProdutosModel>> fetchProdutos() async {
    var url = Uri.parse('http://192.168.0.111/dados.json');
    var response = await http.get(url);
    final responseMap = jsonDecode(response.body);

    return responseMap
        .map<ProdutosModel>((resp) => ProdutosModel.fromMap(resp))
        .toList();
  }
}
