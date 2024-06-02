import 'package:flutter/material.dart';
import 'package:neu_normal/core/shared/model/user.dart';
import 'package:neu_normal/features/create%20community/model/community.dart';
import 'package:neu_normal/features/event/view/eventDesc_AlertDialog.dart';
import '../../../core/shared/widgets/app_text.dart';
import '../../../core/shared/widgets/custom_input_field.dart';

class AlertDialogEventName extends StatefulWidget {
  AlertDialogEventName(
      {super.key,
      required this.textEditingController,
      required this.user,
      required this.community,
      required this.eventDateTime});
  TextEditingController textEditingController;
  final User user;
  final Community community;
  final DateTime eventDateTime;

  @override
  State<AlertDialogEventName> createState() => _AlertDialogEventNameState();
}

class _AlertDialogEventNameState extends State<AlertDialogEventName> {
  bool textAdded = false;
  final TextEditingController _eventDescCtrlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppText.defaultTextBold('Create Event', context: context),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.defaultTextBold(
            'Event Name',
            context: context,
            size: 16,
          ),
          CustomInputField(
            onChanged: (p0) {
              setState(() {
                p0.isNotEmpty ? textAdded = true : textAdded = false;
              });
            },
            is_obscure: false,
            textEditingController: widget.textEditingController,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              widget.textEditingController.text = '';
              Navigator.of(context).pop();
            },
            child: const Text('CANCEL')),
        Visibility(
          visible: textAdded,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) {
                    return EventdescAlertDialog(
                      community: widget.community,
                      eventDateTime: widget.eventDateTime,
                      user: widget.user,
                      eventName: widget.textEditingController.text,
                      descController: _eventDescCtrlr,
                    );
                  },
                );
              },
              child: const Text('Next')),
        )
      ],
    );
  }
}
