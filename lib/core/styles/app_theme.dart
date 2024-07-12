import 'package:flutter/material.dart';

sealed class AppTheme {
  static ThemeData get themeData => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
          centerTitle: true,
          toolbarHeight: 100,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      );
}
