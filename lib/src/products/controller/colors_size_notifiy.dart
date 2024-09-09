import 'package:flutter/material.dart';

class ColorsSizeNotifiy with ChangeNotifier {
  String _sizes = '';

  String get sizes => _sizes;
  void setSizes(String s) {
    if (_sizes == s) {
      _sizes = '';
    } else {
      _sizes = s;
    }
    notifyListeners();
  }

  String _colors = '';

  String get colors => _colors;
  void setColor(String c) {
    if (_colors == c) {
      _colors = '';
    } else {
      _colors = c;
    }
    notifyListeners();
  }
}
