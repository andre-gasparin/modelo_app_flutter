import 'dart:convert';

class ProdutosModel {
  final String? nome;
  final double? valor;

  ProdutosModel({this.nome, this.valor});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'valor': valor,
    };
  }

  factory ProdutosModel.fromMap(Map<String, dynamic> map) {
    return ProdutosModel(
      nome: map['nome'],
      valor: map['valor'] != "" ? double.parse(map['valor']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutosModel.fromJson(String source) =>
      ProdutosModel.fromMap(json.decode(source));
}
