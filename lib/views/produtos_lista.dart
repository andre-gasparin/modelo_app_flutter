import 'package:flutter/material.dart';
import 'package:meuappnovo/models/produtos_model.dart';
import 'package:meuappnovo/repositories/produtos_repository.dart';

class ProdutosLista extends StatefulWidget {
  const ProdutosLista({Key? key}) : super(key: key);

  @override
  _ProdutosListaState createState() => _ProdutosListaState();
}

class _ProdutosListaState extends State<ProdutosLista> {
  final repository = ProdutosRepository();

  List<ProdutosModel> _produtos = [];

  _todosProdutos() async {
    this._produtos = await repository.fetchProdutos();
  }

  @override
  void initState() {
    super.initState();
    _todosProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: _produtos.length,
            itemBuilder: (ctx, i) {
              return Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text(_produtos[i].nome),
                  subtitle: TextButton(
                    onPressed: () {
                      _todosProdutos();
                    },
                    child: Text(_produtos[i].descricao),
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              );
            },
          )),
    );
  }
}
