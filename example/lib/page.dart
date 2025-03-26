import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:example/main.dart';
import 'package:example/route.dart';
import 'package:flutter/material.dart';
import 'package:uizakura/uizakura.dart';

/// @author luwenjie on 2024/7/27 23:37:23

@RoutePage()
class RiverpodPage extends UiaraPage {
  final String id;

  const RiverpodPage(this.id, {super.key});

  @override
  UiaraPageState<RiverpodPage> createState() {
    return _State();
  }
}

class _State extends UiaraPageState<RiverpodPage> {
  ValueKey<int> _viewModelFactoryId = ValueKey(0);
  late MyViewModel viewModel = getViewModel<MyViewModel>(
    factory: MyViewModelFactory(),
  );

  late MainViewModel mainViewModel =
      getViewModel<MainViewModel>(factory: MainViewModelFactory());

  String get state => viewModel.state;

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.setId();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            appRouter.maybePop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("mainViewModel.state = ${mainViewModel.state}"),
          Text(
            state,
            style: const TextStyle(color: Colors.red),
          ),
          FilledButton(
              onPressed: () async {
                _viewModelFactoryId = ValueKey(_viewModelFactoryId.value + 1);
                setState(() {});
                // refreshProvider(_provider);
                // setState(() {
                //
                // });
                // _updateViewModel();
              },
              child: const Text("invalide with change id")),
          FilledButton(
              onPressed: () {
                debugPrint("page._viewModel hashCode = ${viewModel.hashCode}");
                debugPrint("page.state = ${viewModel.state}");
              },
              child: const Text("print viewmodel")),
        ],
      ),
    );
  }
}

class MyViewModelFactory extends UiaraViewModelFactory<MyViewModel> {
  @override
  MyViewModel build() {
    return MyViewModel(state: 'state', id: 'id');
  }
}

class MyViewModel extends UiaraViewModel<String> {
  final String id;

  MyViewModel({
    required super.state,
    required this.id,
  }) {
    debugPrint("create ViewModel state:$state id:$id hashCode:$hashCode");
  }

  @override
  void dispose() async {
    super.dispose();
    debugPrint("dispose ViewModel $id $hashCode");
  }

  void setId() {
    setState((s) => Random().nextInt(200).toString());
  }
}
