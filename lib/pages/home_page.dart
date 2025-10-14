import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/controllers/theme_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/pessoa/listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();
  final themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {
    super.initState();
    pessoaController.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Switch(
              value: themeController.isLightTheme,
              onChanged: (value) {
              setState(() {
                themeController.toggleTheme();
                });}
              ),
            Text(themeController.isLightTheme == true ? "Tema Claro" : "Tema Escuro"),
            ]
          ),
        ),
        appBar: AppBar(
        title: Text("Meu primeiro App."),
        ),
        body: ListenableBuilder(
          listenable: pessoaController,
          builder: (context, child) {
            return ListaPessoas(
              pessoas: pessoaController.pessoas,
              );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.criarPessoaPage);
            
          },
          child: Icon(Icons.navigate_next),
        ),
        );
  }
}