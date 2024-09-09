import 'package:e_commerce/common/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeTabNotify with ChangeNotifier {
  QueryType queryType = QueryType.all;
  final int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  String _index = 'All';
  String get index => _index;
  set setIndex(value) {
    _index = value;
    switch (index) {
      case 'All':
        setQueryType = QueryType.all;
        break;
      case 'Popular':
        setQueryType = QueryType.popular;
        break;
      case 'Unisex':
        setQueryType = QueryType.unisex;
        break;
      case 'Men':
        setQueryType = QueryType.men;
        break;
      case 'Women':
        setQueryType = QueryType.women;
        break;
      case 'kids':
        setQueryType = QueryType.kids;
        break;
      default:
        setQueryType = QueryType.all;
    }
    notifyListeners();
  }

  set setQueryType(value) {
    queryType = value;
    if (kDebugMode) {
      print('category ===>>> ${queryType.name}');
    }
  }
}
