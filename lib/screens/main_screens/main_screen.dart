import 'package:flutter/material.dart';
import 'package:health_steshkin/screens/main_screens/account_screen/account_screen.dart';
import 'package:health_steshkin/screens/main_screens/food_screen/main_food.dart';
import 'package:health_steshkin/screens/main_screens/sleep_screen/main_sleep.dart';
import 'package:health_steshkin/screens/main_screens/sleep_screen/sleep_add.dart';
import 'package:health_steshkin/screens/main_screens/strength_screen/main_strength.dart';
import 'package:health_steshkin/screens/main_screens/account_screen/update_account_screen.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  String thisRoute = AllRoutes.food;
  bool is404 = false;

  void _goToRoute(String route){
    setState(() {
      thisRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    globalVar goTR = globalVar(thisRoute, _goToRoute);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigator(
        pages: [
          if(thisRoute == AllRoutes.food)
          MaterialPage<void>(
              child: FoodScreen(goTR),
          ),
          if(thisRoute == AllRoutes.account)
            MaterialPage<void>(
              child: AccountScreen(goTR),
            ),
          if(thisRoute == AllRoutes.sleep)
            MaterialPage<void>(
              child: SleepScreen(goTR),
            ),
          if(thisRoute == AllRoutes.sleep_add)
            MaterialPage<void>(
              child: AddSleepScreen(goTR),
            ),
          if(thisRoute == AllRoutes.strength)
            MaterialPage<void>(
              child: StrengthScreen(goTR),
            ),
          if(thisRoute == AllRoutes.account_update)
            MaterialPage<void>(
              child: UpdateProfileScreen(goTR),
            ),
          if(is404 == true)
            MaterialPage<void>(
              child: Scaffold(
                body: Center(
                  child: Text('Ошибка! Перезагрузите приложение'),
                ),
              ),
            ),
        ],
          onPopPage: (route, dynamic result){
            if(!route.didPop(result)){
              return false;
            }
            return true;
          },
      ),
    );
  }
}