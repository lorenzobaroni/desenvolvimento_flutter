import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class CriarPessoaPage
    extends StatefulWidget {
  const CriarPessoaPage({super.key});

  @override
  State<CriarPessoaPage> createState() => _CriarPessoaPageState();
}

class _CriarPessoaPageState extends State<CriarPessoaPage> {
  final gap = SizedBox(height: 16);
  final nomeController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final pessoaController = GetIt.instance<PessoaController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Página"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if(value?.isEmpty == true) {
                    return "Nome obrigatório";
                  }
                  return null;
                },
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: "Nome",               
                  border: OutlineInputBorder(),
                ),
              ),
              gap,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\,?\d{0,1}')),
                ],
                validator: (value) {
                  if(value?.isEmpty == true) {
                    return "Peso obrigatório";
                  }
                  return null;
                },
                controller: pesoController,
                decoration: InputDecoration(
                  labelText: "Peso",               
                  border: OutlineInputBorder(),
                  suffixText: 'kg (ex: 72,5)',
                ),
              ),
              gap,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if(value?.isEmpty == true) {
                    return "Altura obrigatória";
                  }
                  return null;
                },
                controller: alturaController,
                decoration: InputDecoration(
                  labelText: "Altura",               
                  border: OutlineInputBorder(),
                  suffixText: 'cm (ex: 180)',
                ),
              ),
              gap,
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () {
                    if(formKey.currentState?.validate() == true) {
                      final criarPessoa = CriarPessoaDto(
                        nome: nomeController.text,
                        peso: double.parse(pesoController.text.replaceAll(',', '.')),
                        altura: int.parse(alturaController.text),
                      );
                      pessoaController.adicionarPessoa(criarPessoa);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Salvar")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    nomeController.dispose();
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }
}
