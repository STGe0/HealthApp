import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:health_steshkin/custom_widgets/bottom_bar.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';

class StrengthScreen extends StatefulWidget{
  final globalVar goTR;
  const StrengthScreen(this.goTR, {super.key});

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
        title: AnimatedTextKit(
          totalRepeatCount: 1,
          repeatForever: true,
          pause: Duration(milliseconds: 500),
          animatedTexts: [
            FlickerAnimatedText('Health App',
              textStyle: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 32,
                  fontStyle: FontStyle.italic),
            ),
            RotateAnimatedText('Питание',
              textStyle: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 32,
                  fontStyle: FontStyle.italic),
            ),
            RotateAnimatedText('Сон',
              textStyle: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 32,
                  fontStyle: FontStyle.italic),
            ),
            RotateAnimatedText('Активность',
              textStyle: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 32,
                  fontStyle: FontStyle.italic),
            ),
            FlickerAnimatedText('Трекер здоровья',
              textStyle: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 24,
                  fontStyle: FontStyle.italic),
            ),
          ],
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
        actions: [
          IconButton(
              onPressed: () {
                widget.goTR.goToRoute(AllRoutes.sleep_add);
              }, splashRadius: 24, icon: Icon(Icons.pending_actions_rounded))
        ],
      ),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Text(
                  'Физическая активность',
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