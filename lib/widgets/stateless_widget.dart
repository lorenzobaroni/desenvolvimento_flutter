import 'package:desenvolvimento_flutter_iniciante/widgets/stateful_widget.dart';
import 'package:flutter/material.dart';

class MeuStatelessWidget extends StatefulWidget {
  const MeuStatelessWidget({super.key});

  @override
  State<MeuStatelessWidget> createState() => _MeuStatelessWidgetState();
}

class _MeuStatelessWidgetState extends State<MeuStatelessWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      border: Border.all(
      color: Colors.red, // Cor da borda
      width: 5,           // Espessura
          ), 
        ),


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "count: $count",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue
                  ),
                ),
            ],
          ),
          SizedBox(height: 16),
            ElevatedButton(
              onPressed: () { setState(() {count++;});},
              child: Text("Aperte aqui")
            ),
          MeuStatefullWidget(
            callback: () => setState(() {count++;})
          ),
        ],
      ),
    );
  }
}