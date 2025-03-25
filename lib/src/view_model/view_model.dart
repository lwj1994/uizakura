// @author luwenjie on 2025/3/25 17:00:38

import 'package:flutter/cupertino.dart';
import 'package:uizakura/src/util/auto_dispose_controller.dart';

class ViewModel<T> with ChangeNotifier {
  final _states = List<T>.empty(growable: true);
  final _autoDisposeController = AutoDisposeController();

  @protected
  void addDispose(Function() block) async {
    _autoDisposeController.addDispose(block);
  }

  final cacheLimit = 1;

  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  ViewModel({required T state}) {
    _addState(state);
  }

  void setState(T state) {
    if (_isDisposed) {
      return;
    }
    if (state == this.state) {
      return;
    }
    _addState(state);
    notifyListeners();
  }

  void _addState(T state) {
    if (_states.length == cacheLimit) {
      _states.removeAt(0);
    }
    _states.add(state);
  }

  T? get previousState {
    if (_states.length == 1) {
      return null;
    }
    return _states[_states.length - 1];
  }

  T get state {
    return _states.last;
  }

  @override
  void dispose() {
    _isDisposed = true;
    _autoDisposeController.dispose();
    super.dispose();
  }
}
