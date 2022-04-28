/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-04-28 22:05:33
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-04-28 22:28:09
 */
part './_extension.dart';

class Complex {
  double? real;
  double? imag;

  Complex({
    this.real = 0,
    this.imag = 0,
  });

  @override
  String toString() {
    if ((imag ?? 0) > 0) {
      return "$real + ${imag}i";
    } else {
      return "$real - ${imag?.abs()}i";
    }
  }

  Complex operator +(Complex c) {
    return Complex(
        real: real ?? 0 + (c.real ?? 0), imag: imag ?? 0 + (c.imag ?? 0));
  }

  Complex operator -(Complex c) {
    return Complex(
        real: real ?? 0 - (c.real ?? 0), imag: imag ?? 0 - (c.imag ?? 0));
  }

  Complex operator *(Complex c) {
    return Complex();
  }

  Complex operator /(Complex c) {
    return Complex();
  }
}
