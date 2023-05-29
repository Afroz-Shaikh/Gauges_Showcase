import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase_app/views/sidebar/showcase.dart';
import '../../data.dart';
import '../../providers/menu_item_provider.dart';

class PlayGroundListView extends ConsumerWidget {
  const PlayGroundListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlayGroundList(
      onSelected: (i) {
        ref.read(menuIndexProvider.notifier).updateIndex(i);
        ref.read(codeViewProvider.notifier).updateCodeView(false);
      },
    );
  }
}

class PlayGroundList extends ConsumerWidget {
  final Function(int) onSelected;
  const PlayGroundList({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Playground playground = ref.read(playgroundProvider);
    List useCases, playgroundList;

    if (playground == Playground.linear) {
      useCases =
          linearMenuItems.where((item) => item.type == 'UseCase').toList();
      playgroundList =
          linearMenuItems.where((item) => item.type == 'API').toList();
    } else {
      useCases =
          radialMenuItems.where((item) => item.type == 'UseCase').toList();
      playgroundList =
          radialMenuItems.where((item) => item.type == 'API').toList();
    }

    return Column(
      children: [
        for (var i = 0; i < playgroundList.length; i++)
          DrawerListTile(onSelected: onSelected, index: useCases.length + i),
      ],
    );
  }
}
