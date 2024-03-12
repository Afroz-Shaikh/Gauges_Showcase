import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:showcase_app/providers/menu_item_provider.dart';
import 'package:showcase_app/routes/route_names.dart';
import 'package:showcase_app/utils/constants.dart';
import 'package:showcase_app/widgets/appbar_buttons.dart';
import 'dashboard.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool displayMobileLayout = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      bottomNavigationBar: const MainFooter(),
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainAppTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: displayMobileLayout ? 16 : 20),
            ),
          ],
        ),
        actions: [
          !displayMobileLayout ? const DocsButton() : const SizedBox.shrink(),
          !displayMobileLayout ? const GetPackageButton() : const SizedBox(),
          const HireUsButton(),
          SizedBox(
            width: !displayMobileLayout ? 30 : 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        bannerPath,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                        scale: 1,
                      ),
                    ),
                  ),
                  Center(
                    child: Flex(
                      direction:
                          displayMobileLayout ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GaugeCard(
                          title: "Linear Gauge",
                          description:
                              "A linear gauge package for Flutter that displays progress and can be customized for appearance and behavior.",
                          icon: Icons.linear_scale,
                          onPressed: () {
                            ref
                                .read(playgroundProvider.notifier)
                                .selectPlayground(Playground.linear);
                            ref.read(menuIndexProvider.notifier).updateIndex(0);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const DashBoard(
                            //       playground: Playground.linear,
                            //     ),
                            //   ),
                            // );
                            context.pushNamed(
                              RouteConstansts.linear,
                            );
                          },
                        ),
                        // ).animate(effects: [
                        //   //Shimmer
                        //   ShimmerEffect(
                        //       duration: const Duration(seconds: 2),
                        //       blendMode: BlendMode.srcATop,
                        //       color: Colors.black.withOpacity(0.2))
                        // ]),
                        GaugeCard(
                          title: "Radial Gauge",
                          description:
                              "A radial gauge package for Flutter that displays progress and can be customized for appearance and behavior.",
                          icon: Icons.ads_click_rounded,
                          onPressed: () {
                            ref
                                .read(playgroundProvider.notifier)
                                .selectPlayground(Playground.radial);

                            ref.read(menuIndexProvider.notifier).updateIndex(0);

                            context.pushNamed(
                              RouteConstansts.radial,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainFooter extends StatelessWidget {
  const MainFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool displaySmallFooter = MediaQuery.of(context).size.width < 356;
    return Container(
      height: 40,
      color: const Color(0xff171B21),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "© 2024 GeekyAnts",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              children: [
                !displaySmallFooter
                    ? const FooterButton.github(
                        text: "Github",
                        imageUrl: githubLogoPath,
                        scale: 30,
                        url: githubPathUrl,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  width: 10,
                ),
                const FooterButton(
                  text: "Package",
                  imageUrl: dartLogoPath,
                  scale: 14,
                  url: packageUrl,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GaugeCard extends StatefulWidget {
  const GaugeCard(
      {super.key,
      required this.title,
      required this.description,
      required this.onPressed,
      required this.icon});

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  State<GaugeCard> createState() => _GaugeCardState();
}

class _GaugeCardState extends State<GaugeCard> {
  Color backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: MediaQuery.of(context).size.width < 600 ? 0 : 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onHover: (value) {
            if (value) {
              setState(() {
                backgroundColor = Colors.red;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ]
                // border: Border.all(color: Colors.grey),
                ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      color: Colors.white.withOpacity(1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          widget.icon,
                          color: Colors.red,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(fontWeight: FontWeight.w200),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: widget.onPressed,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text("Show UseCases"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
