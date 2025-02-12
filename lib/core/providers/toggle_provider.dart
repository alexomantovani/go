import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  void setSelected(bool selected) {
    _isSelected = selected;
    notifyListeners();
  }
}
