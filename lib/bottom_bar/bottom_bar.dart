import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget{
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var itRoute = ModalRoute.of(context)?.settings.name;
    final navigator = Navigator.of(context);

    ifActiveFoodScreen(){
      if(itRoute == '/food'){
        return const Color.fromARGB(35, 255, 255, 255);
      }
      return Colors.transparent;
    }

    ifActiveSleepScreen(){
      if(itRoute == '/sleep'){
        return const Color.fromARGB(35, 255, 255, 255);
      }
      return Colors.transparent;
    }

    ifActiveStrScreen(){
      if(itRoute == '/strength'){
        return const Color.fromARGB(35, 255, 255, 255);
      }
      return Colors.transparent;
    }

    return Row(
      children: [
        Material(
          color: ifActiveFoodScreen(),
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15)
          ),
          child: InkWell(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15)
            ),
            onTap: () {
              if(itRoute != '/food'){
                navigator.pushNamedAndRemoveUntil('/food', (Route<dynamic> route) => false);
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/image/food.png'),
              ),
            ),
          ),
        ),
        Material(
    color: ifActiveSleepScreen(),
    borderRadius: const BorderRadius.vertical(
    top: Radius.circular(15)),
          child: InkWell(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15)
            ),
            onTap: () {
              if(itRoute != '/sleep') {
                navigator.pushNamedAndRemoveUntil('/sleep', (Route<dynamic> route) => false);
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/image/sleep.png'),
              ),
            ),
          ),
        ),
        Material(
    color: ifActiveStrScreen(),
    borderRadius: const BorderRadius.vertical(
    top: Radius.circular(15)),
          child: InkWell(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15)
            ),
            onTap: () {
              if(itRoute != '/strength'){
                navigator.pushNamedAndRemoveUntil('/strength', (Route<dynamic> route) => false);
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/image/strength.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}