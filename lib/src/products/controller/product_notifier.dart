import 'package:e_commerce/src/products/model/products_model.dart';
import 'package:flutter/material.dart';

class ProductNotifier with ChangeNotifier {
  Products? _product;
  set setProduct(Products product) => _product = product;
  Products? get product => _product;

  bool _description = false;
  bool get description => _description;
  void setDescription() {
    _description = !_description;
    notifyListeners();
  }

  void resetDescription() => _description = false;
}
