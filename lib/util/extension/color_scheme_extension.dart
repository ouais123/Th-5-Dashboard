import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get border => const Color(0xFFE5DCDC);
  Color get text => Colors.black.withOpacity(0.7);
  Color get divider => const Color(0xFFC5C5C5);
}
