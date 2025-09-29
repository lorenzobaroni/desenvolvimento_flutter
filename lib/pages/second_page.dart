import 'package:desenvolvimento_flutter_iniciante/extensions/extensions.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Página")
        ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: Text("Voltar")),
        ),
    );
  }
}
