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
    pessoaController.listarPessoas();
    themeController.themeNotifier.addListener(_onThemeMensagem);
    pessoaController.mensagemNotifier.addListener(_onPessoaMensagem);
  }

  void _onPessoaMensagem() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(pessoaController.mensagemNotifier.value),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onThemeMensagem() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: themeController.isLightTheme ? Colors.blue : Colors.white,
        content: Text(themeController.themeNotifier.value),
        duration: Duration(seconds: 2),
      ),
    );
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
            if (pessoaController.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListaPessoas(
              pessoas: pessoaController.pessoas,
              );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.criarPessoaPage);
            
          },
          child: Icon(Icons.add),
        ),
        );
  }

  @override
  void dispose() {
    pessoaController.mensagemNotifier.removeListener(_onPessoaMensagem);
    themeController.themeNotifier.removeListener(_onThemeMensagem);
    super.dispose();
  }
}