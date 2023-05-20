import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_steshkin/screens/main_screen.dart';
import 'package:health_steshkin/screens/email_verified_screen.dart';
import 'package:health_steshkin/screens/reg_screen.dart';

import '../screens/auth_screen.dart';

class FirebaseUser extends StatelessWidget {
  const FirebaseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text('Что-то пошло не так!')));
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const VerifyEmailScreen();
          }
          return MainScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}