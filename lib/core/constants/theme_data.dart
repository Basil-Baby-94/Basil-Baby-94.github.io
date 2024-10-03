import 'package:basilbaby/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = ThemeData.dark().copyWith(
  primaryColor: Colors.green.shade400,
  hintColor: const Color(0xFF3A89FF),
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  textTheme: GoogleFonts.firaCodeTextTheme(
    ThemeData.dark().textTheme,
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF1E1E1E),
    secondary: Color(0xFF3A89FF),
    surface: Color(0xFF2D2D2D),
    background: Color(0xFF1E1E1E),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green.shade400,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
  ),
  iconTheme: IconThemeData(
    color: kPrimaryColor, // Color of the icons
    size: 30, // Size of the icons
  ),
);
