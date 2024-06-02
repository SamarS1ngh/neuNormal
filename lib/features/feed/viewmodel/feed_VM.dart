import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/core/shared/model/user.dart';
import 'package:neu_normal/features/community/model/thoughts.dart';
import 'package:neu_normal/features/create%20community/model/community.dart';
import 'package:neu_normal/features/event/model/event.dart';

class FeedVM extends StateNotifier<List<Community>> {
  FeedVM()
      : super([
          Community(
              communityName: 'ABC',
              dateTime: DateTime.now(),
              description: 'Testing out this create community feature',
              type: 'Private',
              thoughts: [],
              events: [],
              user: User(
                  interests: ['Football'], name: 'Bro', password: 'password')),
          Community(
              communityName: 'Geass',
              dateTime: DateTime.now(),
              thoughts: [],
              events: [],
              description:
                  'Attention, entire world! Hear my proclamation: I am Lelouch vi Britannia, Emperor of the Holy Britannian Empire and your only ruler! Schneizel has surrendered to me: as a result of this, I am now in control of both the Damocles and the FLEIJA weapons, and even the Black Knights no longer possess the strength to oppose me now! If anyone dares to oppose my supreme authority, they shall know the devastating power of the FLEIJAs. Those who could oppose my military rule no longer exist! Yes, from this day, from this moment forward, the world belongs to me! Lelouch vi Britannia commands you: Obey me, subjects! OBEY ME, WORLD!',
              type: 'Private',
              user: User(
                  interests: ['Chess'], name: 'Bro 2', password: 'password'))
        ]);

  addCommunity(Community community) {
    state = [community, ...state];
  }

  updateCommunityThoughts(String communityName, List<Thoughts> thoughts) {
    state = state.map((community) {
      if (community.communityName == communityName) {
        return community
            .copyWith(thoughts: [...thoughts, ...community.thoughts]);
      }
      return community;
    }).toList();
  }

  updateCommunityEvents(String communityName, List<Event> events) {
    state = state.map(
      (community) {
        if (community.communityName == communityName) {
          return community.copyWith(events: [...events, ...community.events]);
        }
        return community;
      },
    ).toList();
  }
}
