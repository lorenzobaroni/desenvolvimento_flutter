class Pessoa {
  final String id;
  final String nome;
  final int altura;
  final double peso;

  const Pessoa({
    required this.id,
    required this.nome,
    required this.altura,
    required this.peso,
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) => Pessoa(
        id: json['id'].toString(),
        nome: json['nome'] ?? '',
        altura: (json['altura'] as num).toInt(),
        peso: (json['peso'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'altura': altura,
        'peso': peso,
      };

  @override
  String toString() => 'Pessoa(id: $id, nome: $nome, altura: $altura, peso: $peso)';

  Pessoa copyWith({
    String? id,
    String? nome,
    int? altura,
    double? peso,
  }) {
    return Pessoa(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
    );
  }
}
