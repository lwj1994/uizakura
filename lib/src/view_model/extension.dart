// @author luwenjie on 2025/3/25 17:24:31

import 'package:flutter/cupertino.dart';
import 'package:uizakura/src/get_instance/auto_dispose.dart';
import 'package:uizakura/src/view_model/view_model.dart';
import 'package:uuid/v4.dart';

mixin ViewModelStateMixin<T extends StatefulWidget> on State<T> {
  final instanceController = AutoDisposeInstanceController();
  final Map<ViewModel, bool> _stateListeners = {};

  /// 如果没有指定 key 默认所有的 viewModel 用同一个 key。每次初始化时重新生成
  /// 保证每次 getViewModel 获取的实例是同一个
  final _defaultViewModelKey = const UuidV4().generate();

  bool _init = false;
  bool _dispose = false;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    _init = true;
  }

  VM getViewModel<VM extends ViewModel>({
    String? key,
    VM Function()? factory,
  }) {
    if (_dispose) {
      throw StateError("state is disposed");
    }
    key ??= _defaultViewModelKey;
    final res = instanceController.getInstance<VM>(
      factory: factory,
      key: key,
    );
    if (_stateListeners[res] != true) {
      res.addListener(() async {
        if (_dispose) return;
        while (!context.mounted) {
          await Future.delayed(Duration(milliseconds: 50));
          if (_dispose) return;
        }
        setState(() {});
      });
      _stateListeners[res] = true;
    }
    return res;
  }

  @override
  @mustCallSuper
  void dispose() {
    _dispose = true;
    _stateListeners.clear();
    instanceController.dispose();
    super.dispose();
  }
}
