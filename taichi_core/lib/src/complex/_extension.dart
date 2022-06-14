part of './t_complex.dart';

extension TComplex on double {
  Complex toComplex() {
    return Complex(real: this, imag: 0);
  }

  Complex plus(Complex complex) {
    return Complex(
      real: this + (complex.real ?? 0),
      imag: complex.imag,
    );
  }

  Complex minus(Complex complex) {
    return Complex(
      real: this - (complex.real ?? 0),
      imag: complex.imag,
    );
  }
}
