import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase_app/pageview.dart';
import 'package:showcase_app/providers/menu_item_provider.dart';
import 'package:showcase_app/utils/constants.dart';
import 'package:showcase_app/views/sidebar/drawer.dart';
import 'package:showcase_app/widgets/appbar_buttons.dart';

class DashBoard extends ConsumerWidget {
  const DashBoard({
    required this.playground,
    super.key,
  });
  final Playground playground;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Playground playground = ref.watch(playgroundProvider);

    bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          elevation: 0.5,
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainAppTitle,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: displayMobileLayout ? 16 : 20),
              ),
              Text(
                "${playground.name.toUpperCase()} GAUGES",
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              )
            ],
          ),
          actions: [
            // ThemeButton(),
            !displayMobileLayout ? const DocsButton() : const SizedBox.shrink(),
            const GetPackageButton(),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        // 121212
        body: Row(
          children: [
            if (!displayMobileLayout) const DrawerContent(),
            const GaugeView()
          ],
        ));
  }
}

class DocsButton extends StatelessWidget {
  const DocsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text(" View Docs"));
  }
}

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          ref.read(darkModeProvider.notifier).toggle();
        },
        child: Icon(
          darkMode ? Icons.dark_mode : Icons.light_mode,
          color: Colors.blue,
        ),
      ),
    );
  }
}
