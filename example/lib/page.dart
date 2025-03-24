import 'dart:math';

import 'package:auto_route/annotations.dart';
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
  @override
  void initState() {
    super.initState();
  }

  ValueKey<int> _viewModelFactoryId = ValueKey(0);

  @override
  Widget buildPage(BuildContext context) {
    return ViewModelFactory<MyViewModel>(
      key: _viewModelFactoryId,
      create: (BuildContext context) {
        return MyViewModel("init state", "init arg");
      },
      child: ViewModelConsumer<MyViewModel, String>(
        listener: (c, s) {},
        builder: (BuildContext context, state, viewModel) {
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
                Text(
                  state,
                  style: const TextStyle(color: Colors.red),
                ),
                FilledButton(
                    onPressed: () async {
                      _viewModelFactoryId =
                          ValueKey(_viewModelFactoryId.value + 1);
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
                      debugPrint(
                          "page._viewModel hashCode = ${viewModel.hashCode}");
                      debugPrint("page.state = ${viewModel.state}");
                    },
                    child: const Text("print viewmodel")),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyViewModel extends ViewModel<String> {
  final String id;

  MyViewModel(super.state, this.id) {
    debugPrint("create ViewModel state:${state} id:$id hashCode:$hashCode");
  }

  @override
  Future<void> close() async {
    super.close();
    debugPrint("dispose ViewModel $id $hashCode");
  }

  void setId() {
    update((s) => Random().nextInt(200).toString());
  }
}
