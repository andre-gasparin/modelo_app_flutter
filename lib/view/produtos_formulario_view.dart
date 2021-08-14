import 'package:flutter/material.dart';
import 'package:usarprovide/controller/produtos_controller.dart';
import 'package:usarprovide/model/produtos_model.dart';

class FormularioView extends StatelessWidget {
  Widget campoNome() {
    return TextFormField(
      controller: _campoNome,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'Nome',
      ),
    );
  }

  Widget campoDescricao() {
    return TextFormField(
      controller: _campoDescricao,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Descricao',
        hintText: 'ex: 1',
      ),
    );
  }

  _salvarProduto() {
    final String nome = _campoNome.text;
    final String descricao = _campoDescricao.text;

    final ProdutosModel produtoNovo =
        ProdutosModel(nome: nome, descricao: descricao);

    ProdutosController.salvarProduto(produtoNovo);
  }
//  const FormularioView({Key? key}) : super(key: key);

  final TextEditingController _campoNome = TextEditingController();
  final TextEditingController _campoDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final _atributo = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        actions: [
          IconButton(
            onPressed: () {
              _salvarProduto();
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              campoNome(),
              campoDescricao(),
            ],
          ),
        ),
      ),
    );
  }
}
