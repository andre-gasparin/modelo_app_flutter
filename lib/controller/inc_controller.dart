import 'package:flutter/material.dart';

class IncController extends ChangeNotifier {
  int _number = 0;
  int get number => _number;

  incNumber(int quantidade) {
    _number = _number + quantidade;
    notifyListeners();
  }
}
