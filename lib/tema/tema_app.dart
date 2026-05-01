import 'package:flutter/material.dart';

class TemaApp {
  static const Color primary = Color(0xFF1A3A2B);
  static const Color accent = Color(0xFF2E7D52);
  static const Color gold = Color(0xFFFFD700);
  static const Color surface = Color(0xFFF4F6F4);
  static const Color card = Colors.white;

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          primary: primary,
          secondary: accent,
        ),
        scaffoldBackgroundColor: surface,
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: card,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey,
        ),
      );
}
