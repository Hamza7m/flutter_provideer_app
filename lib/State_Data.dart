import 'package:flutter/material.dart';

class StateData with ChangeNotifier {
  String sehir = "mekki";
  void newCity(String newCity) {
    sehir = newCity;
    notifyListeners();
  }
}
