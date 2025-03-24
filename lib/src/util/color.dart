import 'package:flutter/material.dart';

/// @author luwenjie on 2023/10/3 16:48:39
///

extension ColorExtension on String {
  Color get color {
    final value = this;
    try {
      int colorValue = 0;
      if (value.startsWith('#')) {
        colorValue = int.tryParse(value.replaceRange(0, 1, ''), radix: 16) ?? 0;
      }

      if (value.length == '#FFFFFF'.length && value.startsWith('#')) {
        colorValue |= 0xFF000000;
      }
      return Color(colorValue);
    } catch (e) {
      return Colors.transparent;
    }
  }
}
