import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaListTile extends StatelessWidget {
  final Pessoa pessoa;
  const PessoaListTile({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(66, 95, 45, 187),
      child: ListTile(
        leading: Text("Id: ${pessoa.id}"),
        title: Text("Nome: ${pessoa.nome}"),
        subtitle: Text("Peso: ${pessoa.peso.paraPeso()}"),
        trailing: Text("Altura: ${pessoa.altura.paraaltura()}"),
      ),
    );
  }
}