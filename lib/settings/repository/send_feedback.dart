import 'package:url_launcher/url_launcher.dart';

class SendFeedback {
  static sendFeedback() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

// ···
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ahmed_el_zaeem@engineer.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Feedback about the "Recall" app',
      }),
    );

    launchUrl(emailLaunchUri);
  }
}
