import 'package:digital_awareness_app/product/theme/theme_provider.dart';
import 'package:digital_awareness_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Digital Awareness App',
      home: const SplashScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
