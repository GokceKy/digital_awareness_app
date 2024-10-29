import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String linkText;
  final String linkUrl;

  const ReportCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.linkText,
    required this.linkUrl,
  });

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'URL açma başarısız: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => launchURL(linkUrl),
              child: Text(
                linkText,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
