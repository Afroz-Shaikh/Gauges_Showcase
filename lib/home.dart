import 'package:flutter/material.dart';
import 'package:showcase_app/pageview.dart';
import 'package:showcase_app/utils/colors.dart';
import 'package:showcase_app/utils/constants.dart';
import 'package:showcase_app/views/sidebar/drawer.dart';
import 'package:showcase_app/widgets/appbar_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          centerTitle: false,
          title: const Text(
            mainAppTitle,
            style: TextStyle(color: clearBlack, fontWeight: FontWeight.w600),
          ),
          backgroundColor: clearWhite,
          actions: const [
            GetPackageButton(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        backgroundColor: clearWhite,
        body: Row(
          children: [
            if (!displayMobileLayout) const DrawerContent(),
            const GaugeView()
          ],
        ));
  }
}


// Getting Error while Deploying to Vercel because of PreferredSizeWidget
// class MainHeader extends StatelessWidget with PreferredSizeWidget {
//   const MainHeader({
//     super.key,
//   });
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0.5,
//       centerTitle: false,
//       title: const Text(
//         " Flutter Gauges",
//         style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//       ),
//       backgroundColor: clearWhite,
//       actions: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//               onPressed: () {
//                 _launchInBrowser(Uri.parse(
//                     'https://pub.dev/packages/geekyants_flutter_gauges'));
//               },
//               icon: const FlutterLogo(),
//               label: const Text("Get Package")),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }