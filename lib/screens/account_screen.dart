import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget{
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>{
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async{
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/start_main', (route) => false);
  }

  @override
  Widget build(BuildContext context){
    final navigator = Navigator.of(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Аккаунт',
          style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontSize: 24,
              fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
                splashRadius: 24,
                onPressed: () => navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false),
                icon: Icon(Icons.keyboard_backspace)
            );
          },
        ),
        actions: [
          IconButton(
              splashRadius: 22,
              onPressed: () => signOut(),
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}