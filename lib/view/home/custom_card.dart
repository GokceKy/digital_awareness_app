import 'package:digital_awareness_app/view/home/detail_screen.dart';
import 'package:flutter/material.dart';

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1, // Genişlik ayarı
          height: 100, // Yükseklik ayarı
          child: Card(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 5),
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
                  const SizedBox(height: 4),
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
        ),
      ),
    );
  }
}
