import 'package:flutter/material.dart';
import 'package:showcase_app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class GetPackageButton extends StatelessWidget {
  const GetPackageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tooltip(
        message: "Get Package on Pub.dev",
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              // foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              _launchInBrowser(Uri.parse(packageUrl));
            },
            icon: Image.asset(
              dartLogoPath,
              scale: 10,
            ),
            label: const Text("Get Package")),
      ),
    );
  }
}

class GithubButton extends StatelessWidget {
  final String? url;
  final Color color;
  const GithubButton({super.key, required this.url, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "Github",
        onPressed: () {
          _launchInBrowser(Uri.parse(url!));
        },
        icon: Image.asset(
          githubLogoPath,
          color: color,
          scale: 30,
        ));
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.platformDefault,
  )) {
    throw Exception('Could not launch $url');
  }
}

class HireUsButton extends StatelessWidget {
  const HireUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tooltip(
        message: "Hire GeekyAnts for your next project",
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              // foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              _launchInBrowser(Uri.parse(packageUrl));
            },
            icon: Image.asset(
              geekyantsLogoPath,
              fit: BoxFit.fitWidth,
              scale: 40,
            ),
            label: const Text("Hire Us")),
      ),
    );
  }
}
