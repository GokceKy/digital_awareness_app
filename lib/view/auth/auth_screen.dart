import 'package:digital_awareness_app/view/auth/login_or_register_screen.dart';
import 'package:digital_awareness_app/view/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              return HomeScreen();
            }
            //user is Not Logged in
            else {
              return const LoginOrRegisterScreen();
            }
          }),
    );
  }
}
