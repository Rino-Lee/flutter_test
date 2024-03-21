import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {
  // private 선언은 이렇게 앞에 (_) under score 를 붙이면 됨
  int _count = 0;

  int get count => _count;

  void increase() {
    _count++;
    notifyListeners();
  }
}
