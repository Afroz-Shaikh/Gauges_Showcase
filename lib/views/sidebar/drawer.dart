import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcase_app/views/sidebar/playground.dart';
import 'package:showcase_app/views/sidebar/showcase.dart';

class MenuDrawer extends StatelessWidget {
  final Widget content;
  const MenuDrawer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Drawer(
        elevation: 0,
        width: 250,
        child: content,
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final Widget content;
  const MobileDrawer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: 250,
      child: content,
    );
  }
}

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  bool showCaseIsExpanded = true;
  bool usecase = true;
  bool playGroundIsExpanded = true;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return !isMobile
        ? MenuDrawer(
            content: Column(
              children: [
                // Segmented Control for Showcase and Playground
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CupertinoSlidingSegmentedControl(
                    groupValue: usecase ? "UseCase" : "Playground",
                    children: const {
                      "UseCase": Text("UseCase"),
                      "Playground": Text("Playground"),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        usecase = !usecase;
                      });
                    },
                  ),
                ),

                Expanded(
                  flex: showCaseIsExpanded ? 2 : 0,
                  child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Container(
                        child: usecase
                            ? const ShowcaseListView()
                            : const PlayGroundListView(),
                      )),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Flutter Gauges",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("v1.0.4")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : MobileDrawer(
            content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CupertinoSlidingSegmentedControl(
                  groupValue: usecase ? "UseCase" : "Playground",
                  children: const {
                    "UseCase": Text("UseCase"),
                    "Playground": Text("Playground"),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      usecase = !usecase;
                    });
                  },
                ),
              ),
              Expanded(
                flex: showCaseIsExpanded ? 2 : 0,
                child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Container(
                      child: usecase
                          ? const ShowcaseListView()
                          : const PlayGroundListView(),
                    )),
              ),
            ],
          ));
  }
}

// class DrawerExpansionPanel extends StatelessWidget {
//   final bool isOpen;
//   final VoidCallback ontap;
//   final Widget childrenList;
//   final String title;
//   const DrawerExpansionPanel(
//       {super.key,
//       required this.isOpen,
//       required this.childrenList,
//       required this.title,
//       required this.ontap});

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionPanelList(
//       expandedHeaderPadding: const EdgeInsets.all(0),
//       expansionCallback: (int index, bool isExpanded) {
//         ontap();
//       },
//       children: [
//         ExpansionPanel(
//           backgroundColor: secondaryBackgroundColor,
//           canTapOnHeader: true,
//           headerBuilder: (BuildContext context, bool isExpanded) =>
//               DrawerHeader(
//             title: title,
//           ),
//           body: childrenList,
//           isExpanded: isOpen,
//         ),
//       ],
//     );
//   }
// }
