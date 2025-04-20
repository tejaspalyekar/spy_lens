import 'package:flutter/material.dart';

ThemeData myAppTheme = ThemeData.dark().copyWith(
  // Base colors
  primaryColor: const Color(0xFF1E88E5),
  scaffoldBackgroundColor: const Color(0xFF121212),

  // App bar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1A1A),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: Color(0xFF1E88E5)),
  ),

  // Button themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1E88E5),
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // Icon theme
  iconTheme: const IconThemeData(
    color: Color(0xFF1E88E5),
    size: 24,
  ),

  // Card theme
  cardTheme: CardTheme(
    color: const Color(0xFF1D1D1D),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  ),

  // Dialog theme
  dialogTheme: DialogTheme(
    backgroundColor: const Color(0xFF1D1D1D),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 8,
  ),

  // Floating action button theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF1E88E5),
    foregroundColor: Colors.white,
    elevation: 4,
  ),

  // Text theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(color: Colors.white70),
    bodyMedium: TextStyle(color: Colors.white70),
  ),

  // Switch theme
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF1E88E5);
      }
      return Colors.grey;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF1E88E5).withOpacity(0.5);
      }
      return Colors.grey.withOpacity(0.5);
    }),
  ),

  // Divider theme
  dividerTheme: const DividerThemeData(
    color: Color(0xFF2D2D2D),
    thickness: 1,
    space: 1,
  ),

  // Slider theme
  sliderTheme: const SliderThemeData(
    activeTrackColor: Color(0xFF1E88E5),
    inactiveTrackColor: Color(0xFF424242),
    thumbColor: Color(0xFF1E88E5),
    overlayColor: Color(0x1A1E88E5),
  ),

  // Bottom navigation bar theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1A1A1A),
    selectedItemColor: Color(0xFF1E88E5),
    unselectedItemColor: Colors.white54,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    elevation: 8,
  ),
);
