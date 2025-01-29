import 'package:flutter/material.dart';

class ColorPalette {
  // Base colors
  static const Color backgroundColor = Color(0xFFD6EFEB); // Background color
  static const Color homeBackgroundColor = Color(0xFFF3F3F3); // Background color
  static const Color white = Colors.white;          // White color
  static const Color primary = Color(0xFF5AE185);   // Primary color
  static const Color primaryLight = Color(0xFFB4F1CD); // Primary light color
  static const Color primaryShade = Color(0xFF46C974); // Primary shade color
  static const Color grey = Color(0xFF979797);      // Grey color

  // Additional colors
  static const Color error = Colors.red;           // Error color
  static const Color success = Colors.green;       // Success color

  // Colors extracted from the image
  static const Color darkBlue = Color(0xFF1B3558); // Dark blue gradient color
  static const Color lightBlue = Color(0xFF3A7AD9); // Lighter blue from the gradient
  static const Color greenGradient = Color(0xFF68E09D); // Gradient green close to primary

  // Gradient definition (optional)
  static const LinearGradient appBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [darkBlue, lightBlue, greenGradient],
  );
}
