import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_steshkin/screens/main_food.dart';
import 'package:health_steshkin/screens/main_sleep.dart';
import 'package:health_steshkin/screens/main_strength.dart';
import 'package:health_steshkin/services/firebase_user.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => MainScreen(),
        '/food': (context) => FoodScreen(),
        '/sleep': (context) => SleepScreen(),
        '/strength': (context) => StrengthScreen(),
        '/start_main': (context) => FirebaseUser(),
      },
      initialRoute: '/food',
    );
  }
}