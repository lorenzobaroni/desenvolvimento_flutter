import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/custom_person_tile.dart';
import 'package:flutter/material.dart';

class ListaPessoas extends StatelessWidget {
  final List<Pessoa> pessoas;
  const ListaPessoas({super.key, required this.pessoas});

  @override
  Widget build(BuildContext context) {
    if(pessoas.isEmpty) {
      return Center(
        child: Text("Nenhuma pessoa cadastrada", style: TextStyle(color: Colors.black)),
      );
    }
    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) {
        return CustomPersonTile(pessoa: pessoas[index]);
      },
    );
  }
}