part './_extension.dart';

class Complex {
  double? real;
  double? imag;
  Operator? operator;

  Complex({this.real = 0, this.imag = 0, this.operator});

  @override
  String toString() {
    if (operator == null) {
      return "${imag}i";
    } else {
      if (operator == Operator.minus) {
        return "$real - ${imag}i";
      } else {
        return "$real + ${imag}i";
      }
    }
  }
}
