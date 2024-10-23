import 'package:digital_awareness_app/view/home/custom_search_bar.dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10), // Üstten boşluk ekleyebilirsiniz
              child: CustomSearchBar(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Text(
                'Welcome :${user.email!}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
