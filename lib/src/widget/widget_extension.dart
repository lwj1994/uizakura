import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// @author luwenjie on 2023/10/10 11:50:23

extension GlobalKeyExtension on GlobalKey {
  RenderBox get renderBox => currentContext?.findRenderObject() as RenderBox;

  Offset get globalOffset => renderBox.localToGlobal(
        Offset.zero,
      );
}

extension ContextExtension on BuildContext {
  /// 通过 localToGlobal 测量值判断页面是否可见。
  bool get isShowing {
    RenderObject? renderObject = findRenderObject();
    if (renderObject != null && renderObject.attached) {
      final RenderBox box = renderObject as RenderBox;
      final Offset offset = box.localToGlobal(Offset.zero);
      if (!offset.isFinite) {
        return false;
      }
      return true;
    }
    return false;
  }

  Size get screenSize => MediaQuery.maybeSizeOf(this) ?? Size(375, 1920);

  // 会随着键盘弹起变化
  EdgeInsets get padding => MediaQuery.maybePaddingOf(this) ?? EdgeInsets.zero;

  EdgeInsets get viewPadding =>
      MediaQuery.maybeViewPaddingOf(this) ?? EdgeInsets.zero;

  EdgeInsets get viewInsets =>
      MediaQuery.maybeViewInsetsOf(this) ?? EdgeInsets.zero;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  double get statusBarHeight => viewPadding.top;

  double get navigationBarHeight => viewPadding.bottom;

  double get devicePixelRatio =>
      MediaQuery.maybeDevicePixelRatioOf(this) ?? 1.0;
}

extension SliverExtension on Widget {
  SliverToBoxAdapter get sliverBox {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}

extension WidgetStateExtension on State<dynamic> {
  /// 等待当前帧结束再触发 setState
  Future<void> setStateWhenEndOfFrame() async {
    if (!mounted) return;
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return;
    }
    // ignore: invalid_use_of_protected_member
    setState(() {});
  }

  Future<T> postFrameCallback<T>(FutureOr<T> Function() thenCallback) {
    final Completer<T> completer = Completer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!completer.isCompleted) {
        completer.complete(thenCallback.call());
      }
    });
    return completer.future;
  }
}
