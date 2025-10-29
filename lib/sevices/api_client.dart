import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:dio/dio.dart';

class ApiClient{
  final Dio dio;
  final String baseUrl;
  ApiClient({required this.dio, required this.baseUrl});

  Future<List<Pessoa>> get() async {
    final response = await dio.get('$baseUrl/pessoas');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Pessoa.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load pessoas');
    }
  }

  Future<Pessoa> post(CriarPessoaDto criarPessoa) async {
    final response = await dio.post(
      '$baseUrl/pessoas',
      data: criarPessoa.toJson(),
    );

    if (response.statusCode == 201) {
      return Pessoa.fromJson(response.data);
    } else {
      throw Exception('Failed to create pessoa: ${response.statusCode}');
    }
  }

  Future<void> delete(Pessoa pessoa) async {
    final response = await dio.delete('$baseUrl/pessoas/${pessoa.id}');
    if (response.statusCode != 200) {
      throw Exception('Failed to delete pessoa');
    }
  }

  Future<Pessoa> put(Pessoa pessoa) async {
    final response = await dio.put('$baseUrl/pessoas/${pessoa.id}',
      data: pessoa.toJson(),
    );
    if (response.statusCode == 200) {
      return Pessoa.fromJson(response.data);
    } else {
      throw Exception('Failed to update pessoa: ${response.statusCode}');
    }
  }
}