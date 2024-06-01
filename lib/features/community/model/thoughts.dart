import 'package:neu_normal/core/shared/model/user.dart';

class Thoughts {
  User user;
  String thought;

  Thoughts({required this.thought, required this.user});

  factory Thoughts.fromMap(Map<String, dynamic> mp) {
    return Thoughts(thought: mp["thought"], user: mp["user"]);
  }
}
