// @author luwenjie on 2025/3/25 12:23:33

import 'package:flutter/cupertino.dart';
import 'package:uizakura/src/get_instance/store.dart';

final instanceManager = InstanceManager._get();

class InstanceManager {
  bool _logEnable = false;

  InstanceManager._();

  set logEnable(value) {
    _logEnable = value;
  }

  void debugLog(String s) {
    if (!_logEnable) return;
    debugPrint("InstanceManager:  $s");
  }

  factory InstanceManager._get() => _instance;
  static final InstanceManager _instance = InstanceManager._();

  final Map<Type, dynamic> _stores = {};

  /// 获取指定类型的 Store
  Store<T> _getStore<T>() {
    Store<T>? s = _stores[T];
    s ??= Store<T>();
    _stores[T] = s;
    return s;
  }

  T get<T>({
    String? key,
    T Function()? factory,
    Object? extra,
    String? watchId,
  }) {
    return _getStore<T>()
        .getNotifier(
          key: key,
          factory: factory,
          extra: extra,
        )
        .instance;
  }

  InstanceNotifier getNotifier<T>({
    String? key,
    T Function()? factory,
    String? watchId,
  }) {
    return _getStore<T>().getNotifier(
      key: key,
      factory: factory,
      watchId: watchId,
    );
  }
}
