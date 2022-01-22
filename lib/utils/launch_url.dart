import 'package:url_launcher/url_launcher.dart' as ul;

import 'constants.dart';

class LaunchURL {
  static void launch(String url) async {
    if (await ul.canLaunch(url)) {
      ul.launch(url);
    }
  }

  static void launchGitHub() async {
    launch(C.githubLink);
  }
}
