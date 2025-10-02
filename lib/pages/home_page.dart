import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/listview_builder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pessoa> pessoas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Meu primeiro App."),
        ),
        body: ListaPessoas(
          pessoas: pessoas,
          onDelete: (pessoa) {
            setState(() {
              pessoas.remove(pessoa);
            }); 
          },),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.of(context).pushNamed(Routes.criarPessoaPage);
            if(result != null) {
              final pessoaDto = result as CriarPessoaDto;
              final pessoa = Pessoa(id: pessoas.length + 1, nome: pessoaDto.nome, peso: pessoaDto.peso, altura: pessoaDto.altura);
              setState(() {
                pessoas.add(pessoa);
              });
            }


            //context.pushNamed(Routes.criarPessoaPage); 
            /*
            Navigator.of(context).push(SecondPage);
            
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const SecondPage(),
                ),
                (route) => false,
              );*/
          },
          child: Icon(Icons.navigate_next),
        ),
        );
  }
}