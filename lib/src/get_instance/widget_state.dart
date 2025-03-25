// @author luwenjie on 2025/3/25 13:09:44

import 'package:flutter/cupertino.dart';

import 'auto_dispose.dart';

mixin AutoDisposeInstanceStateMixin<T extends StatefulWidget> on State<T> {
  final instanceController = AutoDisposeInstanceController();

  @override
  void dispose() {
    instanceController.dispose();
    super.dispose();
  }
}
