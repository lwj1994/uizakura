// @author luwenjie on 01/06/2025 15:25:41

import 'dart:async';

import 'package:dataforge_annotation/dataforge_annotation.dart';
import 'package:flutter/widgets.dart';
import 'package:uizakura/uizakura.dart';
import 'package:uuid/v4.dart';
import 'package:view_model/view_model.dart';

part 'loading_overlay.data.dart';

mixin LoadingOverlayStateMixin<T extends StatefulWidget> on State<T> {
  abstract final OverlayManager overlayManager;
  final _overlayKey = const UuidV4().generate();

  static Function(BuildContext context, LoadingOverlayState state) _builder =
      (c, state) => SizedBox();

  Future<R> executeWithLoading<R>({
    required FutureOr<R> Function() runner,
    required LoadingOverlayState loading,
  }) async {
    showLoadingOverlay(loading);
    final res = await runner.call();
    hideLoadingOverlay();
    return res;
  }

  void setLoadingOverlayBuilder(
      Function(BuildContext context, LoadingOverlayState state) builder) {
    _builder = builder;
  }

  bool get isLoadingOverlayShowing {
    return overlayManager.findByTag(_overlayKey) != null;
  }

  /// Show a loading overlay with an optional key.
  void showLoadingOverlay(LoadingOverlayState loading) {
    final state = loading.copyWith(key: _overlayKey);
    if (isLoadingOverlayShowing) {
      final vm = ViewModel.read<LoadingOverlayViewModel>(
        key: _overlayKey,
      );
      vm.setState(state);
    } else {
      overlayManager.show(context, priority: 99, tag: _overlayKey,
          builder: (c, handle) {
        return LoadingOverlay(state: state, builder: _builder);
      });
    }
  }

  /// Hide the loading overlay.
  void hideLoadingOverlay() {
    overlayManager.removeByTag(_overlayKey);
  }

  @override
  void dispose() {
    hideLoadingOverlay();
    super.dispose();
  }
}

class LoadingOverlay extends StatefulWidget {
  final LoadingOverlayState state;
  final Function(BuildContext context, LoadingOverlayState state) builder;

  const LoadingOverlay({
    super.key,
    required this.builder,
    required this.state,
  });

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

@DataClass()
class LoadingOverlayState with _LoadingOverlayState {
  @override
  final double? value;
  @override
  final String? key;
  @override
  final String text;

  const LoadingOverlayState({
    this.value,
    this.key,
    this.text = "",
  });
}

class _State extends State<LoadingOverlay> with ViewModelStateMixin {
  LoadingOverlayViewModel get _viewModel => watchViewModel(
      factory: LoadingOverlayViewModelFactory(
          initState: widget.state ?? const LoadingOverlayState()));

  LoadingOverlayState get _state => _viewModel.state;

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state);
  }
}

class LoadingOverlayViewModelFactory
    with ViewModelFactory<LoadingOverlayViewModel> {
  final LoadingOverlayState initState;

  LoadingOverlayViewModelFactory(
      {this.initState = const LoadingOverlayState()});

  @override
  LoadingOverlayViewModel build() {
    return LoadingOverlayViewModel(
      state: initState,
    );
  }
}

class LoadingOverlayViewModel extends StateViewModel<LoadingOverlayState> {
  LoadingOverlayViewModel({required super.state});
}
