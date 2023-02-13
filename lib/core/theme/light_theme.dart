import 'package:flutter/material.dart';
import '../../gen/fonts.gen.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(
        secondary: Color(0xff2EBAEF),
      ),
      textTheme: const TextTheme(
          displaySmall: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.zillaSlabMediumItalic),
          bodySmall: TextStyle(
              color: Colors.white, fontFamily: FontFamily.lexendRegular),
          bodyMedium: TextStyle(fontFamily: FontFamily.lexendRegular),
          titleMedium: TextStyle(color: Colors.black)),
      listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
          contentPadding: EdgeInsets.zero,
          textColor: Color(0xFFC5C5C5),
          shape: Border(bottom: BorderSide(color: Color(0xffC5C5C5))),
          minVerticalPadding: 15),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(foregroundColor: Colors.white));
}
