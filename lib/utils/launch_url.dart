import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

class LaunchURL {
  static void launch(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    }
  }

  static void launchGitHub() async {
    launch(C.githubLink);
  }
}
