import 'package:flutter/material.dart';

class OnbordingNotify with ChangeNotifier {
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;
  set setSelectedPage(value) {
    _selectedPage = value;
    notifyListeners();
  }
}
