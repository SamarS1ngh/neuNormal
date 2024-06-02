import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/Utils/provider/app_providers.dart';
import 'package:neu_normal/core/shared/model/user.dart';
import 'package:neu_normal/features/create%20community/model/community.dart';
import 'package:neu_normal/features/event/model/event.dart';
import '../../../core/shared/widgets/app_text.dart';
import '../../../core/shared/widgets/custom_input_field.dart';

class EventdescAlertDialog extends ConsumerStatefulWidget {
  EventdescAlertDialog(
      {super.key,
      required this.descController,
      required this.eventName,
      required this.eventDateTime,
      required this.community,
      required this.user});
  Community community;
  TextEditingController descController;
  String eventName;
  User user;
  final DateTime eventDateTime;

  @override
  ConsumerState<EventdescAlertDialog> createState() =>
      _EventdescAlertDialogState();
}

class _EventdescAlertDialogState extends ConsumerState<EventdescAlertDialog> {
  bool textAdded = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: AppText.defaultTextBold('Event Description', context: context),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomInputField(
              maxLines: 10,
              onChanged: (p0) {
                setState(() {
                  p0.isNotEmpty ? textAdded = true : textAdded = false;
                });
              },
              is_obscure: false,
              textEditingController: widget.descController,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                widget.descController.text = '';
                Navigator.of(context).pop();
              },
              child: const Text('CANCEL')),
          Visibility(
            visible: textAdded,
            child: TextButton(
                onPressed: () async {
                  Event event = Event(
                      eventName: widget.eventName,
                      eventDescription: widget.descController.text,
                      eventCreator: widget.user,
                      eventDate: widget.eventDateTime);
                  ref.watch(eventProvider.notifier).addEvent(event);
                  ref.watch(feedProvider.notifier).updateCommunityEvents(
                      widget.community.communityName, ref.watch(eventProvider));
                  widget.descController.text = '';
                  Navigator.of(context).pop();
                },
                child: const Text('CREATE')),
          )
        ],
      ),
    );
  }
}
