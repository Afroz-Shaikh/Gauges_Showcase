import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data.dart';
import '../../providers/menu_item_provider.dart';
import '../../utils/colors.dart';

class ShowcaseListView extends ConsumerWidget {
  const ShowcaseListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowCaseList(
      onSelected: (i) {
        ref.read(menuIndexProvider.notifier).updateIndex(i);

        ref.read(codeViewProvider.notifier).updateCodeView(false);
      },
    );
  }
}

class ShowCaseList extends ConsumerWidget {
  final Function(int) onSelected;
  const ShowCaseList({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Playground playground = ref.read(playgroundProvider);
    List<dynamic> usecases =
        playground == Playground.linear ? linearMenuItems : radialMenuItems;
    List<dynamic> useCases =
        usecases.where((item) => item.type == 'UseCase').toList();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < useCases.length; i++)
          DrawerListTile(onSelected: onSelected, index: i),
      ],
    );
  }
}

class DrawerListTile extends ConsumerWidget {
  const DrawerListTile({
    super.key,
    required this.onSelected,
    required this.index,
  });
  final int index;
  final Function(int p1) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(menuIndexProvider);
    final playground = ref.watch(playgroundProvider);
    return ListTile(
      autofocus: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      dense: true,
      selected: index == selectedIndex ? true : false,
      hoverColor: primaryColor.withOpacity(0.1),
      selectedColor: Colors.red,
      onTap: () {
        onSelected(index);
      },
      title: Text(
        playground == Playground.linear
            ? linearMenuItems[index].title
            : radialMenuItems[index].title,
      ),
    );
  }
}
