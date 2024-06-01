// ignore: file_names
// class for adding the business logic of adding or removing interests

import 'package:flutter_riverpod/flutter_riverpod.dart';

class InterestsVM extends StateNotifier<List<String>> {
  InterestsVM() : super([]);

  void addInterest(String interest) {
    state.add(interest);
  }

  void removeInterest(String interest) {
    state.remove(interest);
  }
}
