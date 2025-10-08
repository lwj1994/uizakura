import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:uizakura/src/widget/loading/loading_overlay.dart';
import 'package:uizakura/src/widget/on_first_frame_mixin.dart';
import 'package:uizakura/src/widget/widget_extension.dart';
import 'package:view_model/view_model.dart';
import 'package:widget_lifecycle/widget_lifecycle.dart';

import 'auto_dispose_mixin.dart';
import 'overlay_page_mixin.dart';

/// @author luwenjie on 2023/4/28 11:22:13
///
///
/// @author luwenjie on 2023/4/28 11:17:22

abstract class UiaraPage extends StatefulWidget {
  const UiaraPage({super.key});
}

abstract class UiaraPageState<T extends UiaraPage> extends State<T>
    with
        WidgetsBindingObserver,
        OnFirstFrameEndMixin<T>,
        OverLayerWidgetStateMixin<T>,
        AutoDisposeStateMixin<T>,
        ViewModelStateMixin<T>,
        LoadingOverlayStateMixin {
  @protected
  late final LifecycleController lifecycleController = LifecycleController();

  bool _showing = false;
  bool _disposed = false;

  bool get isDisposed => _disposed;

  bool get isShowing => _showing;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    refreshState();
  }

  Future<void> refreshState() async {
    if (isDisposed) return;
    await setStateWhenEndOfFrame();
  }

  FutureOr<void> onFirstShowing(BuildContext context) {}

  @mustCallSuper
  @override
  @visibleForTesting
  FutureOr<void> onFirstFrameEnd(BuildContext context) async {
    _showing = true;
    if (!isDisposed) await super.onFirstFrameEnd(context);
    if (context.mounted) {
      if (!isDisposed) await onFirstShowing(context);
    }
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  void onPreBuild(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return buildPageContainer();
  }

  @protected
  Widget buildPageContainer() {
    onPreBuild(context);
    return LifecycleAware(
      callShowOnAppResume: true,
      callHideOnAppPause: true,
      controller: lifecycleController,
      onShow: () {
        _showing = true;
        onShow();
      },
      onHide: () {
        _showing = false;
        onHide();
      },
      child: buildPage(context),
    );
  }

  @protected
  void onShow() {}

  @protected
  void onHide() {}

  Widget buildPage(BuildContext context);

  @override
  @mustCallSuper
  void dispose() {
    _showing = false;
    _disposed = true;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

abstract class UiaraViewModel<T> extends StateViewModel<T> {
  UiaraViewModel({required super.state});
}

abstract class UiaraViewModelFactory<T> with ViewModelFactory<T> {
  @override
  T build();
}
