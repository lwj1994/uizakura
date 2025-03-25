// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:uizakura/src/get_instance/manager.dart';

class A {}

void main() {
  final a = instanceManager.get<A>(factory: () => A());
  final a1 = instanceManager.get<A>(factory: () => A());
  final a2 = instanceManager.get<A>(factory: () => A());
  final a3 = instanceManager.get<A>(key: "a", factory: () => A());
  final a4 = instanceManager.get<A>(key: "a");

  final a5 = instanceManager.getNotifier<A>(key: "b");
  print(a.hashCode.toString());
  print(a1.hashCode.toString());
  print(a2.hashCode.toString());
  print(a3.hashCode.toString());
  print(a4.hashCode.toString());
  print(a5.instance.hashCode.toString());

  a5.recycle();
}
