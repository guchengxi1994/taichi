extension AutoSize on double {
  /// ref for ```reference value```
  double autoFontSize(double current, {double ref = 80}) {
    assert(ref > 0);
    return current / ref * this;
  }

  double _half() {
    return 0.5 * this;
  }

  double get hf => _half();
}
