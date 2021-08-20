import 'package:flutter/material.dart';
import 'package:usarprovide/controller/produtos_controller.dart';
import 'package:usarprovide/utils/controller_mixin.dart';

class ListaView extends StatefulWidget {
  const ListaView({Key? key}) : super(key: key);

  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> with ControllerMixin {
  final controle = ProdutosController();

  sucesso() => ListView.builder(
        itemCount: controle.itens.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('${controle.itens[i].nome}'),
              subtitle: Text('${controle.itens[i].valor}'),
              trailing: Icon(Icons.edit),
              isThreeLine: true,
            ),
          );
        },
      );

  @override
  // ignore: must_call_super
  void initState() {
    controle.iniciar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimatedBuilder(
          animation: controle.estado,
          builder: (context, child) {
            return gerenciarEstado(controle.estado.value);
          },
        ),
      ),
    );
  }
}
