import 'package:url_launcher/url_launcher.dart';

void downloadCvPdf(String assetPath, String fileName) async {
  final uri = Uri.parse(assetPath);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
