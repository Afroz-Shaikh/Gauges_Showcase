import 'package:flutter/material.dart';
import 'package:showcase_app/views/sidebar/playground.dart';
import 'package:showcase_app/views/sidebar/showcase.dart';

import '../../utils/colors.dart';

class DrawerHeader extends StatelessWidget {
  final String title;
  const DrawerHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.linear_scale_outlined,
      ),
      minLeadingWidth: 10,
      title: Text(
        title,
      ),
    );
  }
}

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
        backgroundColor: clearWhite,
        child: content,
      ),
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
  bool playGroundIsExpanded = true;
  @override
  Widget build(BuildContext context) {
    return MenuDrawer(
      content: Column(
        children: [
          Expanded(
            flex: showCaseIsExpanded ? 2 : 0,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: DrawerExpansionPanel(
                ontap: () {
                  setState(() {
                    showCaseIsExpanded = !showCaseIsExpanded;
                  });
                },
                isOpen: showCaseIsExpanded,
                childrenList: const ShowcaseListView(),
                title: "Linear Gauge",
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: DrawerExpansionPanel(
                isOpen: playGroundIsExpanded,
                childrenList: const PlayGroundListView(),
                title: "Playground",
                ontap: () {
                  setState(() {
                    playGroundIsExpanded = !playGroundIsExpanded;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerExpansionPanel extends StatelessWidget {
  final bool isOpen;
  final VoidCallback ontap;
  final Widget childrenList;
  final String title;
  const DrawerExpansionPanel(
      {super.key,
      required this.isOpen,
      required this.childrenList,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        ontap();
      },
      children: [
        ExpansionPanel(
          backgroundColor: secondaryBackgroundColor,
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) =>
              DrawerHeader(
            title: title,
          ),
          body: childrenList,
          isExpanded: isOpen,
        ),
      ],
    );
  }
}
