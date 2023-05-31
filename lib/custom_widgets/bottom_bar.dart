import 'package:flutter/material.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';

class BottomWidget extends StatefulWidget {
  final globalVar goTR;
  const BottomWidget(this.goTR, {Key? key}) : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget>{

  Color activeButtonColor(String route){
    if(route == widget.goTR.thisRoute){
      return const Color.fromARGB(105, 115, 95, 124);
    }
    return Color.fromARGB(255, 27, 35, 36);
  }

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Material(
          color: activeButtonColor(AllRoutes.strength),
          child: InkWell(
            onTap: () {
              widget.goTR.goToRoute(AllRoutes.strength);
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
        Material(
          color: activeButtonColor(AllRoutes.food),
          child: InkWell(
            onTap: () {
              widget.goTR.goToRoute(AllRoutes.food);
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
          color: activeButtonColor(AllRoutes.sleep),
          child: InkWell(
            onTap: () {
              widget.goTR.goToRoute(AllRoutes.sleep);
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
      ],
    );
  }
}