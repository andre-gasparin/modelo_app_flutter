import 'package:flutter/cupertino.dart';
import 'view/produtos_formulario_view.dart';
import 'view/home_view.dart';
import 'view/produtos_lista_view.dart';

class AppRoutes {
  static const HOME = '/home';
  static const FORM = '/form';
  static const LIST = '/list';

  static Map<String, Widget Function(BuildContext)> rotas = {
    AppRoutes.HOME: (ctx) => HomeView(),
    AppRoutes.FORM: (ctx) => FormularioView(),
    AppRoutes.LIST: (ctx) => ListaView(),
  };
}
