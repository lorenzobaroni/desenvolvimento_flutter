import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/default_dialog_container.dart';
import 'package:flutter/material.dart';

class PessoaDialog extends StatelessWidget {
  final Pessoa pessoa;
  const PessoaDialog({
    super.key,
    required this.pessoa,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Detalhes da pessoa",
                  style: TextStyle(
                  color: Colors.black, // 🔹 Cor do texto
                  fontSize: 16,      // (opcional) tamanho do texto
                  fontWeight: FontWeight.bold, // (opcional) peso da fonte
              ),
            ),
            SizedBox(height: 16),
            DefaultDialogContainer(child: Text("ID: ${pessoa.id}")),
            DefaultDialogContainer(child: Text("Nome: ${pessoa.nome}")),
            DefaultDialogContainer(child: Text("Peso: ${pessoa.peso.toStringAsFixed(1)} kg")),
            DefaultDialogContainer(child: Text("Altura: ${pessoa.altura} cm")),
            SizedBox(height: 24),
          ],
        )
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Fechar"),
        ),
      ],
    );
  }
}