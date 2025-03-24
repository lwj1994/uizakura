// @author luwenjie on 24/03/2025 23:07:18

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uizakura/uizakura.dart';

extension ViewModelExtension on UiaraPageState {
  VM getViewModel<VM extends ViewModel>(BuildContext context) {
    return context.read<VM>();
  }
}
