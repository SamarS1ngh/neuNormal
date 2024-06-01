import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/Utils/provider/app_providers.dart';
import 'package:neu_normal/core/constants/app_colors.dart';
import 'package:neu_normal/core/shared/widgets/app_text.dart';
import 'package:neu_normal/core/shared/widgets/centred_text_button.dart';
import 'package:neu_normal/core/shared/widgets/custom_input_field.dart';
import 'package:neu_normal/core/shared/widgets/vertical_gap.dart';
import 'package:neu_normal/features/community/model/thoughts.dart';
import '../../../core/shared/model/user.dart';
import '../../create community/model/community.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  CommunityScreen({super.key, required this.community, required this.user});
  final Community community;
  final User user;

  @override
  ConsumerState<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen> {
  final TextEditingController _content = TextEditingController();
  bool joined = false;

  addThought(final thoughtsVM) {
    if (_content.text != '') {
      Thoughts thought = Thoughts(thought: _content.text, user: widget.user);
      thoughtsVM.newThought(thought, widget.community);

      ref.read(feedProvider.notifier).updateCommunityThoughts(
          widget.community.communityName, thoughtsVM.state);

      _content.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final thoughtsVM = ref.watch(thoughtProvider(widget.user).notifier);
    final reff = ref.watch(feedProvider);

    return Scaffold(
        appBar: AppBar(
          actions: [
            Visibility(
                visible: !joined,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.create,
                      color: Colors.white,
                    )))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.grey.shade300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.defaultTextBold(widget.community.communityName,
                            size: 30, context: context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.subtitleDefaultBold(
                                'Creator: ${widget.community.user.name}',
                                size: 14,
                                context: context),
                            AppText.subtitleDefault(
                                'Created at: ${widget.community.dateTime.day}/${widget.community.dateTime.month}/${widget.community.dateTime.year}',
                                size: 14,
                                context: context),
                          ],
                        ),
                        VerticalGap.medium(),
                        AppText.subtitleDefault(
                            'Event Type: ${widget.community.type}',
                            context: context)
                      ],
                    ),
                  ),
                  VerticalGap.big(),
                  Align(
                    alignment: Alignment.topRight,
                    child: CenteredTextButton.primary(
                        width: 60,
                        label: joined ? 'Join' : 'Joined',
                        onTap: () {
                          setState(() {
                            joined = !joined;
                          });
                          !joined
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Joined Community ')))
                              : null;
                        },
                        context: context),
                  ),
                  VerticalGap.small(),
                  AppText.defaultText(
                    'Description:',
                    context: context,
                    size: 16,
                  ),
                  VerticalGap.small(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: AppText.defaultText(
                      textAlign: TextAlign.start,
                      widget.community.description,
                      context: context,
                      size: 18,
                    ),
                  ),
                  VerticalGap.big(),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.grey.shade300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Thoughts Section
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,

                            ///Number of thoughts associated with a specific Community
                            itemCount: reff
                                .firstWhere(
                                  (element) {
                                    return element.communityName ==
                                        widget.community.communityName;
                                  },
                                )
                                .thoughts
                                .length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ///username of user who added thought
                                      AppText.subtitleDefaultBold(
                                          reff
                                              .firstWhere((element) =>
                                                  element.communityName ==
                                                  widget
                                                      .community.communityName)
                                              .thoughts[index]
                                              .user
                                              .name,
                                          context: context),

                                      ///thought
                                      AppText.subtitleDefault(
                                          reff
                                              .firstWhere((element) =>
                                                  element.communityName ==
                                                  widget
                                                      .community.communityName)
                                              .thoughts[index]
                                              .thought,
                                          color:
                                              AppColorsTheme.light().highlight,
                                          context: context),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          VerticalGap.medium(),
                          CustomInputField(
                              suffixFunction: () {
                                addThought(thoughtsVM);
                              },
                              suffix: Icon(
                                Icons.send,
                                color: AppColorsTheme.light().highlight,
                              ),
                              hintText: 'Share your thoughts here...',
                              is_obscure: false,
                              textEditingController: _content)
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _content.dispose();
  }
}
