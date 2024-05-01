import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  Future<void> launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
