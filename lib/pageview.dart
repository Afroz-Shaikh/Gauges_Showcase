import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase_app/data.dart';
import 'package:showcase_app/providers/menu_item_provider.dart';
import 'package:showcase_app/utils/utils.dart';
import 'package:showcase_app/views/sidebar/showcase.dart';
import 'package:showcase_app/widgets/appbar_buttons.dart';
import 'package:showcase_app/widgets/codeview.dart';

class GaugeView extends ConsumerWidget {
  const GaugeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(menuIndexProvider);
    bool showCode = ref.watch(codeViewProvider);
    bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        margin: displayMobileLayout ? null : const EdgeInsets.all(10),
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData().copyWith(color: Colors.black),
            elevation: 0,
            centerTitle: false,
            title: Text(
              menuItems[index].title,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            automaticallyImplyLeading: displayMobileLayout ? true : false,
            backgroundColor: Colors.white,
            actions: [
              menuItems[index].sourceCodePath != null
                  ? IconButton(
                      icon: showCode
                          ? const Icon(Icons.display_settings)
                          : const Icon(Icons.code_rounded),
                      tooltip: 'Source Code',
                      onPressed: menuItems[index].sourceCodePath != null
                          ? () {
                              ref
                                  .read(codeViewProvider.notifier)
                                  .updateCodeView(!showCode);
                            }
                          : null,
                    )
                  : const SizedBox(),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                        child: AlertDialog(
                          backgroundColor: clearWhite,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'))
                          ],
                          content: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: menuItems[index].widget),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.fullscreen_exit_rounded)),
              menuItems[index].sourceCodeUrl != null
                  ? GithubButton(
                      url: menuItems[index].sourceCodeUrl,
                    )
                  : const SizedBox(),
            ],
          ),
          drawer: displayMobileLayout
              ? Drawer(
                  child: ListView(
                    children: [
                      ExpansionPanelList(
                        children: [
                          ExpansionPanel(
                            headerBuilder: (BuildContext context,
                                    bool isExpanded) =>
                                const ListTile(
                                    leading: Icon(Icons.linear_scale_outlined),
                                    title: Text('Linear Gauge')),
                            body: MobileDrawerList(
                              onSelected: (i) {
                                ref
                                    .read(menuIndexProvider.notifier)
                                    .updateIndex(i);
                                ref
                                    .read(codeViewProvider.notifier)
                                    .updateCodeView(false);
                                Navigator.pop(context);
                              },
                            ),
                            isExpanded: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : null,
          body: showCode
              ? CodeView(
                  index: index, codePath: menuItems[index].sourceCodePath)
              : const MainContent(),
        ),
      ),
    );
  }
}

class MainContent extends ConsumerWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(menuIndexProvider);
    return menuItems[index].widget;
    // menuItems[selectedIndex].widget
  }
}

class MobileDrawerList extends StatelessWidget {
  final Function(int) onSelected;
  const MobileDrawerList({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    List showCaseItemsList =
        menuItems.where((element) => element.type == 'UseCase').toList();

    List apiItemsList =
        menuItems.where((element) => element.type == 'API').toList();

    return Column(
      children: [
        for (var i = 0; i < showCaseItemsList.length; i++)
          DrawerListTile(onSelected: onSelected, index: menuItems[i].index),
        const Divider(),
        const ListTile(
          title: Text('API Playground'),
        ),
        for (var i = 0; i < apiItemsList.length; i++)
          DrawerListTile(
              onSelected: onSelected,
              index: menuItems[i].index + showCaseItemsList.length),
      ],
    );
  }
}
