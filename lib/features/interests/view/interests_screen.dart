// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:neu_normal/core/constants/app_colors.dart';
import 'package:neu_normal/core/constants/app_constants.dart';
import 'package:neu_normal/Utils/provider/app_providers.dart';
import 'package:neu_normal/core/shared/model/user.dart';
import 'package:neu_normal/data/local/local_storage.dart';
import 'package:neu_normal/core/shared/widgets/app_text.dart';
import 'package:neu_normal/core/shared/widgets/vertical_gap.dart';

class InterestScreen extends ConsumerWidget {
  InterestScreen({super.key, required this.password, required this.username});
  String username;
  String password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> interests = [
      'Dance',
      'Anime',
      'Music',
      'Art',
      'Literature',
      'Books',
      'ZooKeeping',
      'Chess',
      'Video Games',
      'Outdoor Games',
      'Football',
      'Cricket',
      'Photography',
      'Skating',
      'Kareoke',
      'Web Series',
      'Coding',
      'Software Development',
      'Electronics',
      'Astronomy',
      'Cosmology',
      'Space',
      'Travelling',
      'Cooking',
      'Designing',
      '3D Art',
      'Socializing'
    ];
    Map<String, dynamic> userInfo = {};
    final AppColorsTheme _appColorsTheme = AppColorsTheme.light();
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomSheet: InkWell(
        ///asynchronically storing the user interests in local storage
        onTap: () async {
          if (ref.read(interestProvider).isNotEmpty) {
            User user = User(
                interests: ref.read(interestProvider),
                name: username,
                password: password);

            await LocalStorageService.setString(
                LocalStorageKeys.userInfo, jsonEncode(user.toMap()));
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User Interests Saved Locally')));
            context.pushReplacement('/feed');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Select atleast one interest')));
          }
        },
        child: Container(
          color: _appColorsTheme.highlight,
          height: size.height / 15,
          width: size.width,
          child: Center(
              child: AppText.subtitleDefaultBold(
            'Next',
            context: context,
            color: Colors.white,
          )),
        ),
      ),
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalGap.small(),
              AppText.bigTextDefault(
                'Select Your interests',
                context: context,
                size: 35,
              ),
              VerticalGap.medium(),
              Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: interests.map(
                    (e) {
                      return InterestButton(interest: e);
                    },
                  ).toList()),
              VerticalGap.custom(size.height / 10),
            ],
          ),
        ),
      ),
    );
  }
}

class InterestButton extends ConsumerStatefulWidget {
  InterestButton({super.key, required this.interest});
  String interest;

  @override
  ConsumerState<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends ConsumerState<InterestButton> {
  final AppColorsTheme _appColorsTheme = AppColorsTheme.light();
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          side: WidgetStatePropertyAll(
              BorderSide(color: AppColorsTheme.light().highlight)),
          backgroundColor: WidgetStatePropertyAll(
              isSelected ? _appColorsTheme.highlight : Colors.white)),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;

          ///updating the user interests in current state of the provider
          isSelected
              ? ref.read(interestProvider.notifier).addInterest(widget.interest)
              : ref
                  .read(interestProvider.notifier)
                  .removeInterest(widget.interest);
        });
      },
      child: AppText.subtitleDefault(
        context: context,
        widget.interest,
        color: isSelected ? Colors.white : _appColorsTheme.highlight,
      ),
    );
  }
}
