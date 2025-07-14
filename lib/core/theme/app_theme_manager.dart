import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorPallete.primaryColor,
    scaffoldBackgroundColor: Colors.white
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorPallete.primaryColor,
  );
}
