import 'package:neu_normal/Utils/Routes/app_router_config.dart';
import 'package:neu_normal/core/constants/app_constants.dart';
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
    final AppColorsTheme appColorsTheme = AppColorsTheme.light();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              actionsIconTheme:
                  IconThemeData(color: appColorsTheme.textDefault),
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: appColorsTheme.highlight),
          iconTheme: IconThemeData(color: appColorsTheme.highlight),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  iconColor: WidgetStatePropertyAll(appColorsTheme.textDefault),
                  backgroundColor:
                      WidgetStatePropertyAll(appColorsTheme.highlight))),
          extensions: [
            AppColorsTheme.light(),
            AppTypography.main(),
            AppDimensionsTheme.main(View.of(context))
          ]),
    );
  }
}
