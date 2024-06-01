import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/features/community/model/thoughts.dart';
import 'package:neu_normal/features/create%20community/model/community.dart';
import '../../../core/shared/model/user.dart';

class ThoughtsVM extends StateNotifier<List<Thoughts>> {
  ThoughtsVM(
    User user,
  ) : super([]);

  newThought(Thoughts thought, Community community) {
    state = [thought, ...state];
  }
}
