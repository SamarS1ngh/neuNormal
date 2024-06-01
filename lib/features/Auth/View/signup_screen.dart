// ignore_for_file: use_build_context_synchronously
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:neu_normal/core/constants/app_constants.dart';
import 'package:neu_normal/Utils/provider/app_providers.dart';
import 'package:neu_normal/core/shared/widgets/custom_input_field.dart';
import 'package:neu_normal/core/shared/widgets/app_text.dart';
import 'package:neu_normal/core/shared/widgets/centred_text_button.dart';
import 'package:flutter/material.dart';
import 'package:neu_normal/core/shared/widgets/vertical_gap.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({super.key});
  final AppColorsTheme _appColorsTheme = AppColorsTheme.light();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _pswd = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _appColorsTheme.bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.defaultTextBold('Let us sign you up!', context: context),
              VerticalGap.small(),
              CustomInputField(
                label: 'Username',
                is_obscure: false,
                prefixIcon: const Icon(Icons.person),
                textEditingController: _username,
              ),
              VerticalGap.medium(),
              CustomInputField(
                is_obscure: true,
                label: 'Password',
                prefixIcon: const Icon(Icons.lock),
                textEditingController: _pswd,
              ),
              VerticalGap.big(),
              CenteredTextButton.primary(
                  label: 'Sign Up',
                  onTap: () async {
                    await ref
                        .read(signupProvider.notifier)
                        .newUser(_username.text, _pswd.text);

                    if (_username.text.isNotEmpty && _pswd.text.isNotEmpty) {
                      /// if user is new, go to interests page, else directly go to feed
                      ref.watch(signupProvider)
                          ? context
                              .go('/interest/${_username.text}/${_pswd.text}')
                          : context.go('/feed');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Username or Password is invalid"),
                      ));
                    }
                  },
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
}
