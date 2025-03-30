import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// @author luwenjie on 2023/12/16 22:55:11
///
/// [hasMore] has more data in list
///
class LoadMore extends StatefulWidget {
  final Function()? onLoad;
  final bool hasMore;
  final WidgetBuilder? noMoreWidget;
  final WidgetBuilder? child;

  const LoadMore({
    super.key,
    this.onLoad,
    this.hasMore = true,
    this.noMoreWidget,
    this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return _LoadMore();
  }
}

class _LoadMore extends State<LoadMore> {
  late ValueKey<String> _key;
  bool _hidden = true;

  @override
  void initState() {
    super.initState();
    _refreshKey();
  }

  @override
  void didUpdateWidget(covariant LoadMore oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _refreshKey();
    });
  }

  void _refreshKey() {
    _hidden = true;
    _key = ValueKey(DateTime.now().millisecondsSinceEpoch.toString());
  }

  @override
  Widget build(BuildContext context) {
    final loading = widget.child?.call(context) ??
        StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return const CircularProgressIndicator(
              strokeWidth: 2,
            );
          },
        );

    return Material(
      type: MaterialType.transparency,
      child: VisibilityDetector(
          key: _key,
          child: !widget.hasMore
              ? widget.noMoreWidget?.call(context) ?? const SizedBox.shrink()
              : loading,
          onVisibilityChanged: (VisibilityInfo info) {
            if (!widget.hasMore) return;
            if (info.visibleFraction > 0) {
              if (_hidden) {
                _hidden = false;
                widget.onLoad?.call();
              }
            } else {
              _hidden = true;
            }
          }),
    );
  }
}
