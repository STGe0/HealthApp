import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/start', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Text(
                  'Главная страница',
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                      fontSize: 24,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(onPressed: () => signOut(),
                    child: Text('Выйти')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}