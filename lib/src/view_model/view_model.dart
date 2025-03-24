import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

/// @author luwenjie on 2023/4/22 18:26:16
/// ViewMode base on Cubit
abstract class ViewModel<T> extends Cubit<T> {
  /// cache previous state size
  final int cacheLimit;
  final _disposeSet = <Function?>[];
  bool _disposed = false;
  final List<T> _caches = [];

  get disposed => _disposed;

  ViewModel(
    super.state, {
    this.cacheLimit = 1,
  });

  @protected
  void update(T Function(T state) cb) {
    if (_disposed) return;
    final newState = cb.call(state);
    if (state == newState) return;

    if (_caches.length == cacheLimit) {
      _caches.removeAt(0);
    }
    _caches.add(state);

    try {
      emit(newState);
    } catch (e) {
      //
      debugPrint("update state error ${T}, $e");
    }
  }

  T get previousState {
    return _caches.last;
  }

  @protected
  void addDispose(Function() block) {
    _disposeSet.add(block);
  }

  @override
  @mustCallSuper
  @protected
  Future<void> close() async {
    super.close();
    _caches.clear();
    _disposed = true;
    try {
      for (var element in _disposeSet) {
        element?.call();
      }
    } catch (e) {
      //
    }
  }
}
