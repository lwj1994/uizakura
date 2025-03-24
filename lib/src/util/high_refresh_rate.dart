// @author luwenjie on 2025/3/24 14:44:35

import 'package:flutter/foundation.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

class HighRefreshRate {
  static Future<void> setHighRate() async {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      debugPrint("$e");
    }
  }
}
