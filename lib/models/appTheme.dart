import 'package:flutter/material.dart';

class AppTheme {
  static const String TITLE = 'NSE - National Stock Exchange of India';
  static const Color BACKGROUND_COLOR = Color(0XFF7851A9);
  static const Color COLOR_LIGHT = Color(0XFFd1b2e0);
  static const Color COLOR_DARK = Color(0XFF3d005b);
  static TextStyle TITLE_STYLE = const TextStyle(
    fontFamily: 'font',
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle SEGMENTED_STYLE_ACTIVE = const TextStyle(
    fontFamily: 'font',
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static TextStyle SEGMENTED_STYLE_DISABLED = const TextStyle(
    fontFamily: 'font',
    color: COLOR_LIGHT,
    fontSize: 15,
  );

  static TextStyle CONTENT_STYLE = const TextStyle(
    fontFamily: 'font',
    color: Colors.white,
    fontSize: 12,
  );
}
