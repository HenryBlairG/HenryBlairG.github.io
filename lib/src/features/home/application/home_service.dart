import 'package:flutter/foundation.dart';

class HomeService {
  final _counter = ValueNotifier<int>(0);

  ValueListenable<int> get counter => _counter;

  void incrementCounter() {
    _counter.value++;
  }

  void dispose() {
    _counter.dispose();
  }
}
