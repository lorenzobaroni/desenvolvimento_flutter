import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/default_dialog_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PessoaDialog extends StatelessWidget {
  final Pessoa pessoa;
  const PessoaDialog({
    super.key,
    required this.pessoa,
  });

  @override
  Widget build(BuildContext context) {
    final pessoaController = GetIt.instance<PessoaController>();
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
          ],
        )
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                pessoaController.removerPessoa(pessoa);
                context.pop();
              },
              child: Text("Excluir", style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Fechar"),
            ),
          ],
        ),
      ],
    );
  }
}