# dart ```complex```

```dart
class Complex {
  double? real;
  double? imag;

  Complex({
    this.real = 0,
    this.imag = 0,
  }) : assert(0 != (real ?? 0 * (real ?? 0) + (imag ?? 0) * (imag ?? 0)));

  @override
  String toString() {
    if ((imag ?? 0) >= 0) {
      return "$real + ${imag}i";
    } else {
      return "$real - ${imag?.abs()}i";
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != Complex) {
      return false;
    }
    return real == (other as Complex).real && imag == other.imag;
  }

  Complex operator +(Complex c) {
    return Complex(
        real: real ?? 0 + (c.real ?? 0), imag: imag ?? 0 + (c.imag ?? 0));
  }

  Complex operator -(Complex c) {
    return Complex(
        real: (real ?? 0) - (c.real ?? 0), imag: (imag ?? 0) - (c.imag ?? 0));
  }

  /// z1 = a+bi, z2 = c+di
  ///
  /// z1 * z2 = (ac-bd)+(bc+ad)i
  Complex operator *(Complex c) {
    return Complex(
        real: ((real ?? 0) * (c.real ?? 0) - (imag ?? 0) * (c.imag ?? 0)),
        imag: ((imag ?? 0) * (c.real ?? 0) + (real ?? 0) * (c.imag ?? 0)));
  }

  /// z1 = a+bi, z2 = c+di
  ///
  /// (a+bi)/(c+di)=(ac+bd)/(c2+d2) +((bc-ad)/(c2+d2))i
  Complex operator /(Complex com) {
    double a = real ?? 0;
    double b = imag ?? 0;

    double c = com.real ?? 0;
    double d = com.imag ?? 0;

    assert((c * c + d * d) != 0);

    return Complex(
        real: (a * c + b * d) / (c * c + d * d),
        imag: (b * c - a * d) / (c * c + d * d));
  }

  int _hash() {
    return Object.hash(real, imag);
  }

  @override
  int get hashCode => _hash();

  double magnitude() {
    return math.sqrt((real ?? 0) * (real ?? 0) + (imag ?? 0) * (imag ?? 0));
  }

  /// shorthand for magnitude()
  double get mag => magnitude();

  Complex conjugate() {
    return Complex(real: real, imag: -(imag ?? 0));
  }

  /// shorthand for conjugate()
  Complex get con => conjugate();
}
```

写了一个```Complex```类，包括实部和虚部，满足复数加减乘除。