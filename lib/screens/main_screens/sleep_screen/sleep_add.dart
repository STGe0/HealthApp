import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:health_steshkin/models/sleep_records_model.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:health_steshkin/repository/user_repository/sleep_repository.dart';
import 'package:health_steshkin/services/controllers/profile_controller.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/controllers/sleep_controller.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AddSleepScreen extends StatefulWidget {
  final globalVar goTR;
  const AddSleepScreen(this.goTR, {super.key});

  @override
  State<AddSleepScreen> createState() => _AddSleepScreenState();
}

class _AddSleepScreenState extends State<AddSleepScreen> {
  final user = FirebaseAuth.instance.currentUser;
  TimeOfDay time = TimeOfDay(hour: 08, minute: 00);

  @override
  Widget build(BuildContext context) {
    String day_date = DateFormat.EEEE().format(DateTime.now());
      switch(day_date){
        case 'Monday':
          setState(() {
            day_date = 'Понедельник';
          });
          break;
        case 'Tuesday':
          setState(() {
            day_date = 'Вторник';
          });
          break;
        case 'Wednesday':
          setState(() {
            day_date = 'Среда';
          });
          break;
        case 'Thursday':
          setState(() {
            day_date = 'Четверг';
          });
          break;
        case 'Friday':
          setState(() {
            day_date = 'Пятница';
          });
          break;
        case 'Saturday':
          setState(() {
            day_date = 'Суббота';
          });
          break;
        case 'Sunday':
          setState(() {
            day_date = 'Воскресенье';
          });
          break;
      }
    String day_mounth = DateFormat.LLLL().format(DateTime.now());
    switch(day_mounth){
      case 'January':
        setState(() {
          day_mounth = 'Января';
        });
        break;
      case 'February':
        setState(() {
          day_mounth = 'Ферваля';
        });
        break;
      case 'March':
        setState(() {
          day_mounth = 'Марта';
        });
        break;
      case 'April':
        setState(() {
          day_mounth = 'Апреля';
        });
        break;
      case 'May':
        setState(() {
          day_mounth = 'Мая';
        });
        break;
      case 'June':
        setState(() {
          day_mounth = 'Июня';
        });
        break;
      case 'July':
        setState(() {
          day_mounth = 'Июля';
        });
        break;
      case 'August':
        setState(() {
          day_mounth = 'Августа';
        });
        break;
      case 'September':
        setState(() {
          day_mounth = 'Сентября';
        });
        break;
      case 'October':
        setState(() {
          day_mounth = 'Октября';
        });
        break;
      case 'November':
        setState(() {
          day_mounth = 'Ноября';
        });
        break;
      case 'December':
        setState(() {
          day_mounth = 'Декабря';
        });
        break;
    }
    final controller = Get.put(SleepController());
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final controllerUser = Get.put(ProfileController());
    String status = 'Нормально';
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Добавить запись',
          style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                splashRadius: 24,
                onPressed: () {
                  widget.goTR.goToRoute(AllRoutes.sleep);
                },
                icon: Icon(LineAwesomeIcons.angle_left));
          },
        ),
      ),
      body: FutureBuilder(
        future: controllerUser.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;
              return Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Выберите количество часов и минут, которые вы провели сегодня во сне',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      '${hours}:${minutes}',
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: time,
                            //24-ех часовой формат ввода "часов"
                            builder: (context, child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: true),
                                child: child ?? Container(),
                              );
                            });
                        //Если пользователь нажмет кнопку "Cancel" - время останется прежним
                        if (newTime == null) return;
                        //Если пользователь нажмет кнопку "Ок" время изменится
                        setState(() {
                          time = newTime;
                        });
                      },
                      child: Text(
                        'Выбрать время',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.grey,
                        minimumSize: Size(250, 50),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        try {
                          if(int.parse(hours) <= 6){
                            setState(() {
                              status = 'Недостаток сна';
                            });
                          } else{
                            if(int.parse(hours) >= 10){
                              setState(() {
                                status = 'Продолжительность сна выше нормы';
                              });
                            }
                          }
                          final sleepRecord = SleepModel(
                              Email_user: userData.email.toString(),
                              Date_record: DateFormat.d().format(DateTime.now()).toString() + " " + day_mounth + ", " + day_date,
                              Duration: '${hours}:${minutes}',
                              Status: status,
                          );
                          final sleepRepo = Get.put(SleepRepository());
                          sleepRepo.createSleepRecord(sleepRecord);

                          widget.goTR.goToRoute(AllRoutes.sleep);
                        } catch (e) {}
                      },
                      child: Text(
                        'Добавить',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.blueGrey,
                        minimumSize: Size(150, 50),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else
              return Center(
                child: Text('Неизвестная ошибка, обратитесь в поддержку'),
              );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
