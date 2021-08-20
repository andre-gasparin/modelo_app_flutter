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

  Widget campoValor() {
    return TextFormField(
      controller: _campoValor,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Valor',
        hintText: 'ex: 1',
      ),
    );
  }

  _salvarProduto() {
    final String nome = _campoNome.text;
    final double valor = double.parse(_campoValor.text);
    final ProdutosModel produtoNovo = ProdutosModel(nome: nome, valor: valor);
    ProdutosController.salvarProduto(produtoNovo);
  }

  final TextEditingController _campoNome = TextEditingController();
  final TextEditingController _campoValor = TextEditingController();

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
              campoValor(),
            ],
          ),
        ),
      ),
    );
  }
}
