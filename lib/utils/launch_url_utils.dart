import 'package:flutter_base_framework/flutter_base_framework.dart';


class LaunchUrlUtils {
  static launchURL(String downloadUrl) async {
    if (await canLaunch(downloadUrl)) {
      await launch(downloadUrl);
    } else {
      throw 'Could not launch $downloadUrl';
    }
  }
}