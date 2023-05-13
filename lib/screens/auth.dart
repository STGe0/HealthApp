import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_steshkin/screens/variables.dart';

class AuthRoute extends StatelessWidget{
  const AuthRoute({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}