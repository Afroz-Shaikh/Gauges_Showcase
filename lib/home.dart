import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:showcase_app/data.dart';
import 'package:showcase_app/utils/colors.dart';
import 'package:showcase_app/widgets/codeview.dart';
import 'package:url_launcher/url_launcher.dart';

int selectedIndex = 0;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int selectedItem = 0;
  HomePage({super.key, required this.selectedItem});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Boolean for Drawer items State
  bool showCaseIsOpen = true;
  bool playgroundIsOpen = true;
  bool showCode = false;

  @override
  Widget build(BuildContext context) {
    bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Scaffold(
        appBar: const MainHeader(),
        backgroundColor: clearWhite,
        body: Row(
          children: [
            // Web Display Mode
            if (!displayMobileLayout)
              MenuDrawer(
                content: ListView(
                  children: [
                    ExpansionPanelList(
                      expandedHeaderPadding: const EdgeInsets.all(0),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          showCaseIsOpen = !showCaseIsOpen;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          backgroundColor: secondaryBackgroundColor,
                          canTapOnHeader: true,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) =>
                                  const DrawerHeader(),
                          body: showCaseListView(),
                          isExpanded: showCaseIsOpen,
                        ),
                      ],
                    ),
                    ExpansionPanelList(
                      expandedHeaderPadding: const EdgeInsets.all(0),
                      expansionCallback: (panelIndex, isExpanded) {
                        setState(() {
                          playgroundIsOpen = !playgroundIsOpen;
                        });
                      },
                      children: [
                        ExpansionPanel(
                            backgroundColor: secondaryBackgroundColor,
                            headerBuilder: (BuildContext context, isExpanded) =>
                                const ListTile(
                                  minLeadingWidth: 10,
                                  title: Text("PlayGround"),
                                ),
                            body: showCasePlaygroundView(),
                            isExpanded: playgroundIsOpen)
                      ],
                    )
                  ],
                ),
              ),

            // Main Content
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                ),
                margin: displayMobileLayout ? null : const EdgeInsets.all(10),
                child: Scaffold(
                  appBar: MainContentAppBar(
                      showCodeView: () {
                        setState(() {
                          showCode = !showCode;
                        });
                      },
                      codeMode: showCode,
                      displayMobileLayout: displayMobileLayout),
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
                                            leading: Icon(
                                                Icons.linear_scale_outlined),
                                            title: Text('Linear Gauge')),
                                    body: MobileDrawerList(
                                      onSelected: (i) {
                                        setState(() {
                                          selectedIndex = i;
                                        });
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
                          codePath: menuItems[selectedIndex].sourceCodePath,
                          index: selectedIndex,
                        )
                      : menuItems[selectedIndex].widget,
                ),
              ),
            )
          ],
        ));
  }

  Widget showCasePlaygroundView() {
    return PlayGroundList(
      onSelected: (i) {
        setState(() {
          selectedIndex = i;
        });
      },
    );
  }

  Widget showCaseListView() {
    return ShowCaseList(
      onSelected: (i) {
        setState(() {
          selectedIndex = i;
        });
      },
    );
  }
}

class MainContentAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainContentAppBar({
    super.key,
    required this.displayMobileLayout,
    required this.showCodeView,
    required this.codeMode,
  });
  final bool displayMobileLayout;
  final VoidCallback showCodeView;
  final bool codeMode;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData().copyWith(color: Colors.black),
      elevation: 0,
      centerTitle: false,
      title: Text(
        menuItems[selectedIndex].title,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
      automaticallyImplyLeading: displayMobileLayout ? true : false,
      backgroundColor: Colors.white,
      actions: [
        menuItems[selectedIndex].sourceCodePath != null
            ? IconButton(
                icon: codeMode
                    ? const Icon(Icons.display_settings)
                    : const Icon(Icons.code_rounded),
                tooltip: 'Source Code',
                onPressed: menuItems[selectedIndex].sourceCodePath != null
                    ? showCodeView
                    : null,
              )
            : const SizedBox(),
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => SizedBox(
                  child: AlertDialog(
                    backgroundColor: Colors.white,
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'))
                    ],
                    content: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: menuItems[selectedIndex].widget),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.fullscreen_exit_rounded)),
      ],
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(
        Icons.linear_scale_outlined,
      ),
      minLeadingWidth: 10,
      title: Text(
        'Linear Gauge',
      ),
    );
  }
}

class MainHeader extends StatelessWidget with PreferredSizeWidget {
  const MainHeader({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      centerTitle: false,
      title: const Text(
        " Flutter Gauges",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
      backgroundColor: clearWhite,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                _launchInBrowser(Uri.parse(
                    'https://pub.dev/packages/geekyants_flutter_gauges'));
              },
              icon: const FlutterLogo(),
              label: const Text("Get Package")),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

class ShowCaseList extends StatelessWidget {
  final Function(int) onSelected;
  const ShowCaseList({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> useCases =
        menuItems.where((item) => item.type == 'UseCase').toList();

    return Column(
      children: [
        for (var i = 0; i < useCases.length; i++)
          DrawerListTile(onSelected: onSelected, index: i),
      ],
    );
  }
}

class PlayGroundList extends StatelessWidget {
  final Function(int) onSelected;
  const PlayGroundList({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> useCases =
        menuItems.where((item) => item.type == 'UseCase').toList();
    List<dynamic> playgroundList =
        menuItems.where((item) => item.type == 'API').toList();

    return Column(
      children: [
        for (var i = 0; i < playgroundList.length; i++)
          DrawerListTile(onSelected: onSelected, index: useCases.length + i),
      ],
    );
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
    return Column(
      children: [
        for (var i = 0; i < menuItems.length; i++)
          DrawerListTile(onSelected: onSelected, index: menuItems[i].index),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.onSelected,
    required this.index,
  });
  final int index;
  final Function(int p1) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      autofocus: false,
      selectedTileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      dense: true,
      selected: index == selectedIndex ? true : false,
      hoverColor: primaryColor.withOpacity(0.1),
      selectedColor: Colors.red,
      onTap: () {
        onSelected(index);
      },
      title: Text(
        menuItems[index].title,
      ),
    );
  }
}

Color getBackgroundColor(int index) {
  if (selectedIndex == index) {
    return primaryColor;
  } else {
    return clearWhite;
  }
}

Color getTextColor(int index) {
  if (selectedIndex == index) {
    return clearWhite;
  } else {
    return clearBlack;
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
