import 'dart:convert';

class ProdutosModel {
  int id;
  String nome;
  String descricao;
  double valor;
  ProdutosModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.valor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'valor': valor,
    };
  }

  factory ProdutosModel.fromMap(Map<String, dynamic> map) {
    return ProdutosModel(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
      valor: map['valor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutosModel.fromJson(String source) =>
      ProdutosModel.fromMap(json.decode(source));
}
