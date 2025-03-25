// @author luwenjie on 2025/3/25 12:14:48

import 'package:flutter/cupertino.dart';
import 'package:uizakura/src/get_instance/manager.dart';
import 'package:uuid/v4.dart';

class Store<T> {
  final Map<String, InstanceNotifier<T>> _instances = {};
  final Map<String, List<String>> _watchers = {};

  void _listenDispose(InstanceNotifier<T> notifier) {
    notifier.addListener(() {
      switch (notifier.action) {
        case null:
          break;
        case InstanceAction.recycle:
          instanceManager.debugLog("remove $T ${notifier.key}");
          _instances.remove(notifier.key);
          _watchers.remove(notifier.key);
          break;
      }
    });
  }

  List<String> _getWaters(String key) {
    List<String>? s = _watchers[key];
    s ??= List.empty();
    _watchers[key] = s;
    return s;
  }

  /// 根据 key 和工厂函数创建并存储实例
  InstanceNotifier<T> getNotifier({
    String? key,
    T Function()? factory,
    Object? extra,
    String? watchId,
  }) {
    final realKey = key ?? const UuidV4().generate();
    if (watchId != null) {
      _watchers[realKey] = _getWaters(realKey).toList()..add(watchId);
    }
    if (_instances.containsKey(realKey) && _instances[realKey] != null) {
      instanceManager.debugLog("$T hit cache $realKey  watcher $watchId");
      final notifier = _instances[realKey]!;
      if (watchId != null) {
        notifier.addWatcher(watchId);
      }
      return notifier;
    }

    if (factory == null) {
      throw StateError("factory == null and cache is null");
    }

    // new create
    final instance = factory();
    final create = InstanceNotifier(
      instance,
      key: realKey,
      extra: extra,
    );
    if (watchId != null) {
      create.addWatcher(watchId);
    }
    _instances[realKey] = create;
    instanceManager.debugLog("create $T $realKey watcher $watchId");
    _listenDispose(create);
    return create;
  }
}

class InstanceNotifier<T> with ChangeNotifier {
  final T instance;
  final String key;
  final List<String> watchIds = List.empty(growable: true);
  final Object? extra;

  InstanceNotifier(
    this.instance, {
    required this.key,
    this.extra,
  });

  void addWatcher(String id) {
    if (watchIds.contains(id)) return;
    watchIds.add(id);
  }

  void removeWatcher(String id) {
    watchIds.remove(id);
    instanceManager.debugLog("$T removeWatcher $id, $watchIds");
    if (watchIds.isEmpty) {
      recycle();
    }
  }

  InstanceAction? _action;

  InstanceAction? get action => _action;

  @protected
  @override
  void dispose() {
    super.dispose();
  }

  void recycle() {
    _action = InstanceAction.recycle;
    notifyListeners();
  }
}

enum InstanceAction {
  recycle,
}
