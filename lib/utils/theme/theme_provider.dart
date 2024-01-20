import 'package:flutter/material.dart';
import 'package:venice_caffee/utils/theme/theme_entities.dart';
import 'package:venice_caffee/utils/theme/theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();

  ThemeEntities _THEME_STATE = ThemeEntities.light;

  ThemeEntities get theme => _THEME_STATE;

  set setTheme(ThemeEntities theme) {
    _THEME_STATE = theme;
    themePreference.setTheme(theme: theme);
    notifyListeners();
  }
}
