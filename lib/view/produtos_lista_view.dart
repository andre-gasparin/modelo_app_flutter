import 'package:flutter/material.dart';
import 'package:usarprovide/controller/produtos_controller.dart';
import 'package:usarprovide/model/produtos_model.dart';

class ListaView extends StatefulWidget {
  const ListaView({Key? key}) : super(key: key);

  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  // final lista = ProdutosModel();
  String _estado = 'carregando';
  List<ProdutosModel> _todos = [];

  void _alterarEstado(String estado) {
    setState(() {
      _estado = estado;
    });
  }

  Future<List<ProdutosModel>> _todosProdutos() async {
    _todos = await ProdutosController.listarProduto();
    _alterarEstado('concluido');
    return _todos;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _todosProdutos();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem: $_estado'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<List<ProdutosModel>>(
          future: _todosProdutos(), //ProdutosController.listarProduto(),
          builder: (context, snapshot) {
            //if (!snapshot.hasData)
            if (_estado == 'carregando') {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, i) {
                return Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text('${snapshot.data![i].nome}'),
                    subtitle: Text('${snapshot.data![i].descricao}'),
                    trailing: Icon(Icons.edit),
                    isThreeLine: true,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
