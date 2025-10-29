import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/sevices/api_client.dart';
import 'package:flutter/material.dart';

class PessoaController extends ChangeNotifier{
  List<Pessoa> _pessoas = [];
  List<Pessoa> get pessoas => _pessoas;

  final ApiClient apiClient;
  PessoaController(this.apiClient);

  ValueNotifier<String> mensagemNotifier = ValueNotifier('');

  bool _loading = false;
  bool get loading => _loading;
  //GET
  void listarPessoas() async {
    _loading = true;
    notifyListeners();
    try {
      _pessoas = await apiClient.get();
      mensagemNotifier.value = 'Pessoas carregadas com sucesso!';
      notifyListeners();
    } catch (e) {
      mensagemNotifier.value = 'Erro ao carregar pessoas: $e';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> adicionarPessoa(CriarPessoaDto criarPessoa) async {
    try {
      final pessoa = await apiClient.post(criarPessoa);
      _pessoas.add(pessoa);
      mensagemNotifier.value = 'Pessoa adicionada com sucesso!';
      notifyListeners();
    } on Exception catch (e) {
      mensagemNotifier.value = 'Erro ao adicionar pessoa: $e';
    }
  }

  Future<void> atualizarPessoa(Pessoa pessoa) async {
    try {
      final pessoaAtualizada = await apiClient.put(pessoa);
      final index = _pessoas.indexWhere((p) => p.id == pessoaAtualizada.id);
      if (index != -1) {
        _pessoas[index] = pessoaAtualizada;
        mensagemNotifier.value = 'Pessoa ${pessoaAtualizada.nome} atualizada com sucesso!';
        notifyListeners();
      }
    } on Exception catch (e) {
      mensagemNotifier.value = 'Erro ao atualizar pessoa: $e';
    }
  }

  Future<void> removerPessoa(Pessoa pessoa) async {
    try {
      await apiClient.delete(pessoa);
      _pessoas.remove(pessoa);
      mensagemNotifier.value = 'Pessoa ${pessoa.nome} removida com sucesso!';
      notifyListeners();
    } on Exception catch (e) {
      mensagemNotifier.value = 'Erro ao remover pessoa: $e';
    }
  }
}