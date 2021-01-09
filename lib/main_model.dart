import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String text = 'Chuson';
  void changeChusonText() {
    text = 'Chuson!!!!';
    notifyListeners();
  }
}
