part of './t_complex.dart';

extension TComplex on double {
  Complex toComplex() {
    return Complex(real: this, imag: 0, operator: Operator.plus);
  }
}

enum Operator { plus, minus }

extension Op on Operator {
  Operator _oppo() {
    if (this == Operator.minus) {
      return Operator.plus;
    } else {
      return Operator.minus;
    }
  }

  Operator get oppo => _oppo();
}
