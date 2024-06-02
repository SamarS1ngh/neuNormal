import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/Utils/provider/app_providers.dart';
import 'package:neu_normal/core/constants/app_colors.dart';
import 'package:neu_normal/core/shared/widgets/app_text.dart';
import 'package:neu_normal/core/shared/widgets/vertical_gap.dart';
import 'package:neu_normal/features/event/view/eventName_alertDialog.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/shared/model/user.dart';
import '../../create community/model/community.dart';

class EventScreen extends ConsumerStatefulWidget {
  EventScreen({super.key, required this.community, required this.user});
  final Community community;
  final User user;

  @override
  ConsumerState<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends ConsumerState<EventScreen> {
  DateTime today = DateTime.now();
  TextEditingController _createEventCtrlr = TextEditingController();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  Future<dynamic> createEvent(TextEditingController createEvent) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogEventName(
            community: widget.community,
            eventDateTime: today,
            user: widget.user,
            textEditingController: createEvent);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final reff = ref.watch(feedProvider);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColorsTheme.light().highlight,
          onPressed: () {
            createEvent(_createEventCtrlr);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                availableGestures: AvailableGestures.all,
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: _onDaySelected,
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: today,
              ),
              VerticalGap.big(),
              AppText.defaultTextBold('Events', context: context),
              VerticalGap.medium(),
              ref.watch(eventProvider).isEmpty
                  ? AppText.defaultText(
                      'No events to show',
                      context: context,
                      size: 16,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: reff
                          .firstWhere(
                            (element) {
                              return element.communityName ==
                                  widget.community.communityName;
                            },
                          )
                          .events
                          .length,
                      itemBuilder: (context, index) {
                        final event = ref.watch(eventProvider)[index];

                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.subtitleDefault(
                                  reff
                                      .firstWhere((element) =>
                                          element.communityName ==
                                          widget.community.communityName)
                                      .events[index]
                                      .eventName,
                                  color: Colors.green,
                                  context: context),
                              AppText.subtitleDefault(
                                  size: 16,
                                  '${event.eventDate.day}/${event.eventDate.month}/${event.eventDate.year}',
                                  context: context)
                            ],
                          ),
                          subtitle: AppText.subtitleDefault(
                              reff
                                  .firstWhere((element) =>
                                      element.communityName ==
                                      widget.community.communityName)
                                  .events[index]
                                  .eventDescription,
                              context: context),
                          // Add more ListTile properties as needed
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
