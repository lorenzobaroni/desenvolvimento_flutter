import 'package:flutter/material.dart';

extension Parapeso on double {
  String paraPeso(){
  return "${toStringAsFixed(1)} kg";
  }
}

extension Paraaltura on int {
  String paraaltura(){
  return "$this Cm";
  }
}

extension Navigate<T> on BuildContext {
  Future<T?> pushNamed(String route) {
    return Navigator.of(this).pushNamed(route);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}