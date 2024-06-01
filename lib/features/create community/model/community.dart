import '../../../core/shared/model/user.dart';
import '../../community/model/thoughts.dart';

class Community {
  final DateTime dateTime;
  final User user;
  final String communityName;
  final String description;
  final String type;
  List<Thoughts> thoughts;

  Community(
      {required this.dateTime,
      required this.communityName,
      required this.description,
      required this.type,
      required this.thoughts,
      required this.user});

  factory Community.fromMap(Map<String, dynamic> mp) {
    return Community(
        dateTime: mp["dateTime"],
        communityName: mp["communityName"],
        description: mp["description"],
        type: mp["type"],
        thoughts: mp["thoughts"],
        user: mp["user"]);
  }

  Community copyWith({
    String? communityName,
    DateTime? dateTime,
    String? description,
    String? type,
    List<Thoughts>? thoughts,
    User? user,
  }) {
    return Community(
      communityName: communityName ?? this.communityName,
      dateTime: dateTime ?? this.dateTime,
      description: description ?? this.description,
      type: type ?? this.type,
      thoughts: thoughts ?? this.thoughts,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "thoughts": thoughts,
      "dateTime": dateTime,
      "communityName": communityName,
      "description": description,
      "type": type,
      "user": user
    };
  }
}
