part of './taichi.dart';

class TaichiGraphStyle {
  Color color1; // default black
  Color color2; // default white
  double dotFactor; //default 0.125, range [0,0.25)
  Color dotColor1; // default color1
  Color dotColor2; // default color2
  double size;
  double angle;

  TaichiGraphStyle(
      {this.color1 = Colors.black,
      this.color2 = Colors.white,
      this.dotFactor = 0.125,
      this.dotColor1 = Colors.black,
      this.dotColor2 = Colors.white,
      this.size = 300,
      this.angle = 0});

  bool validate() {
    return color1 != color2 &&
        dotFactor >= 0 &&
        dotFactor < 0.25 &&
        dotColor1 != color2 &&
        dotColor2 != color1 &&
        size > 0;
  }
}
