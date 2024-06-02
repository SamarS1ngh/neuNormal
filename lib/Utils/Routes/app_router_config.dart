import 'package:neu_normal/features/Auth/View/signup_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:neu_normal/features/community/view/community_screen.dart';
import 'package:neu_normal/features/create%20community/model/community.dart';
import 'package:neu_normal/features/create%20community/view/create_community.dart';
import 'package:neu_normal/features/event/view/event_screen.dart';
import 'package:neu_normal/features/feed/view/feed_page.dart';
import 'package:neu_normal/features/interests/view/interests_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return SignupScreen();
        },
        routes: [
          GoRoute(
            path: 'interest/:name/:pswd',
            builder: (context, state) {
              return InterestScreen(
                username: state.pathParameters['name']!,
                password: state.pathParameters['pswd']!,
              );
            },
          ),
          GoRoute(
              path: 'feed',
              builder: (context, state) {
                return const CommunityFeedPage();
              },
              routes: [
                GoRoute(
                  path: 'create',
                  builder: (context, state) {
                    return const CreateCommunity();
                  },
                ),
                GoRoute(
                  path: 'community',
                  builder: (context, state) {
                    Map<String, dynamic> mp =
                        state.extra as Map<String, dynamic>;
                    return CommunityScreen(
                      community: mp["community"],
                      user: mp["user"],
                    );
                  },
                ),
                GoRoute(
                  path: 'create_event',
                  builder: (context, state) {
                    Map<String, dynamic> mp =
                        state.extra as Map<String, dynamic>;
                    return EventScreen(
                      community: mp["community"],
                      user: mp["user"],
                    );
                  },
                )
              ])
        ])
  ]);
}
