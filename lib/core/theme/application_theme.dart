import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static ThemeData lightMode = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF39A552), primary: const Color(0xFF39A552)),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.exo(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.poppins(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        bodyMedium: GoogleFonts.exo(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
          color: Color(0xFF39A552),
          toolbarHeight: 75,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)))));
  static ThemeData darkMode = ThemeData();
}
