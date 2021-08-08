import 'dart:convert';

class ProdutosModel {
  final String? nome;
  final String? descricao;

  ProdutosModel({this.nome, this.descricao});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory ProdutosModel.fromMap(Map<String, dynamic> map) {
    return ProdutosModel(
      nome: map['nome'],
      descricao: map['descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutosModel.fromJson(String source) =>
      ProdutosModel.fromMap(json.decode(source));
}
