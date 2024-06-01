import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

///State Notifier class to update the community creation time
class TimeDiff extends StateNotifier<Duration> {
  TimeDiff(DateTime datetime) : super(const Duration(minutes: 0));

  showDiff(DateTime dateTime) {
    Timer.periodic(
      const Duration(minutes: 1),
      (timer) {
        state = DateTime.now().difference(dateTime);
      },
    );
  }
}
