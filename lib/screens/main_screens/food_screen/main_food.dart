import 'package:flutter/material.dart';
import 'package:health_steshkin/custom_widgets/bottom_bar.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';

class FoodScreen extends StatefulWidget{
  final globalVar goTR;
  const FoodScreen(this.goTR, {super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen>{

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
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Text(
                  'Питание',
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
