import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCardWidget extends StatelessWidget {
  final String courseImage;
  final String courseName;
  final String courseDescription;
  final String courseLink;

  const CourseCardWidget({
    super.key,
    required this.courseImage,
    required this.courseName,
    required this.courseDescription,
    required this.courseLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Köşe yuvarlaklığı
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary, // Kenar rengi
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              courseImage,
              width: 120,
              height: 80,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    courseDescription,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => launchUrl(
                      Uri.parse(courseLink),
                    ),
                    child: Text(
                      'Daha Fazla Bilgi',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
