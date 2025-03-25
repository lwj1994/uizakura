import 'package:flutter/cupertino.dart';
import 'package:uizakura/src/util/auto_dispose_controller.dart';

/// @author luwenjie on 2024/2/28 23:04:09

mixin AutoDisposeStateMixin<T extends StatefulWidget> on State<T> {
  final _controller = AutoDisposeController();

  @protected
  void addDispose(Function() block) async {
    _controller.addDispose(block);
  }

  @override
  @mustCallSuper
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
