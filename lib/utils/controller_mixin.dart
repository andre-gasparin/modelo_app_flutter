import 'package:flutter/material.dart';
import 'package:usarprovide/controller/produtos_controller.dart';

mixin ControllerMixin<T extends StatefulWidget> on State<T> {
  gerenciarEstado(EstadoPagina estado) {
    switch (estado) {
      case EstadoPagina.inicio:
        return inicio();
      case EstadoPagina.carregando:
        return carregando();
      case EstadoPagina.erro:
        return erro();
      case EstadoPagina.sucesso:
        return sucesso();
      default:
        return inicio();
    }
  }

  sucesso() => Center(child: Text('Tentar Novamente'));

  erro() => Center(child: Text('Tentar Novamente'));

  carregando() => Center(child: CircularProgressIndicator());

  inicio() => Container();
}
