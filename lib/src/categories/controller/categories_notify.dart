import 'package:flutter/material.dart';

class CategoriesNotify with ChangeNotifier {
  String categories = '';
  void setCategories(String category, int id) {
    categories = category;
    _id = id;
    notifyListeners();
  }

  int _id = 0;
  int get id => _id;
  set setId(value) => _id = value;
}
