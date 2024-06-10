import 'package:url_launcher/url_launcher.dart';

class RedirectToPrivacyPolicy {
  static Uri privacyPolicyUrl = Uri.parse(
      'https://doc-hosting.flycricket.io/recall-privacy-policy/8b40805e-970e-4f24-8e32-a082ec9d73f2/privacy');
  static redirectToPrivacyPolicy() async {
    await launchUrl(privacyPolicyUrl);
  }
}
