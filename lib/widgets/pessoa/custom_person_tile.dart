import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/core/custom_tile.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/pessoa/pessoa_dialog.dart';
import 'package:flutter/material.dart';

class CustomPersonTile extends StatelessWidget {
  final Pessoa pessoa;
  const CustomPersonTile({
    super.key,
    required this.pessoa,
    });
  
  @override
  Widget build(BuildContext context) {
    return CustomTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
          return PessoaDialog(
            pessoa: pessoa
            );
          }
        );
      },
      color: const Color.fromARGB(255, 171, 71, 211),
      leading: Text("Id: ${pessoa.id}"),
      title: Text(
        pessoa.nome,
        style: TextStyle(fontSize: 18),
        ),
      subTitle: Text("Peso: ${pessoa.peso.paraPeso()}"),
      trailing: Text("Altura: ${pessoa.altura.paraaltura()}"),
    );
  }
}
