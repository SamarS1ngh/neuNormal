import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/features/event/model/event.dart';

class EventVM extends StateNotifier<List<Event>> {
  EventVM() : super([]);

  addEvent(Event event) {
    state = [event, ...state];
  }
}
