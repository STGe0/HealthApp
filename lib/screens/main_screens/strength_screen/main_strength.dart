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
    workoutVar.work2 = 'Планка (сек.)';
    workoutVar.work3 = 'Скручивания';
    workoutVar.work4 = 'Приседания (гант.)';

    workoutVar.work_1 = '15x : 30 секунд отдых';
    workoutVar.work_2 = '30s';
    workoutVar.work_3 = '15x : 30 секунд отдых';
    workoutVar.work_4 = '15x : 2 минуты отдых';

    workoutVar.asset4 = 'assets/image/workout_pages/ot.png';
    workoutVar.asset5 = 'assets/image/workout_pages/planka.png';
    workoutVar.asset6 = 'assets/image/workout_pages/press.png';
    workoutVar.asset7 = 'assets/image/Low_workout.png';

    //Тренировка в зале
    workoutVarGym.workoutTitle = 'FullBody тренировка';
    workoutVarGym.description = '60 минут | 400 ккал';
    workoutVarGym.item1 = 'Штанга';
    workoutVarGym.item2 = 'Гантели';
    workoutVarGym.item3 = 'Тренажеры';
    workoutVarGym.item4 = 'Вода';
    workoutVarGym.asset1 = 'assets/image/workout_gym/barbell.png';
    workoutVarGym.asset2 = 'assets/image/workout_pages/gan.png';
    workoutVarGym.asset3 = 'assets/image/workout_gym/gym.png';
    workoutVarGym.asset4_1 = 'assets/image/workout_pages/water.png';

    workoutVarGym.work1 = 'Приседания со штангой';
    workoutVarGym.work2 = 'Жим штанги лежа';
    workoutVarGym.work3 = 'Подъем гантелей на бицепс';
    workoutVarGym.work4 = 'Подтягивания';
    workoutVarGym.work5 = 'Скручивания';
    workoutVarGym.work6 = 'Тяга гантелей в наклоне';

    workoutVarGym.work_1 = '10x : 60 секунд отдых';
    workoutVarGym.work_2 = '10x : 60 секунд отдых';
    workoutVarGym.work_3 = '12x : 60 секунд отдых';
    workoutVarGym.work_4 = '5x : 60 секунд отдых';
    workoutVarGym.work_5 = '20x : 60 секунд отдых';
    workoutVarGym.work_6 = '12x : 3 минуты отдых';

    workoutVarGym.asset4 = 'assets/image/workout_gym/pr.png';
    workoutVarGym.asset5 = 'assets/image/workout_gym/bpress.png';
    workoutVarGym.asset6 = 'assets/image/workout_pages/bic.png';
    workoutVarGym.asset7 = 'assets/image/workout_gym/pullups.png';
    workoutVarGym.asset8 = 'assets/image/workout_pages/press.png';
    workoutVarGym.asset9 = 'assets/image/workout_pages/jim.png';
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
    workoutVar.work3 = 'Тяга гантелей в наклоне';
    workoutVar.work4 = 'Приседания с гантелями';

    workoutVar.work_1 = '15x : 45 секунд отдых';
    workoutVar.work_2 = '10x : 45 секунд отдых';
    workoutVar.work_3 = '10x : 30 секунд отдых';
    workoutVar.work_4 = '15x : 2 минуты отдых';

    workoutVar.asset4 = 'assets/image/workout_pages/ot.png';
    workoutVar.asset5 = 'assets/image/workout_pages/bic.png';
    workoutVar.asset6 = 'assets/image/workout_pages/jim.png';
    workoutVar.asset7 = 'assets/image/Low_workout.png';

    //Тренировка в зале
    workoutVarGym.workoutTitle = 'Силовая тренировка';
    workoutVarGym.description = '60 минут | 400 ккал';
    workoutVarGym.item1 = 'Штанга';
    workoutVarGym.item2 = 'Гантели';
    workoutVarGym.item3 = 'Тренажеры';
    workoutVarGym.item4 = 'Вода';
    workoutVarGym.asset1 = 'assets/image/workout_gym/barbell.png';
    workoutVarGym.asset2 = 'assets/image/workout_pages/gan.png';
    workoutVarGym.asset3 = 'assets/image/workout_gym/gym.png';
    workoutVarGym.asset4_1 = 'assets/image/workout_pages/water.png';

    workoutVarGym.work1 = 'Приседания со штангой';
    workoutVarGym.work2 = 'Жим штанги лежа';
    workoutVarGym.work3 = 'Подъем гантелей на бицепс';
    workoutVarGym.work4 = 'Подтягивания';
    workoutVarGym.work5 = 'Скручивания';
    workoutVarGym.work6 = 'Тяга гантелей в наклоне';

    workoutVarGym.work_1 = '10x : 60 секунд отдых';
    workoutVarGym.work_2 = '10x : 60 секунд отдых';
    workoutVarGym.work_3 = '12x : 60 секунд отдых';
    workoutVarGym.work_4 = '5x : 60 секунд отдых';
    workoutVarGym.work_5 = '20x : 60 секунд отдых';
    workoutVarGym.work_6 = '12x : 3 минуты отдых';

    workoutVarGym.asset4 = 'assets/image/workout_gym/pr.png';
    workoutVarGym.asset5 = 'assets/image/workout_gym/bpress.png';
    workoutVarGym.asset6 = 'assets/image/workout_pages/bic.png';
    workoutVarGym.asset7 = 'assets/image/workout_gym/pullups.png';
    workoutVarGym.asset8 = 'assets/image/workout_pages/press.png';
    workoutVarGym.asset9 = 'assets/image/workout_pages/jim.png';

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
    workoutVar.work4 = 'Растягивание резинки';

    workoutVar.work_1 = '10x : 15 секунд отдых';
    workoutVar.work_2 = '10x : 15 секунд отдых';
    workoutVar.work_3 = '10x : 15 секунд отдых';
    workoutVar.work_4 = '10x : 1 минута отдых';

    workoutVar.asset4 = 'assets/image/3.png';
    workoutVar.asset5 = 'assets/image/workout_pages/w2.png';
    workoutVar.asset6 = 'assets/image/workout_pages/w3.png';
    workoutVar.asset7 = 'assets/image/workout_pages/rez.png';

    //Тренировка в зале
    workoutVarGym.workoutTitle = 'Гимнастика';
    workoutVarGym.description = '30 минут | 180 ккал';
    workoutVarGym.item1 = 'Коврик';
    workoutVarGym.item2 = 'Резинка';
    workoutVarGym.item3 = 'Перекладина';
    workoutVarGym.item4 = 'Вода';
    workoutVarGym.asset1 = 'assets/image/workout_pages/mat.png';
    workoutVarGym.asset2 = 'assets/image/workout_pages/rez.png';
    workoutVarGym.asset3 = 'assets/image/workout_gym/per.png';
    workoutVarGym.asset4_1 = 'assets/image/workout_pages/water.png';

    workoutVarGym.work1 = 'Растяжка #1';
    workoutVarGym.work2 = 'Растяжка #2';
    workoutVarGym.work3 = 'Растяжка #3';
    workoutVarGym.work4 = 'Растягивание резинки';
    workoutVarGym.work5 = 'Приседания "Пистолетик"';
    workoutVarGym.work6 = 'Подтягивания';

    workoutVarGym.work_1 = '10x : 15 секунд отдых';
    workoutVarGym.work_2 = '10x : 15 секунд отдых';
    workoutVarGym.work_3 = '10x : 15 секунд отдых';
    workoutVarGym.work_4 = '10x : 15 секунд отдых';
    workoutVarGym.work_5 = '10x : 15 секунд отдых';
    workoutVarGym.work_6 = '5x : 3 минуты отдых';

    workoutVarGym.asset4 = 'assets/image/3.png';
    workoutVarGym.asset5 = 'assets/image/workout_pages/w2.png';
    workoutVarGym.asset6 = 'assets/image/workout_pages/w3.png';
    workoutVarGym.asset7 = 'assets/image/workout_pages/rez.png';
    workoutVarGym.asset8 = 'assets/image/workout_gym/pistol.png';
    workoutVarGym.asset9 = 'assets/image/workout_gym/pullups.png';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressTop(){
    workoutVar.workoutTitle = 'Тренировка верхней части тела';
    workoutVar.description = '30 минут | 200 ккал';
    workoutVar.item1 = 'Коврик';
    workoutVar.item2 = 'Гантели';
    workoutVar.item3 = 'Вода';
    workoutVar.asset1 = 'assets/image/workout_pages/mat.png';
    workoutVar.asset2 = 'assets/image/workout_pages/gan.png';
    workoutVar.asset3 = 'assets/image/workout_pages/water.png';

    workoutVar.work1 = 'Жим гантелей лежа';
    workoutVar.work2 = 'Жим гантелей стоя';
    workoutVar.work3 = 'Отжимания';
    workoutVar.work4 = 'Подъемы на бицепс';

    workoutVar.work_1 = '15x : 30 секунд отдых';
    workoutVar.work_2 = '15x : 30 секунд отдых';
    workoutVar.work_3 = '15x : 30 секунд отдых';
    workoutVar.work_4 = '15x : 2 минуты отдых';

    workoutVar.asset4 = 'assets/image/workout_pages/gan2.png';
    workoutVar.asset5 = 'assets/image/workout_pages/gan3.png';
    workoutVar.asset6 = 'assets/image/workout_pages/ot.png';
    workoutVar.asset7 = 'assets/image/workout_pages/bic.png';

    //Тренировка в зале
    workoutVarGym.workoutTitle = 'Тренировка верхней части тела';
    workoutVarGym.description = '60 минут | 400 ккал';
    workoutVarGym.item1 = 'Штанга';
    workoutVarGym.item2 = 'Гантели';
    workoutVarGym.item3 = 'Тренажеры';
    workoutVarGym.item4 = 'Вода';
    workoutVarGym.asset1 = 'assets/image/workout_gym/barbell.png';
    workoutVarGym.asset2 = 'assets/image/workout_pages/gan.png';
    workoutVarGym.asset3 = 'assets/image/workout_gym/gym.png';
    workoutVarGym.asset4_1 = 'assets/image/workout_pages/water.png';

    workoutVarGym.work1 = 'Тяга верхнего блока';
    workoutVarGym.work2 = 'Жим штанги лежа';
    workoutVarGym.work3 = 'Подъем гантелей на бицепс';
    workoutVarGym.work4 = 'Подтягивания';
    workoutVarGym.work5 = 'Скручивания';
    workoutVarGym.work6 = 'Тяга гантелей в наклоне';

    workoutVarGym.work_1 = '12x : 60 секунд отдых';
    workoutVarGym.work_2 = '10x : 60 секунд отдых';
    workoutVarGym.work_3 = '12x : 60 секунд отдых';
    workoutVarGym.work_4 = '5x : 60 секунд отдых';
    workoutVarGym.work_5 = '20x : 60 секунд отдых';
    workoutVarGym.work_6 = '12x : 3 минуты отдых';

    workoutVarGym.asset4 = 'assets/image/workout_gym/workm.png';
    workoutVarGym.asset5 = 'assets/image/workout_gym/bpress.png';
    workoutVarGym.asset6 = 'assets/image/workout_pages/bic.png';
    workoutVarGym.asset7 = 'assets/image/workout_gym/pullups.png';
    workoutVarGym.asset8 = 'assets/image/workout_pages/press.png';
    workoutVarGym.asset9 = 'assets/image/workout_pages/jim.png';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressLow(){
    workoutVar.workoutTitle = 'Тренировка нижней части тела';
    workoutVar.description = '30 минут | 200 ккал';
    workoutVar.item1 = 'Коврик';
    workoutVar.item2 = 'Гантели';
    workoutVar.item3 = 'Вода';
    workoutVar.asset1 = 'assets/image/workout_pages/mat.png';
    workoutVar.asset2 = 'assets/image/workout_pages/gan.png';
    workoutVar.asset3 = 'assets/image/workout_pages/water.png';

    workoutVar.work1 = 'Приседания с гантелями';
    workoutVar.work2 = 'Выпады вперед';
    workoutVar.work3 = 'Выпригивания';
    workoutVar.work4 = 'Стульчик у стены';

    workoutVar.work_1 = '15x : 30 секунд отдых';
    workoutVar.work_2 = '15x : 30 секунд отдых';
    workoutVar.work_3 = '15x : 30 секунд отдых';
    workoutVar.work_4 = '30s : 2 минуты отдых';

    workoutVar.asset4 = 'assets/image/Low_workout.png';
    workoutVar.asset5 = 'assets/image/workout_pages/v1.png';
    workoutVar.asset6 = 'assets/image/workout_pages/jump.png';
    workoutVar.asset7 = 'assets/image/workout_pages/stul.png';

    //Тренировка в зале
    workoutVarGym.workoutTitle = 'Тренировка нижней части тела';
    workoutVarGym.description = '60 минут | 400 ккал';
    workoutVarGym.item1 = 'Штанга';
    workoutVarGym.item2 = 'Коврик';
    workoutVarGym.item3 = 'Тренажеры';
    workoutVarGym.item4 = 'Вода';
    workoutVarGym.asset1 = 'assets/image/workout_gym/barbell.png';
    workoutVarGym.asset2 = 'assets/image/workout_pages/mat.png';
    workoutVarGym.asset3 = 'assets/image/workout_gym/gym.png';
    workoutVarGym.asset4_1 = 'assets/image/workout_pages/water.png';

    workoutVarGym.work1 = 'Приседания со штангой';
    workoutVarGym.work2 = 'Выпады вперед';
    workoutVarGym.work3 = 'Приседания "Пистолетик"';
    workoutVarGym.work4 = 'Становая тяга';
    workoutVarGym.work5 = 'Жим ногами';
    workoutVarGym.work6 = 'Махи ногой в упоре';

    workoutVarGym.work_1 = '10x : 60 секунд отдых';
    workoutVarGym.work_2 = '15x : 60 секунд отдых';
    workoutVarGym.work_3 = '10x : 60 секунд отдых';
    workoutVarGym.work_4 = '10x : 60 секунд отдых';
    workoutVarGym.work_5 = '10x : 60 секунд отдых';
    workoutVarGym.work_6 = '20x : 3 минуты отдых';

    workoutVarGym.asset4 = 'assets/image/workout_gym/pr.png';
    workoutVarGym.asset5 = 'assets/image/workout_pages/v1.png';
    workoutVarGym.asset6 = 'assets/image/workout_gym/pistol.png';
    workoutVarGym.asset7 = 'assets/image/workout_gym/stun.png';
    workoutVarGym.asset8 = 'assets/image/workout_gym/gl.png';
    workoutVarGym.asset9 = 'assets/image/workout_gym/l1.png';
    widget.goTR.goToRoute(AllRoutes.workout_page);
  }
  void _onPressCardio(){
    workoutVar.workoutTitle = 'Пробежка';
    workoutVar.description = '30 минут (5 километров) | 300 ккал';
    workoutVar.item1 = 'Кросовки';
    workoutVar.item2 = 'Вода';
    workoutVar.asset1 = 'assets/image/workout_pages/cros.png';
    workoutVar.asset2 = 'assets/image/workout_pages/water.png';

    workoutVar.asset4 = 'assets/image/5.png';

    workoutVar.work1 = 'Бег (пробежка)';
    workoutVar.work2 = '30 минут';

    workoutVar.work_1 = '30 минут | 5 километров';

    widget.goTR.goToRoute(AllRoutes.workout_cardio);
  }
  void _onPressWalk(){
    workoutVar.workoutTitle = 'Ходьба';
    workoutVar.description = '60 минут (6 тыс. шагов) | 300 ккал';
    workoutVar.item1 = 'Кросовки';
    workoutVar.item2 = 'Вода';
    workoutVar.asset1 = 'assets/image/workout_pages/cros.png';
    workoutVar.asset2 = 'assets/image/workout_pages/water.png';

    workoutVar.asset4 = 'assets/image/workout_pages/walk.png';

    workoutVar.work1 = 'Ходьба (прогулка)';
    workoutVar.work2 = '60 минут';

    workoutVar.work_1 = '60 минут | 6 тыс. шагов';

    widget.goTR.goToRoute(AllRoutes.workout_cardio);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Health App',
          style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontSize: 32,
              fontStyle: FontStyle.italic),
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
              }, splashRadius: 1,
              icon: Icon(Icons.pending_actions_rounded),
            color: Colors.blueGrey,
          )
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
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
                    WorkoutWidget('Бег', '30 минут 5 км. | 300 ккал', "assets/image/5.png", _onPressCardio),
                    WorkoutWidget('Ходьба', '60 минут или 6000 тыс. шагов | 300 ккал', "assets/image/workout_pages/walk.png", _onPressWalk),
                    WorkoutWidget('FullBody тренировка', '30 минут | 180 ккал', "assets/image/fullbody.png", _onPressFull),
                    WorkoutWidget('Силовая тренировка', '60 минут | 400 ккал', "assets/image/workout_pages/bic.png", _onPressStr),
                    WorkoutWidget('Гимнастика', '15 минут | 90 ккал', "assets/image/3.png", _onPressGym),
                    WorkoutWidget('Тренировка верха тела', '30 минут | 200 ккал', "assets/image/top_workout.png", _onPressTop),
                    WorkoutWidget('Тренировка низа тела', '30 минут | 200 ккал', "assets/image/Low_workout.png", _onPressLow),
                    //WorkoutWidget('Custom-тренировка', 'Описание Custom-тренировки', "assets/image/6.png", _onPressCustom),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomWidget(widget.goTR),
    );
  }
}