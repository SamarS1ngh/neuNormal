import 'package:fluttemp/Utils/Routes/app_router_config.dart';
import 'package:fluttemp/Utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              actionsIconTheme: const IconThemeData(color: Colors.white),
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: AppColorsTheme.dark().bgColor),
          extensions: [
            AppColorsTheme.dark(),
            AppTypography.main(),
            AppDimensionsTheme.main(View.of(context))
          ]),
    );
  }
}
