// declaring providers globally

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/core/shared/model/user.dart';
import 'package:neu_normal/features/Auth/ViewModel/getUserVM.dart';
import 'package:neu_normal/features/Auth/ViewModel/signup_VM.dart';
import 'package:neu_normal/features/community/model/thoughts.dart';
import 'package:neu_normal/features/community/viewmodel/thoughts_VM.dart';
import 'package:neu_normal/features/create%20community/model/community.dart';
import 'package:neu_normal/features/event/model/event.dart';
import 'package:neu_normal/features/event/viewmodel/event_VM.dart';
import 'package:neu_normal/features/feed/viewmodel/feed_VM.dart';
import 'package:neu_normal/features/feed/viewmodel/timer.dart';
import 'package:neu_normal/features/interests/viewmodel/interest_VM.dart';

final signupProvider =
    StateNotifierProvider<SignupVM, bool>((ref) => (SignupVM()));

final interestProvider =
    StateNotifierProvider<InterestsVM, List<String>>((ref) => InterestsVM());

final feedProvider = StateNotifierProvider<FeedVM, List<Community>>((ref) {
  return FeedVM();
});

final timerProvider =
    StateNotifierProvider.family<TimeDiff, Duration, DateTime>(
  (ref, dateTime) {
    return TimeDiff(dateTime);
  },
);

final getUserProvider = StateNotifierProvider<GetUserVM, User>(
  (ref) => GetUserVM(),
);

final thoughtProvider =
    StateNotifierProvider.family<ThoughtsVM, List<Thoughts>, User>((ref, user) {
  return ThoughtsVM(user);
});

final eventProvider =
    StateNotifierProvider<EventVM, List<Event>>((ref) => EventVM());
