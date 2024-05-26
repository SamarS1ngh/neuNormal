import 'package:fluttemp/Utils/constants/app_constants.dart';
import 'package:fluttemp/View/shared/centred_text_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AppColorsTheme _appColorsTheme = AppColorsTheme.dark();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColorsTheme.bgColor,
      body: Center(
        child: CenteredTextButton.primary(
            label: 'label', onTap: () {}, context: context),
      ),
    );
  }
}
