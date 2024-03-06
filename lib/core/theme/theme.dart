import 'package:flutter/material.dart';

class ThemeService {
  ThemeData lightMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade400,
      inversePrimary: Colors.grey.shade700,
    ),
    textTheme: ThemeData.light()
        .textTheme
        .apply(bodyColor: Colors.grey[800], displayColor: Colors.black),
  );

  ThemeData darkMode = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300,
    ),
    textTheme: ThemeData.dark()
        .textTheme
        .apply(bodyColor: Colors.grey[300], displayColor: Colors.white),
  );
  static bool darkModeValue = false;
  static Future settingDarkModeInit() async {
    //   if (CacheHelper.getSaveData(key: "darkMode") == null) {
    //   CacheHelper.saveData(key: "darkMode", value: false);
    //}
    // darkModeValue = await CacheHelper.getSaveData(key: "darkMode");
  }

  static Future changeDarkMode() async {
    darkModeValue = !darkModeValue;
    //   await CacheHelper.saveData(key: "darkMode", value: darkModeValue);
  }
}
