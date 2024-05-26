import 'package:fluttemp/View/Pages/HomeScreen/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return Home();
      },
    )
  ]);
}
