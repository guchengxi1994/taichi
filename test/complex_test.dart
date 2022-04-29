// ignore_for_file: avoid_print

import 'package:taichi/src/complex/t_complex.dart';

void main() {
  double a = 5;

  Complex b = Complex(real: 3, imag: 9);

  Complex c = Complex(imag: 8, real: 7);

  var r1 = a.plus(b);

  print("a + b = $r1");

  var r2 = b - c;
  print("b-c = $r2");

  var r3 = b * c;
  print("b*c = $r3");

  var r4 = a.toComplex() * c;
  print("a*c = $r4");

  var r5 = b / c;
  print("b/c = $r5");
}
