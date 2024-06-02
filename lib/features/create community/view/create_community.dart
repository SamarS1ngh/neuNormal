import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:neu_normal/Utils/provider/app_providers.dart';
import 'package:neu_normal/core/shared/model/user.dart';
import 'package:neu_normal/core/shared/widgets/app_text.dart';
import 'package:neu_normal/core/shared/widgets/centred_text_button.dart';
import 'package:neu_normal/core/shared/widgets/custom_input_field.dart';
import 'package:neu_normal/core/shared/widgets/vertical_gap.dart';
import 'package:neu_normal/data/local/local_storage.dart';
import 'package:neu_normal/features/create%20community/model/community.dart';

class CreateCommunity extends ConsumerStatefulWidget {
  const CreateCommunity({super.key});

  @override
  ConsumerState<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends ConsumerState<CreateCommunity> {
  final List<String> _typeList = [
    'Public',
    'Private',
    'Event-based',
    'Invitation-based',
    'Paid'
  ];
  String _type = 'Public';
  final TextEditingController _description = TextEditingController();
  final TextEditingController _name = TextEditingController();

  ///function to ensure that none of the textfields are empty
  bool validator() {
    if (_name.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please provide a Community Name')));
      return false;
    }

    if (_description.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please provide a description')));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.defaultText(
          'Create Community',
          context: context,
          color: Colors.white,
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalGap.big(),
              AppText.defaultTextBold('Name of your community?',
                  size: 20, context: context),
              VerticalGap.tiny(),
              CustomInputField(
                is_obscure: false,
                textEditingController: _name,
              ),
              VerticalGap.medium(),
              AppText.defaultTextBold(
                'Description',
                context: context,
                size: 20,
              ),
              VerticalGap.tiny(),
              CustomInputField(
                is_obscure: false,
                textEditingController: _description,
                maxLines: 10,
              ),
              VerticalGap.medium(),
              AppText.defaultTextBold(
                'Type',
                context: context,
                size: 20,
              ),
              DropdownButton<String>(
                value: _type,
                items: _typeList.map((String e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _type = newValue!;
                  });
                },
              ),
              VerticalGap.huge(),
              Center(
                child: CenteredTextButton.primary(
                    label: 'Create Community',
                    onTap: () async {
                      if (validator()) {
                        final userInfo = await LocalStorageService.getString(
                            LocalStorageKeys.userInfo);

                        if (userInfo != null) {
                          User user = User.fromMap(jsonDecode(userInfo));

                          Community newCommunity = Community(
                              events: [],
                              dateTime: DateTime.now(),
                              communityName: _name.text,
                              description: _description.text,
                              type: _type,
                              thoughts: [],
                              user: user);

                          ref
                              .read(feedProvider.notifier)
                              .addCommunity(newCommunity);

                          context.pop();
                        }
                      }
                    },
                    context: context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
