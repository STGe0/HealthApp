import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:health_steshkin/custom_widgets/bottom_bar.dart';
import 'package:health_steshkin/models/sleep_records_model.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/controllers/sleep_controller.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SleepScreen extends StatefulWidget {
  final globalVar goTR;
  const SleepScreen(this.goTR, {super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  final user = FirebaseAuth.instance.currentUser;

  DateTime _value = DateTime.now();
  DateTime today = DateTime.now();

  bool isButtonEnabled = false;

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
  String title = 'Нет записи';
  String time_rec = '';
  String status_rec = '';
  dynamic id = '123';

  void forFunc(String date, String dur, String status) {
    if (date == _dateFormatter(_value)) {
      title = date;
      time_rec = dur;
      status_rec = status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SleepController());
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
          builder: (BuildContext context) {
            return IconButton(
                splashRadius: 24,
                onPressed: () {
                  widget.goTR.goToRoute(AllRoutes.account);
                },
                icon: Icon(Icons.account_circle));
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.goTR.goToRoute(AllRoutes.sleep_add);
              }, splashRadius: 24, icon: Icon(Icons.add_alarm))
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: controller.getAllSleepRecords(),
            builder: (context, snapshotSleep) {
              if(snapshotSleep.connectionState == ConnectionState.done){
                if(snapshotSleep.data!.length > 0 && snapshotSleep.hasData){
                  for(int i = 0; i < snapshotSleep.data!.length; i++){
                    title = 'Нет записи';
                    time_rec = '-';
                    status_rec = '-';
                    if (snapshotSleep.data![i].Date_record.toString() == _dateFormatter(_value)) {
                      SleepModel sleepData = snapshotSleep.data![i];
                      id = TextEditingController(text: sleepData.id);
                      title = snapshotSleep.data![i].Date_record.toString();
                      time_rec = snapshotSleep.data![i].Duration.toString();
                      status_rec = snapshotSleep.data![i].Status.toString();
                      isButtonEnabled = true;
                      i = snapshotSleep.data!.length;
                    } else{
                      isButtonEnabled = false;
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 24, right: 24),
                    child: Column(
                      children: [
                        Text('Сон',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.white,
                              fontSize: 44,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15,
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
                                });
                                for(int i = 0; i < snapshotSleep.data!.length; i++){
                                  title = 'Нет записи';
                                  time_rec = '-';
                                  status_rec = '-';
                                  if (snapshotSleep.data![i].Date_record.toString() == _dateFormatter(_value)) {
                                    SleepModel sleepData = snapshotSleep.data![i];
                                    id = TextEditingController(text: sleepData.id);
                                    title = snapshotSleep.data![i].Date_record.toString();
                                    time_rec = snapshotSleep.data![i].Duration.toString();
                                    status_rec = snapshotSleep.data![i].Status.toString();
                                    isButtonEnabled = true;
                                    i = snapshotSleep.data!.length;
                                  } else{
                                    isButtonEnabled = false;
                                  }
                                }
                              },
                            ),
                            TextButton(
                              onPressed: (){
                              },
                              child: Text(_dateFormatter(_value),
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold
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
                                  });
                                }
                                for(int i = 0; i < snapshotSleep.data!.length; i++){
                                  title = 'Нет записи';
                                  time_rec = '-';
                                  status_rec = '-';
                                  if (snapshotSleep.data![i].Date_record.toString() == _dateFormatter(_value)) {
                                    SleepModel sleepData = snapshotSleep.data![i];
                                    id = TextEditingController(text: sleepData.id);
                                    title = snapshotSleep.data![i].Date_record.toString();
                                    time_rec = snapshotSleep.data![i].Duration.toString();
                                    status_rec = snapshotSleep.data![i].Status.toString();
                                    isButtonEnabled = true;
                                    i = snapshotSleep.data!.length;
                                  } else{
                                    isButtonEnabled = false;
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                          ),
                          iconColor: Colors.white,
                          tileColor: Colors.grey.shade600,
                          leading: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const[
                                SizedBox(height: 8,),
                                Icon(LineAwesomeIcons.clock, size: 42,),
                              ],
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${title}',
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              IconButton(
                                  onPressed: isButtonEnabled ? () {
                                    final sleepMod = SleepModel(
                                      id: id.text.toString(),
                                      Email_user: null,
                                      Date_record: null,
                                      Duration: null,
                                      Status: null,
                                    );
                                    showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.blueGrey,
                                            title: Text(
                                              'Удаления записи',
                                              style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            content: const Text(
                                              'Вы точно хотите удалить запись?',
                                              style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () async {
                                                  try{
                                                    controller.deleteSleep(sleepMod);
                                                    Navigator.of(context).pop();
                                                    setState(() {

                                                    });
                                                  }
                                                  catch(e){
                                                  }
                                                },
                                                child: Text(
                                                  'Да',
                                                  style: TextStyle(
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black12,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Отменить',
                                                  style: TextStyle(
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black12,
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  } : null,
                                  icon: Icon(LineAwesomeIcons.window_close),
                                splashRadius: 24,
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${time_rec}",
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text("${status_rec}",
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else{
                  return Padding(
                    padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Center(
                      child: Column(
                        children: [
                          Text('Сон',
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 44,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Text('Нет записей',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.white,
                              fontSize: 44,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 35,),
                          Text('Нажмите на кнопку "+" в верхней части экрана, чтобы добавить новую запись',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center
                          ),
                        ],
                      ),
                    ),
                  );
                }
              } else{
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              }
            }
        ),
      ),
      bottomNavigationBar: BottomWidget(widget.goTR),
    );
  }
}
