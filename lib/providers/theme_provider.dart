import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/themes/dark_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../themes/light_mode.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifier());

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  void toggleDark() {
    _themeData = darkMode;
    notifyListeners();
  }

  void toggleLight() {
    _themeData = lightMode;
    notifyListeners();
  }
}