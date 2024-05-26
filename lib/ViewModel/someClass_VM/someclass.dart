import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class SomeChangenotifierClass extends StateNotifier<int> {
  SomeChangenotifierClass() : super(0);

  void increment() {
    state++;
  }
}
