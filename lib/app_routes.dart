import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usarprovide/view/login_view.dart';
import 'view/produtos_formulario_view.dart';
import 'view/home_view.dart';
import 'view/produtos_lista_view.dart';

class AppRoutes {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const FORM = '/form';
  static const LIST = '/list';

  static Map<String, Widget Function(BuildContext)> rotas = {
    AppRoutes.LOGIN: (ctx) => LoginView(),
    AppRoutes.HOME: (ctx) => HomeView(),
    AppRoutes.FORM: (ctx) => FormularioView(),
    AppRoutes.LIST: (ctx) => ListaView(),
  };
  // Exemplo de rota
  //  Empilhar
  //   Navigator.of(context).pushNamed(AppRoutes.FORM);
  //  Nova tela
  //   Navigator.of(context).pushReplacementNamed(AppRoutes.LIST);
}
