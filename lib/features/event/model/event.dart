import '../../../core/shared/model/user.dart';

class Event {
  final String eventName;
  final String eventDescription;
  final DateTime eventDate;
  final User eventCreator;

  Event(
      {required this.eventName,
      required this.eventDescription,
      required this.eventCreator,
      required this.eventDate});

  factory Event.fromMap(Map<String, dynamic> mp) {
    return Event(
        eventName: mp["eventName"],
        eventDescription: mp["eventDescription"],
        eventCreator: mp["eventCreator"],
        eventDate: mp["eventDate"]);
  }
}
