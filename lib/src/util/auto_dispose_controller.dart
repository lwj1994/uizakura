// @author luwenjie on 2025/3/25 17:50:54

import 'package:flutter/material.dart';

class AutoDisposeController {
  final _disposeSet = <Function()?>[];

  void addDispose(Function() block) async {
    _disposeSet.add(block);
  }

  void dispose() {
    for (var element in _disposeSet) {
      try {
        element?.call();
      } catch (e) {
        debugPrint("AutoDisposeMixin error on $e");
      }
    }
  }
}
