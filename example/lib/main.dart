import 'dart:async';
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:uizakura/uizakura.dart';

import 'route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(navigatorObservers: () {
        return [];
      }),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

@RoutePage()
class MyHomePage extends UiaraPage {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  UiaraPageState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends UiaraPageState<MyHomePage> {
  late final _viewModel = getViewModel<MainViewModel>(
      key: "share",
      factory: () {
        return MainViewModel(state: "xx");
      });

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(_viewModel.state),
          FilledButton(
              onPressed: () {
                appRouter
                    .push(RiverpodRoute(id: Random().nextInt(1000).toString()));
              },
              child: const Text("push random id")),
          FilledButton(
              onPressed: () {
                appRouter.push(RiverpodRoute(id: "1"));
              },
              child: const Text("push 1")),
        ],
      ),
    );
  }
}

class MainViewModel extends ViewModel<String> {
  MainViewModel({required super.state}) {
    print("MainViewModel create : $hashCode");
    final t = Timer.periodic(Duration(seconds: 3), (t) {
      setState("update ${t.tick}");
    });
    addDispose(t.cancel);
  }
}
