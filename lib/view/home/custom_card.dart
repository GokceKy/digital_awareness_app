import 'package:digital_awareness_app/view/home/detail_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String url;

  const CustomCard({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              url: url,
              title: title,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                url,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
