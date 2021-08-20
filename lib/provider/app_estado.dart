import 'package:flutter/material.dart';

class AppEstado with ChangeNotifier {
  String _estadoAtual = 'carregando';

  //Retornar o estado atual
  String get estadoAtual => _estadoAtual;

  //Alterar estado no provider
  void alterarEstado(novoEstado) {
    _estadoAtual = novoEstado;
    notifyListeners();
  }
}
