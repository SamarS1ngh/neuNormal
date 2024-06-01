import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:neu_normal/Utils/provider/app_providers.dart';
import 'package:neu_normal/core/constants/app_colors.dart';
import 'package:neu_normal/core/shared/widgets/app_text.dart';
import 'package:neu_normal/core/shared/widgets/vertical_gap.dart';

class CommunityFeedPage extends ConsumerWidget {
  const CommunityFeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(getUserProvider.notifier).getUser();
    final prov = ref.watch(feedProvider);
    final user = ref.read(getUserProvider);
    return Scaffold(
        appBar: AppBar(
          title: AppText.defaultTextBold(
            'Feed',
            context: context,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.go('/feed/create');
                },
                icon: const Icon(
                  Icons.add_home_work,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: ref.watch(feedProvider).length,
          itemBuilder: (context, index) {
            ref
                .read(timerProvider(prov[index].dateTime).notifier)
                .showDiff(prov[index].dateTime);
            String time = '';
            Duration diff = ref.watch(timerProvider(prov[index].dateTime));

            if (diff.inMinutes < 60) {
              time = '${diff.inMinutes} mins ago';
            } else if (diff.inMinutes >= 60 && diff.inHours < 24) {
              time = '${diff.inHours} hours ago';
            } else if (diff.inHours >= 24) {
              time = '${diff.inDays} days ago';
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  context.go('/feed/community',
                      extra: {"community": prov[index], "user": user});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.defaultTextBold(prov[index].communityName,
                              context: context),
                          AppText.subtitleDefault(
                              size: 12, prov[index].type, context: context),
                        ],
                      ),
                      AppText.subtitleDefault(size: 12, time, context: context),
                      VerticalGap.small(),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 1,
                        color: AppColorsTheme.light().highlight,
                      ),
                      VerticalGap.medium(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AppText.subtitleDefault(prov[index].description,
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            context: context),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
