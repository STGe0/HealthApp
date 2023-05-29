import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:health_steshkin/custom_widgets/bottom_bar.dart';
import 'package:health_steshkin/custom_widgets/workout_widget.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';

class StrengthScreen extends StatefulWidget{
  final globalVar goTR;
  const StrengthScreen(this.goTR, {super.key});

  @override
  State<StrengthScreen> createState() => _StrengthScreenState();
}

class _StrengthScreenState extends State<StrengthScreen>{

  void _onPressFull(){
    workoutVar.workoutTitle = 'FullBody тренировка';
    workoutVar.description = '30 минут | 180 ккал';
    workoutVar.item1 = 'Коврик';
    workoutVar.item2 = 'Гантели';
    workoutVar.item3 = 'Вода';
    workoutVar.asset1 = 'assets/image/workout_pages/mat.png';
    workoutVar.asset2 = 'assets/image/workout_pages/gan.png';
    workoutVar.asset3 = 'assets/image/workout_pages/water.png';

    workoutVar.work1 = 'Отжимания';
    workoutVar.work2 = 'Планка (с)';
    workoutVar.work3 = 'Скручивания';
    workoutVar.work4 = 'Приседания (гант.)';

    workoutVar.work_1 = '15x';
    workoutVar.work_2 = '30s';
    workoutVar.work_3 = '15x';
    workoutVar.work_4 = '15x';

    workoutVar.asset4 = 'assets/image/workout_pages/ot.png';
    workoutVar.asset5 = 'assets/image/workout_pages/planka.png';
    workoutVar.asset6 = 'assets/image/workout_pages/press.png';
    workoutVar.asset7 = 'assets/image/Low_workout.png';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressStr(){
    workoutVar.workoutTitle = 'Силовая тренировка';
    workoutVar.description = '60 минут | 400 ккал';
    workoutVar.item1 = 'Коврик';
    workoutVar.item2 = 'Гантели';
    workoutVar.item3 = 'Вода';
    workoutVar.asset1 = 'assets/image/workout_pages/mat.png';
    workoutVar.asset2 = 'assets/image/workout_pages/gan.png';
    workoutVar.asset3 = 'assets/image/workout_pages/water.png';

    workoutVar.work1 = 'Отжимания';
    workoutVar.work2 = 'Подъемы на бицепс';
    workoutVar.work3 = 'Тяга гантелей';
    workoutVar.work4 = 'Приседания с гантелями';

    workoutVar.work_1 = '15x';
    workoutVar.work_2 = '10x';
    workoutVar.work_3 = '10x';
    workoutVar.work_4 = '15x';

    workoutVar.asset4 = 'assets/image/workout_pages/ot.png';
    workoutVar.asset5 = 'assets/image/workout_pages/bic.png';
    workoutVar.asset6 = 'assets/image/workout_pages/jim.png';
    workoutVar.asset7 = 'assets/image/Low_workout.png';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressGym(){
    workoutVar.workoutTitle = 'Гимнастика';
    workoutVar.description = '15 минут | 90 ккал';
    workoutVar.item1 = 'Коврик';
    workoutVar.item2 = 'Резинка';
    workoutVar.item3 = 'Вода';
    workoutVar.asset1 = 'assets/image/workout_pages/mat.png';
    workoutVar.asset2 = 'assets/image/workout_pages/rez.png';
    workoutVar.asset3 = 'assets/image/workout_pages/water.png';

    workoutVar.work1 = 'Растяжка #1';
    workoutVar.work2 = 'Растяжка #2';
    workoutVar.work3 = 'Растяжка #3';
    workoutVar.work4 = 'Растяжка #4';

    workoutVar.work_1 = '10x';
    workoutVar.work_2 = '10x';
    workoutVar.work_3 = '10x';
    workoutVar.work_4 = '10x';

    workoutVar.asset4 = 'assets/image/3.png';
    workoutVar.asset5 = 'assets/image/workout_pages/w2.png';
    workoutVar.asset6 = 'assets/image/workout_pages/w3.png';
    workoutVar.asset7 = 'assets/image/workout_pages/rez.png';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressTop(){
    workoutVar.workoutTitle = 'Тренировка верхней части тела';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressLow(){
    workoutVar.workoutTitle = 'Тренировка нижней части тела';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressCardio(){
    workoutVar.workoutTitle = 'Кардио тренировка';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressCustom(){
    workoutVar.workoutTitle = 'Пользовательская тренировка';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Тренировки',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 34,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5,),
                      Divider(color: Colors.white,),
                      SizedBox(height: 5,),
                      WorkoutWidget('FullBody тренировка', '30 минут | 180 ккал', "assets/image/fullbody.png", _onPressFull),
                      WorkoutWidget('Силовая тренировка', '60 минут | 400 ккал', "assets/image/2.png", _onPressStr),
                      WorkoutWidget('Гимнастика', '15 минут | 90 ккал', "assets/image/3.png", _onPressGym),
                      WorkoutWidget('Тренировка верха тела', '30 минут | 200 ккал', "assets/image/top_workout.png", _onPressTop),
                      WorkoutWidget('Тренировка низа тела', '30 минут | 200 ккал', "assets/image/Low_workout.png", _onPressLow),
                      WorkoutWidget('Кардио тренировка', '30 минут | 300 ккал', "assets/image/5.png", _onPressCardio),
                      WorkoutWidget('Custom-тренировка', 'Описание Custom-тренировки', "assets/image/6.png", _onPressCustom),
                    ],
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
      ),
      bottomNavigationBar: BottomWidget(widget.goTR),
    );
  }
}