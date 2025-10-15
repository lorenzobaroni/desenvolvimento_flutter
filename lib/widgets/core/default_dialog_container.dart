import 'package:flutter/material.dart';

class DefaultDialogContainer extends StatelessWidget {
  final Widget child;
  const DefaultDialogContainer({
    super.key,
    required this.child,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 2),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 28, 71, 146),
                borderRadius: BorderRadius.circular(8),
              ),
              child: child,
            );
          }
}