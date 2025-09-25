import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:faker/faker.dart';

List<Pessoa> gerarPessoas(int quantidade) {
  final faker = Faker();
  List<Pessoa> pessoas = [];
  for (int i = 0; i < quantidade; i++) {
    pessoas.add(Pessoa(
      id: i,
      nome: faker.person.name(),
      peso: faker.randomGenerator.decimal(min: 50, scale: 100),
      altura: faker.randomGenerator.integer(200, min: 150),
    ));
  }
  return pessoas;
}