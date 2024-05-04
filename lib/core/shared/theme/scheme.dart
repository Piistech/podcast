import 'package:flutter/material.dart';

import '../shared.dart';

class ThemeScheme {
  final MaterialColor accent;
  final Color background;
  final Color text;
  final Color link;
  final Color button;
  final Color card;
  final Color shadow;
  final Color success;
  final Color error;
  final Color warning;
  final Color tag;
  final Color highlight;
  final Color hint;

  ThemeScheme({
    required this.accent,
    required this.background,
    required this.text,
    required this.link,
    required this.button,
    required this.card,
    required this.shadow,
    required this.success,
    required this.error,
    required this.warning,
    required this.tag,
    required this.highlight,
    required this.hint,
  });

  factory ThemeScheme.find({
    required ThemeType type,
  }) {
    final theme = ThemeScheme(
      accent: type == ThemeType.light ? Colors.teal : Colors.teal,
      background: type == ThemeType.light ? Colors.white : Colors.black87,
      text: type == ThemeType.light ? Colors.black : Colors.white,
      link: type == ThemeType.light ? Colors.teal.shade700 : Colors.blue,
      button: type == ThemeType.light ? Colors.blue : Colors.blue,
      card: type == ThemeType.light ? Colors.grey.shade100 : Colors.grey[800]!,
      shadow:
          type == ThemeType.light ? Colors.grey.shade200 : Colors.grey[800]!,
      success: type == ThemeType.light
          ? Colors.greenAccent.shade700
          : Colors.grey[800]!,
      error: type == ThemeType.light
          ? Colors.redAccent.shade700
          : Colors.grey[800]!,
      warning: type == ThemeType.light
          ? Colors.deepOrangeAccent.shade200
          : Colors.grey[800]!,
      tag: type == ThemeType.light ? Colors.red.shade100 : Colors.grey[800]!,
      highlight:
          type == ThemeType.light ? Colors.red.shade200 : Colors.grey[800]!,
      hint: type == ThemeType.light ? Colors.grey : Colors.grey[800]!,
    );

    return theme;
  }
}
