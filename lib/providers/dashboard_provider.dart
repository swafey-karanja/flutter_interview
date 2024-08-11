// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  String _selectedItem = "Home";

  String get selectedItem => _selectedItem;

  void updateSelectedItem(String newItem) {
    _selectedItem = newItem;
    notifyListeners();
  }
}
