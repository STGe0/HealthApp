import 'package:flutter/material.dart';
import 'package:health_steshkin/bottom_bar/bottom_bar.dart';
import 'package:health_steshkin/screens/account_screen.dart';

class StrengthScreen extends StatefulWidget{
  const StrengthScreen({super.key});

  @override
  State<StrengthScreen> createState() => _StrengthScreenState();
}

class _StrengthScreenState extends State<StrengthScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'HealthApp',
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
                onPressed: (){
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountScreen()),
                  );
                },
                icon: Icon(Icons.account_circle)
            );
          },
        ),
      ),
      body: Text('Str'),
      bottomNavigationBar: BottomWidget(),
    );
  }
}