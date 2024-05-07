import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase_app/data.dart';
import 'package:showcase_app/providers/menu_item_provider.dart';

import 'package:showcase_app/views/sidebar/drawer.dart';
import 'package:showcase_app/widgets/appbar_buttons.dart';
import 'package:showcase_app/widgets/codeview.dart';

class GaugeView extends ConsumerWidget {
  const GaugeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(menuIndexProvider);
    bool showCode = ref.watch(codeViewProvider);
    bool darkMode = ref.watch(darkModeProvider);
    Playground playground = ref.watch(playgroundProvider);

    bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    List menuItems =
        playground == Playground.linear ? linearMenuItems : radialMenuItems;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
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
              playground == Playground.linear
                  ? linearMenuItems[index].title
                  : radialMenuItems[index].title,
              style: const TextStyle(fontSize: 14),
            ),
            automaticallyImplyLeading: displayMobileLayout ? true : false,
            // backgroundColor: Colors.white,
            actions: [
              menuItems[index].sourceCodePath != null
                  ? IconButton(
                      color: darkMode ? Colors.white : Colors.black,
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
              menuItems[index].sourceCodeUrl != null
                  ? GithubButton(
                      color: darkMode ? Colors.white : Colors.black,
                      url: linearMenuItems[index].sourceCodeUrl,
                    )
                  : const SizedBox(),
              IconButton(
                  color: darkMode ? Colors.white : Colors.black,
                  tooltip: "Full Screen",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                        child: AlertDialog(
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
            ],
          ),
          drawer: displayMobileLayout
              ? const DrawerContent()
              // ? Drawer(
              //     child: ListView(
              //       children: [
              //         ExpansionPanelList(
              //           children: [
              //             ExpansionPanel(
              //               headerBuilder: (BuildContext context,
              //                       bool isExpanded) =>
              //                   const ListTile(
              //                       leading: Icon(Icons.linear_scale_outlined),
              //                       title: Text('Linear Gauge')),
              //               body: MobileDrawerList(
              //                 onSelected: (i) {
              //                   ref
              //                       .read(menuIndexProvider.notifier)
              //                       .updateIndex(i);
              //                   ref
              //                       .read(codeViewProvider.notifier)
              //                       .updateCodeView(false);
              //                   Navigator.pop(context);
              //                 },
              //               ),
              //               isExpanded: true,
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   )
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
    Playground playground = ref.watch(playgroundProvider);
    if (playground == Playground.linear) {
      return linearMenuItems[index].widget;
    } else {
      return radialMenuItems[index].widget;
    }

    // menuItems[selectedIndex].widget
  }
}

// class MobileDrawerList extends StatelessWidget {
//   final Function(int) onSelected;
//   const MobileDrawerList({
//     super.key,
//     required this.onSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List showCaseItemsList =
//         linearMenuItems.where((element) => element.type == 'UseCase').toList();

//     List apiItemsList =
//         linearMenuItems.where((element) => element.type == 'API').toList();

//     return Column(
//       children: [
//         for (var i = 0; i < showCaseItemsList.length; i++)
//           DrawerListTile(
//               onSelected: onSelected, index: linearMenuItems[i].index),
//         const Divider(),
//         const ListTile(
//           title: Text('API Playground'),
//         ),
//         for (var i = 0; i < apiItemsList.length; i++)
//           DrawerListTile(
//               onSelected: onSelected,
//               index: linearMenuItems[i].index + showCaseItemsList.length),
//       ],
//     );
//   }
// }
