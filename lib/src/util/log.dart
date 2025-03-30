import 'package:flutter/cupertino.dart';
import 'package:uizakura/uizakura.dart';

/// @author luwenjie on 2024/2/27 15:43:53

class UiaraLog {
  static void initialize() async {}

  static void clear() {}

  static Future<void> print(String tag, String s) async {
    if (UiaraAppEnv.isDebug) {
      debugPrint(
          "$tag:-------------------------\n$s\n-------------------------\n");
    }
  }
}
