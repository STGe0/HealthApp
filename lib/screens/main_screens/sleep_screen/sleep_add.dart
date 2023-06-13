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

  DateTime _value = DateTime.now();
  DateTime today = DateTime.now();

  Future _selectDate() async{
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _value,
      firstDate: new DateTime(2023),
      lastDate: new DateTime.now(),
    );
    if(picked != null){
      setState(() {
        _value = picked;
      });
    }
  }

  String _dateFormatter(DateTime tm){
    DateTime today = new DateTime.now();
    Duration oneDay = new Duration(days: 1);
    Duration twoDay = new Duration(days: 2);
    late String month;

    switch(tm.month){
      case 1:
        month = 'Января';
        break;
      case 2:
        month = 'Ферваля';
        break;
      case 3:
        month = 'Марта';
        break;
      case 4:
        month = 'Апреля';
        break;
      case 5:
        month = 'Мая';
        break;
      case 6:
        month = 'Июня';
        break;
      case 7:
        month = 'Июля';
        break;
      case 8:
        month = 'Августа';
        break;
      case 9:
        month = 'Сентября';
        break;
      case 10:
        month = 'Октября';
        break;
      case 11:
        month = 'Ноября';
        break;
      case 12:
        month = 'Декабря';
        break;
    }
    Duration difference = today.difference(tm);

    return "${tm.day} $month ${tm.year}";
  }

  @override
  Widget build(BuildContext context) {
    String day_month = DateFormat.LLLL().format(DateTime.now());
    switch(day_month){
      case 'January':
        setState(() {
          day_month = 'Января';
        });
        break;
      case 'February':
        setState(() {
          day_month = 'Ферваля';
        });
        break;
      case 'March':
        setState(() {
          day_month = 'Марта';
        });
        break;
      case 'April':
        setState(() {
          day_month = 'Апреля';
        });
        break;
      case 'May':
        setState(() {
          day_month = 'Мая';
        });
        break;
      case 'June':
        setState(() {
          day_month = 'Июня';
        });
        break;
      case 'July':
        setState(() {
          day_month = 'Июля';
        });
        break;
      case 'August':
        setState(() {
          day_month = 'Августа';
        });
        break;
      case 'September':
        setState(() {
          day_month = 'Сентября';
        });
        break;
      case 'October':
        setState(() {
          day_month = 'Октября';
        });
        break;
      case 'November':
        setState(() {
          day_month = 'Ноября';
        });
        break;
      case 'December':
        setState(() {
          day_month = 'Декабря';
        });
        break;
    }
    final controller = Get.put(SleepController());
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final controllerUser = Get.put(ProfileController());
    String status = 'Нормально';
    String id = '0';
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
      body: SingleChildScrollView(
        child: FutureBuilder(
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
                        'Выберите дату и количество часов:минут, которые вы провели во сне',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 28,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_left, size: 25,),
                            color: Colors.white,
                            onPressed: (){
                              setState(() {
                                _value = _value.subtract(Duration(days: 1));
                                foodPageCal.valueS = _value;
                              });
                            },
                          ),
                          TextButton(
                            onPressed: (){
                            },
                            child: Text(_dateFormatter(_value),
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 28,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_right, size: 25,),
                            color: Colors.white,
                            onPressed: (){
                              if(today.difference(_value).compareTo(Duration(days: 1)) == -1){
                              } else {
                                setState(() {
                                  _value = _value.add(Duration(days: 1));
                                  foodPageCal.valueS = _value;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        '${hours}:${minutes}',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: Colors.white,
                          fontSize: 54,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
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
                              fontFamily: 'Ubuntu',
                              color: Colors.white,
                              fontSize: 22,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold
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
                      FutureBuilder(
                      future: controller.getAllSleepRecordsS(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if(snapshot.data!.isEmpty) {
                        return ElevatedButton(
                          onPressed: () {
                            try {
                              if (int.parse(hours) <= 6) {
                                setState(() {
                                  status = 'Недостаток сна';
                                });
                              } else {
                                if (int.parse(hours) >= 10) {
                                  setState(() {
                                    status = 'Выше нормы';
                                  });
                                }
                              }
                              final sleepRecord = SleepModel(
                                Email_user: userData.email.toString(),
                                Date_record: _dateFormatter(_value),
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
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 22,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.blueGrey,
                            minimumSize: Size(150, 50),
                          ),
                        );
                      } else{
                            id = snapshot.data![0].id.toString();
                            return ElevatedButton(
                              onPressed: () {
                                try {
                                  if (int.parse(hours) <= 6) {
                                    setState(() {
                                      status = 'Недостаток сна';
                                    });
                                  } else {
                                    if (int.parse(hours) >= 10) {
                                      setState(() {
                                        status = 'Выше нормы';
                                      });
                                    }
                                  }
                                  final sleepRecord = SleepModel(
                                    Email_user: userData.email.toString(),
                                    Date_record: _dateFormatter(_value),
                                    Duration: '${hours}:${minutes}',
                                    Status: status,
                                  );
                                  final sleepRepo = Get.put(SleepRepository());
                                  sleepRepo.updateSleepRecord(sleepRecord, id);

                                  widget.goTR.goToRoute(AllRoutes.sleep);
                                } catch (e) {}
                              },
                              child: Text(
                                'Добавить',
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.blueGrey,
                                minimumSize: Size(150, 50),
                              ),
                            );
                          }
                        } else{
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                CircularProgressIndicator(),
                              ],
                            ),
                          );
                        }
                      }
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
      ),
    );
  }
}
