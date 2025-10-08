import 'package:flutter/foundation.dart';

/// @author luwenjie on 2024/1/16 17:27:13
class UizakuraNotifier<T extends Object> extends ChangeNotifier {
  T? _value;
  final String id;

  UizakuraNotifier({this.id = "", T? value}) {
    _value = value;
  }

  T? get value => _value;

  // any set will notifyListeners
  setValue(
    T? value, {
    bool notify = true,
  }) {
    _value = value;
    if (notify) {
      notifyListeners();
    }
  }

  void Function() listen(VoidCallback listener) {
    addListener(listener);
    void remove() {
      removeListener(listener);
    }

    return remove;
  }

  @override
  void dispose() {
    _value = null;
    super.dispose();
  }

  @override
  @Deprecated("use listen")
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
