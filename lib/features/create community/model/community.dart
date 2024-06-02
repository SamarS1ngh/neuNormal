import 'package:neu_normal/features/event/model/event.dart';

import '../../../core/shared/model/user.dart';
import '../../community/model/thoughts.dart';

class Community {
  final DateTime dateTime;
  final User user;
  final String communityName;
  final String description;
  final String type;
  List<Thoughts> thoughts;
  List<Event> events;

  Community(
      {required this.dateTime,
      required this.communityName,
      required this.description,
      required this.type,
      required this.thoughts,
      required this.events,
      required this.user});

  factory Community.fromMap(Map<String, dynamic> mp) {
    return Community(
        events: mp["events"],
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
    List<Event>? events,
    User? user,
  }) {
    return Community(
        communityName: communityName ?? this.communityName,
        dateTime: dateTime ?? this.dateTime,
        description: description ?? this.description,
        type: type ?? this.type,
        thoughts: thoughts ?? this.thoughts,
        user: user ?? this.user,
        events: events ?? this.events);
  }

  Map<String, dynamic> toMap() {
    return {
      "thoughts": thoughts,
      "events": events,
      "dateTime": dateTime,
      "communityName": communityName,
      "description": description,
      "type": type,
      "user": user
    };
  }
}
