import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/models/criar_pessoa_dto.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();

  @override
  void initState() {
    pessoaController.addListener(() {
      setState(() {
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Meu primeiro App."),
        ),
        body: ListaPessoas(
          pessoas: pessoaController.pessoas,
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.of(context).pushNamed(Routes.criarPessoaPage);
            if(result != null) {
              final pessoaDto = result as CriarPessoaDto;
              setState(() {
                pessoaController.adicionarPessoa(pessoaDto);
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