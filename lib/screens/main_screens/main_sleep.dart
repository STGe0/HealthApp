import 'package:flutter/material.dart';
import 'package:health_steshkin/bottom_bar/bottom_bar.dart';
import 'package:health_steshkin/services/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';

class SleepScreen extends StatefulWidget{
  final globalVar goTR;
  const SleepScreen(this.goTR, {super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen>{

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
                  widget.goTR.goToRoute(AllRoutes.account);
                },
                icon: Icon(Icons.account_circle)
            );
          },
        ),
      ),
      body: SafeArea(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Text(
              'Сон',
              style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 24,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 27, 35, 36),
          width: 50,
          height: 50,
        ),
        const SizedBox(),
      ],
    ),
    ),
      bottomNavigationBar: BottomWidget(widget.goTR),
    );
  }
}