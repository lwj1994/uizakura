import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';

/// @author luwenjie on 2023/10/10 11:50:23

extension GlobalKeyExtenstion on GlobalKey {
  RenderBox get renderBox => currentContext?.findRenderObject() as RenderBox;

  Offset get globalOffset => renderBox.localToGlobal(
        Offset.zero,
      );
}

extension GapExtension on num {
  Gap get gap {
    return Gap(toDouble());
  }
}

extension ContextExtenstion on BuildContext {
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

  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => MediaQuery.of(this).size.width;

  // 会随着键盘弹起变化
  EdgeInsets get padding => MediaQuery.of(this).padding;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;

  double get navigationBarHeight => MediaQuery.of(this).viewPadding.bottom;
}

extension SliverExtenstion on Widget {
  SliverToBoxAdapter get sliverBox {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}

extension WidgetStateExtenstion on State<dynamic> {
  bool get isMounted {
    try {
      return context.mounted;
    } catch (e) {
      return false;
    }
  }

  Future<void> rebuild() async {
    if (!mounted) return;
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return;
    }
    // ignore: invalid_use_of_protected_member
    setState(() {});
  }

  Future<T> postFrameCallback<T>(T Function() thenCallback) {
    final Completer<T> completer = Completer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      completer.complete(thenCallback.call());
    });
    return completer.future;
  }
}
