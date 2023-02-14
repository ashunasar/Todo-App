import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../gen/fonts.gen.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff46539E),
      colorScheme: const ColorScheme.light(
        secondary: Color(0xff2EBAEF),
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF5398D7)),
          backgroundColor: Color(0xff46539E),
          elevation: 0,
          titleTextStyle: TextStyle(fontFamily: FontFamily.lexendRegular)),
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
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            color: Colors.white,
            fontFamily: FontFamily.lexendRegular,
            fontSize: 12.sp),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff5D66AE)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff5D66AE)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 40)),
        backgroundColor: MaterialStateProperty.all(const Color(0xff2EBAEF)),
      )),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(foregroundColor: Colors.white));
}
