class CriarPessoaDto {
  final String nome;
  final double peso;
  final int altura;

  CriarPessoaDto({
    required this.nome,
    required this.peso,
    required this.altura,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'altura': altura,
      'peso': peso,
    };
  }
}