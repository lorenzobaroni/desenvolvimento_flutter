import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/listview_builder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Meu primeiro App."),
        ),
        body: ListaPessoas(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed(Routes.secondPage); 
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