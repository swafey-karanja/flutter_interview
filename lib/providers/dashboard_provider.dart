// lib/providers/dashboard_provider.dart

import 'package:flutter/foundation.dart';

class DashboardProvider with ChangeNotifier {
  String _selectedItem = 'Home';
  int _selectedIndex = 0;
  

  String get selectedItem => _selectedItem;
  int get selectedIndex => _selectedIndex;


  void updateSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}