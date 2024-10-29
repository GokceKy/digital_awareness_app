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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.0,
          ),
        ),
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
                onTap: () => launchUrl(
                  Uri.parse(linkUrl),
                ),
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
      ),
    );
  }
}
