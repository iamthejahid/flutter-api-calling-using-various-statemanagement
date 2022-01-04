import "package:flutter/material.dart";

class GlobalColor {
  static Color get primaryTitle => const Color(0xd9222222);

  static Color get textGrey => const Color(0xFF949599);

  static Color get secondaryTitle => primaryTitle.withOpacity(0.5);

  static Color get loginTitle => const Color(0xd9222222);

  static Color get primaryColor => const Color(0xFF0675c1);

  static Color get priamaryBackground => const Color(0xFFf2f5fc);

  static Color get primaryContainerBG => const Color(0xFFffffff);

  static Color get splashColorFill => const Color(0xff0675C1);

  static Color get loginBackground => const Color(0xfff2f5fc);

  static Color get loginSubTitle => const Color(0xff212121).withOpacity(0.45);

  static Color get inputHint => const Color(0xd9222222);

  static Color get cursorColor => const Color(0xd9222222);

  static Color get submitButton => const Color(0xff6ba7cf);

  // ignore: prefer_const_constructors
  static Color get link => const Color(0xFF222222).withOpacity(0.85);

  static Color get focusedBar => const Color(0xd9222222).withOpacity(0.2);

  static Color get textPrimary => const Color(0xff007bff);

  static Color get textSuccess => const Color(0xff28a745);

  static Color get textDanger => const Color(0xffdc3545);

  static Color get textWarning => const Color(0xffffc107);

  static Color get textInfo => const Color(0xff17a2b8);

  // ignore: use_full_hex_values_for_flutter_colors
  static Color get settingIcon => const Color(0xff80222222);

  static Color get statusBarColor => const Color(0xFFf2f5fc);

  static Color get systemNavigationBarColor => Colors.transparent;
}
