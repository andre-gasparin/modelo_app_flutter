import 'package:flutter/cupertino.dart';
import 'package:usarprovide/model/produtos_model.dart';
import 'package:usarprovide/services/webclients/produtos_services.dart';

class ProdutosController {
  final estado = ValueNotifier<EstadoPagina>(EstadoPagina.inicio);
  List<ProdutosModel> itens = [];

  Future iniciar() async {
    estado.value = EstadoPagina.carregando;

    try {
      itens = await ProdutosServices.listar();

      estado.value = EstadoPagina.sucesso;
    } catch (e) {
      estado.value = EstadoPagina.erro;
    }
  }

  static salvarProduto(ProdutosModel produto) {
    print('${produto.nome} e aaa descricao: ${produto.valor}');
  }
}

enum EstadoPagina { inicio, carregando, sucesso, erro }
