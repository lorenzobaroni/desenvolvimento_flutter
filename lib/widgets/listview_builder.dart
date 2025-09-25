import 'package:desenvolvimento_flutter_iniciante/mock/generate_person.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/custom_person_tile.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/person_listtile.dart';
import 'package:flutter/material.dart';

class ListaPessoas extends StatelessWidget {
  const ListaPessoas({super.key});

  @override
  Widget build(BuildContext context) {
    final pessoas = gerarPessoas(20);
    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) {
        return CustomPersonTile(pessoa: pessoas[index]);
      },
    );
  }
}