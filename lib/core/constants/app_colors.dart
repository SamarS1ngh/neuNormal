import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  //reference colors
  static const Color _magenta = Color(0xFFAD023B);
  static const Color _grey = Color(0xFF9E9E9E);
  static const Color _red = Color(0XFFB00020);
  static const Color _green = Color(0XFF00C853);
  static const Color _black = Colors.black;
  static const Color _white = Color(0xFFFFFFFF);

  //actual colors to be used throughout the app
  final Color bgColor;
  final Color bgInput;
  final Color highlight;
  final Color snackbarValidation;
  final Color snackBarFailure;
  final Color textDefault;

  // private constructor (use factories below instead):
  const AppColorsTheme._internal({
    required this.highlight,
    required this.bgColor,
    required this.bgInput,
    required this.snackbarValidation,
    required this.snackBarFailure,
    required this.textDefault,
  });

//defining dark theme
  factory AppColorsTheme.light() {
    return const AppColorsTheme._internal(
        highlight: _magenta,
        bgColor: _white,
        bgInput: _grey,
        snackbarValidation: _green,
        snackBarFailure: _red,
        textDefault: _black);
  }

//define your light theme
  // factory AppColorsTheme.light(){
  //   return AppColorsTheme._internal(...);
  // }

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) {
    if (lightMode == null || lightMode == true) {
      return AppColorsTheme.light();
    }
    return AppColorsTheme.light();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
          covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}
