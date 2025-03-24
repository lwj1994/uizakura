// @author luwenjie on 2025/3/24 14:50:33
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view_model.dart';

class StateWatcher<VM extends ViewModel<S>, S> extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    S state,
    VM viewModel,
  ) builder;
  final Function(BuildContext context, S state)? listener;

  const StateWatcher({super.key, required this.builder, this.listener});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VM, S>(builder: (
      BuildContext context,
      S state,
    ) {
      return builder(context, state, context.read<VM>());
    }, buildWhen: (S previous, S current) {
      return previous != current;
    }, listenWhen: (S previous, S current) {
      return previous != current;
    }, listener: (BuildContext context, S state) {
      listener?.call(context, state);
    });
  }
}
