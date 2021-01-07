import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainModel extends ChangeNotifier {
  String text = 'Chuson';
  void changeChusonText() {
    text = 'Chuson!!!!';
    notifyListeners();
  }
}
