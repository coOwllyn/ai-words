import 'package:flutter/material.dart';
import 'package:flutter_words/presentation/style/app_colors.dart';
import 'package:flutter_words/presentation/style/app_text_style.dart';

class FlutterTheme {
  static ThemeData get dark {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: AppColors.bgDark,
        elevation: 0,
        titleTextStyle:
            getHeaderStyle(color: AppColors.mainPurple, fontSize: 20),
      ),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: AppColors.white),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.red,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}