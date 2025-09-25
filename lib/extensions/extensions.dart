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