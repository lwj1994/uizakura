// @author luwenjie on 22/02/2025 21:30:48

import 'dart:async';

import 'package:flutter/services.dart';

class ClipboardUtil {
  static FutureOr<void> copy(String? data) async {
    if (data == null || data.isEmpty) {
      return;
    }
    return Clipboard.setData(ClipboardData(text: data));
  }
}
