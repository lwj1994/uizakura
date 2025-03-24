// @author luwenjie on 2025/3/24 14:47:26

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uizakura/src/view_model/view_model.dart';

class MultiViewModelFactory extends StatelessWidget {
  final List<ViewModelFactory> factories;
  final Widget child;

  const MultiViewModelFactory({
    super.key,
    required this.factories,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: factories, child: child);
  }
}

class ViewModelFactory<VM extends ViewModel<Object?>> extends BlocProvider<VM> {
  const ViewModelFactory({super.key, super.child, required super.create});
}
