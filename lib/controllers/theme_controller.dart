import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      inversePrimary: Colors.grey.shade900,
    ),
  );
  final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade800,
      inversePrimary: Colors.grey.shade300,
    ),
  );

  final _getStorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMOde() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeData getThemeMode() {
    return isSavedDarkMOde() ? darkTheme : lightTheme;
  }

  void changeTheme() {
    Get.changeTheme(isSavedDarkMOde() ? lightTheme : darkTheme);
    saveThemeData(!isSavedDarkMOde());
  }
}
