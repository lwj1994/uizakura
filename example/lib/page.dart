import 'dart:async';
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
  late MyViewModel viewModel = watchViewModel<MyViewModel>(
    factory: MyViewModelFactory(),
  );

  late MainViewModel mainViewModel =
      watchViewModel<MainViewModel>(factory: MainViewModelFactory());

  String get state => viewModel.state;

  @override
  void initState() {
    super.initState();
    setLoadingOverlayBuilder((c, state) {
      return Container(
        width: context.screenWidth,
        height: context.screenHeight,
        alignment: Alignment.center,
        child: Container(
          color: const Color(0x80000000),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  value: state.value,
                ),
              ),
              if (state.text.isNotEmpty) ...[
                SizedBox(height: 6),
                Text(state.text),
              ]
            ],
          ),
        ),
      );
    });
  }

  @override
  FutureOr<void> onFirstShowing(BuildContext context) {}

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
                showLoadingOverlay(LoadingOverlayState(text: "加载中"));
                Future.delayed(const Duration(seconds: 2), () {
                  hideLoadingOverlay();
                });
              },
              child: const Text("loading")),
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
    setState(Random().nextInt(200).toString());
  }
}
