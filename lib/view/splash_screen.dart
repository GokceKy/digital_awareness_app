import 'package:digital_awareness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const HomeScreen()), // HomeScreen widget'ınızı buraya koyun
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon yerine Image widget'ı kullanılıyor
            Image.asset(
              'assets/ikontwo.png', // PNG dosyasının yolu
              width: 96, // Genişlik
              height: 96, // Yükseklik
            ),
            const SizedBox(height: 30),
            const Text(
              'Digital Awareness',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
