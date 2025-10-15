import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaController extends ChangeNotifier{
  List<Pessoa> _pessoas = [];
  List<Pessoa> get pessoas => _pessoas;

  ValueNotifier<String> mensagemNotifier = ValueNotifier('');

  void adicionarPessoa(CriarPessoaDto criarPessoa){
    final pessoa = Pessoa(
      id: _pessoas.length + 1,
      nome: criarPessoa.nome,
      altura: criarPessoa.altura,
      peso: criarPessoa.peso,
    );
    _pessoas.add(pessoa);
    mensagemNotifier.value = 'Pessoa ${pessoa.nome} adicionada com sucesso!';
    notifyListeners();
  }

  void removerPessoa(Pessoa pessoa){
    _pessoas.remove(pessoa);
    mensagemNotifier.value = 'Pessoa ${pessoa.nome} removida com sucesso!';
    notifyListeners();
  }
}