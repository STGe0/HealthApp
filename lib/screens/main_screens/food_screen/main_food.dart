import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/custom_widgets/bottom_bar.dart';
import 'package:health_steshkin/models/cal_b_model.dart';
import 'package:health_steshkin/models/cal_o_model.dart';
import 'package:health_steshkin/models/cal_p_model.dart';
import 'package:health_steshkin/models/cal_u_model.dart';
import 'package:health_steshkin/models/f_model.dart';
import 'package:health_steshkin/models/pfc_value_model.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:health_steshkin/repository/user_repository/f_rep.dart';
import 'package:health_steshkin/services/controllers/f_controller.dart';
import 'package:health_steshkin/services/controllers/food_controller.dart';
import 'package:health_steshkin/services/controllers/profile_controller.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:fl_chart/fl_chart.dart';

class FoodScreen extends StatefulWidget {
  final globalVar goTR;

  const FoodScreen(this.goTR, {super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final controller = Get.put(ProfileController());
  DateTime _value = foodPageCal.valueF;
  String id = '0';
  int le = 0;
  int le_PFC = 0;

  String? id_b = '0';
  String? id_o = '0';
  String? id_u = '0';
  String? id_p = '0';
  String? id_pfc = '0';
  String? cal_break = '0';
  String? cal_o = '0';
  String? cal_u = '0';
  String? cal_p = '0';
  String? prot_value = '0';
  String? carb_value = '0';
  String? fats_value = '0';
  String? calories_value = '0';

  String prot_nan = '0';
  String fats_nan = '0';
  String carb_nan = '0';

  final controllerF = Get.put(FController());
  final controllerFoodB = Get.put(FoodController());

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
  String title = 'Нет записи';
  String time_rec = '';
  String status_rec = '';

  void forFunc(String date, String dur, String status) {
    if (date == _dateFormatter(_value)) {
      title = date;
      time_rec = dur;
      status_rec = status;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {

    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Health App',
          style: TextStyle(fontFamily: 'Rubik', color: Colors.white, fontSize: 32, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              splashRadius: 24,
              onPressed: () {
                widget.goTR.goToRoute(AllRoutes.account);
              },
              icon: Icon(Icons.account_circle),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 1,
            icon: Icon(Icons.food_bank_outlined),
            color: Colors.blueGrey,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Питание',
                            style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 34, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                  foodPageCal.valueF = _value;
                                  foodPageCal.blbl = true;
                                  id = '1000';
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
                                    foodPageCal.valueF = _value;
                                    foodPageCal.blbl = true;
                                    id = '1000';
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Норма Калорий',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                userData.calorie.toString(),
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Употреблено Калорий',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              FutureBuilder(
                                  future: controllerFoodB.getAllRecordsPFC(id),
                                  builder: (context, snapshotS) {
                                    if (snapshotS.connectionState == ConnectionState.done) {
                                      if (snapshotS.hasData) {
                                        return Text(
                                          snapshotS.data!.calories_value.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          textAlign: TextAlign.center,
                                        );
                                      } else {
                                        return Text(
                                          '0.0',
                                          style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          textAlign: TextAlign.center,
                                        );
                                      }
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(color: Colors.grey.shade600, borderRadius: BorderRadius.circular(15), boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: AssetImage(
                                    'assets/image/food_page/sunrise.png',
                                  ),
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Завтрак',
                                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 3,
                                  )),
                              Column(
                                children: [
                                  FutureBuilder(
                                      future: controllerFoodB.getAllCalRecordsB(id),
                                      builder: (context, snapshotS) {
                                        if (snapshotS.connectionState == ConnectionState.done) {
                                          if (snapshotS.hasData) {
                                            return Text(
                                              snapshotS.data!.cal_b.toString(),
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            );
                                          } else {
                                            return Text(
                                              '0.0',
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            );
                                          }
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      }),
                                  Text(
                                    'Калории',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              FutureBuilder(
                                  future: controllerF.getAllFRecords(),
                                  builder: (context, snapshotS) {
                                    if (snapshotS.connectionState == ConnectionState.done) {
                                      if (snapshotS.data!.length > 0 && snapshotS.hasData) {
                                        return IconButton(
                                          onPressed: () {
                                            userEmail.emailUs = userData.email.toString();

                                            widget.goTR.goToRoute(AllRoutes.add_food);
                                          },
                                          splashRadius: 16,
                                          icon: Icon(LineAwesomeIcons.add_to_shopping_cart),
                                          color: Colors.white,
                                        );
                                      } else {
                                        return IconButton(
                                          onPressed: () {
                                            userEmail.emailUs = userData.email.toString();
                                            final fRecord = FModel(
                                              email: userEmail.emailUs,
                                              date_record: _dateFormatter(_value),
                                            );
                                            final fRepo = Get.put(FRep());
                                            fRepo.createFRecord(fRecord);
                                            widget.goTR.goToRoute(AllRoutes.add_food);
                                          },
                                          splashRadius: 16,
                                          icon: Icon(LineAwesomeIcons.add_to_shopping_cart),
                                          color: Colors.white,
                                        );
                                      }
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                        FutureBuilder(
                            future: controllerF.getAllFRecords(),
                            builder: (context, snapshotAll) {
                              try {
                                id = snapshotAll.data![0].id!;
                              } catch (e) {}
                              le = snapshotAll.data?.length ?? 0;
                              if(le > 0){
                              return FutureBuilder(
                                  future: controllerFoodB.getAllFoodRecords(id.toString()),
                                  builder: (context, snapshotB) {
                                    if (snapshotB.connectionState == ConnectionState.done) {
                                      if (snapshotB.data!.length > 0 && snapshotB.hasData) {
                                        return SizedBox(
                                          height: 120 * double.parse(snapshotB.data!.length.toString()),
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.only(left: 25, right: 25),
                                            itemCount: snapshotB.data!.length,
                                            separatorBuilder: (BuildContext context, int index) => Divider(
                                              color: Colors.white,
                                            ),
                                            itemBuilder: (BuildContext context, int index) {
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      FutureBuilder(
                                                        future: controllerFoodB.getAllCalRecordsB(id),
                                                        builder: (context, snapshotS) {
                                                         if (snapshotB.data!.length > 1) {
                                                           try{
                                                           id_b = snapshotS.data!.id;
                                                           cal_break = snapshotS.data!.cal_b.toString();
                                                           } catch(e){
                                                           }
                                                          return FutureBuilder(
                                                          future: controllerFoodB.getAllRecordsPFC(id),
                                                          builder: (context, snapshotPFC) {
                                                            if (snapshotPFC.connectionState == ConnectionState.done) {
                                                              if(snapshotPFC.hasData){
                                                                try{
                                                                  id_pfc = snapshotPFC.data!.id;
                                                                  prot_value = snapshotPFC.data!.protein_value.toString();
                                                                  fats_value = snapshotPFC.data!.fats_value.toString();
                                                                  carb_value = snapshotPFC.data!.carb_value.toString();
                                                                  calories_value = snapshotPFC.data!.calories_value.toString();
                                                                } catch(e){
                                                                }
                                                              return SizedBox(
                                                              height: 35,
                                                              width: 35,
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  showDialog<void>(
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return AlertDialog(
                                                                          backgroundColor: Colors.blueGrey,
                                                                          title: Text(
                                                                            'Удаление записи',
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
                                                                                try {
                                                                                  final foodCal = CalModelB(
                                                                                    cal_b: (double.parse(cal_break!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                  );
                                                                                  final foodPCF = ModelPFC(
                                                                                    protein_value: (double.parse(prot_value!) - (double.parse(snapshotB.data![index].protein.toString()))).toStringAsFixed(1),
                                                                                    fats_value: (double.parse(fats_value!) - (double.parse(snapshotB.data![index].fats.toString()))).toStringAsFixed(1),
                                                                                    carb_value: (double.parse(carb_value!) - (double.parse(snapshotB.data![index].carb.toString()))).toStringAsFixed(1),
                                                                                    calories_value: (double.parse(calories_value!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                  );
                                                                                  await controllerFoodB.updateCalB(foodCal, id, id_b.toString());
                                                                                  controllerFoodB.deleteFoodB(snapshotB.data![index].id.toString(), id.toString());
                                                                                  controllerFoodB.updatePFC(foodPCF, id.toString(), id_pfc.toString());
                                                                                  Navigator.of(context).pop();
                                                                                  setState(() {
                                                                                    foodPageCal.blbl = true;
                                                                                  });
                                                                                }
                                                                                catch (e) {}
                                                                              },
                                                                              child: Text(
                                                                                'Да',
                                                                                style: TextStyle(
                                                                                    fontFamily: 'Ubuntu',
                                                                                    color: Colors.white,
                                                                                    fontSize: 22,
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
                                                                                    fontSize: 22,
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
                                                                },
                                                                icon: Icon(LineAwesomeIcons.minus_circle),
                                                                color: Colors.red,
                                                                splashRadius: 16,
                                                              ),
                                                            );
                                                          } else{
                                                                return Center(child: Text('Ошибка!'),);
                                                              }
                                                            }
                                                            else{
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
                                                            }});
                                                        } else{
                                                           try{
                                                             id_b = snapshotS.data!.id;
                                                             cal_break = snapshotS.data!.cal_b.toString();
                                                           } catch(e){
                                                           }
                                                           return FutureBuilder(
                                                               future: controllerFoodB.getAllRecordsPFC(id),
                                                               builder: (context, snapshotPFC) {
                                                                 if (snapshotPFC.connectionState == ConnectionState.done) {
                                                                   if(snapshotPFC.hasData){
                                                                     try{
                                                                       id_pfc = snapshotPFC.data!.id;
                                                                       prot_value = snapshotPFC.data!.protein_value.toString();
                                                                       fats_value = snapshotPFC.data!.fats_value.toString();
                                                                       carb_value = snapshotPFC.data!.carb_value.toString();
                                                                       calories_value = snapshotPFC.data!.calories_value.toString();
                                                                     } catch(e){
                                                                     }
                                                                     return SizedBox(
                                                                       height: 35,
                                                                       width: 35,
                                                                       child: IconButton(
                                                                         onPressed: () {
                                                                           showDialog<void>(
                                                                               context: context,
                                                                               builder: (BuildContext context) {
                                                                                 return AlertDialog(
                                                                                   backgroundColor: Colors.blueGrey,
                                                                                   title: Text(
                                                                                     'Удаление записи',
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
                                                                                         try {
                                                                                           final foodCal = CalModelB(
                                                                                             cal_b: (double.parse(cal_break!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                           );
                                                                                           final foodPCF = ModelPFC(
                                                                                             protein_value: (double.parse(prot_value!) - (double.parse(snapshotB.data![index].protein.toString()))).toStringAsFixed(1),
                                                                                             fats_value: (double.parse(fats_value!) - (double.parse(snapshotB.data![index].fats.toString()))).toStringAsFixed(1),
                                                                                             carb_value: (double.parse(carb_value!) - (double.parse(snapshotB.data![index].carb.toString()))).toStringAsFixed(1),
                                                                                             calories_value: (double.parse(calories_value!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                           );
                                                                                           await controllerFoodB.updateCalB(foodCal, id, id_b.toString());
                                                                                           controllerFoodB.deleteFoodB(snapshotB.data![index].id.toString(), id.toString());
                                                                                           controllerFoodB.updatePFC(foodPCF, id.toString(), id_pfc.toString());
                                                                                           Navigator.of(context).pop();
                                                                                           setState(() {
                                                                                             foodPageCal.blbl = true;
                                                                                           });
                                                                                         }
                                                                                         catch (e) {}
                                                                                       },
                                                                                       child: Text(
                                                                                         'Да',
                                                                                         style: TextStyle(
                                                                                             fontFamily: 'Ubuntu',
                                                                                             color: Colors.white,
                                                                                             fontSize: 22,
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
                                                                                             fontSize: 22,
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
                                                                         },
                                                                         icon: Icon(LineAwesomeIcons.minus_circle),
                                                                         color: Colors.red,
                                                                         splashRadius: 16,
                                                                       ),
                                                                     );
                                                                   } else{
                                                                     return Center(child: Text('Ошибка!'),);
                                                                   }
                                                                 }
                                                                 else{
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
                                                                 }});
                                                         }}),
                                                    ],
                                                  ),
                                                  Divider(color: Colors.blueGrey,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshotB.data![index].name_product.toString(),
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].protein.toString() + "Б",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].fats.toString() + "Ж",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].carb.toString() + "У",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshotB.data![index].weight_product.toString() + ' г.',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].calorie.toString() + ' Ккал',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        if (snapshotB.hasError) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        return SizedBox(
                                          height: 5,
                                        );
                                      }
                                    } else {
                                      return SizedBox(
                                        height: 5,
                                      );
                                    }
                                  });} else{
                                return SizedBox(height: 1,);
                              }
                            }),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(color: Colors.grey.shade600, borderRadius: BorderRadius.circular(15), boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: AssetImage(
                                    'assets/image/food_page/sun.png',
                                  ),
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Обед',
                                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 3,
                                  )),
                              Column(
                                children: [
                                  FutureBuilder(
                                      future: controllerFoodB.getAllCalRecordsO(id),
                                      builder: (context, snapshotS) {
                                        if (snapshotS.connectionState == ConnectionState.done) {
                                          if (snapshotS.hasData) {
                                            return Text(
                                              snapshotS.data!.cal_o.toString(),
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            );
                                          } else {
                                            return Text(
                                              '0.0',
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            );
                                          }
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      }),
                                  Text(
                                    'Калории',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              FutureBuilder(
                                  future: controllerF.getAllFRecords(),
                                  builder: (context, snapshotS) {
                                    if (snapshotS.connectionState == ConnectionState.done) {
                                      if (snapshotS.data!.length > 0 && snapshotS.hasData) {
                                        return IconButton(
                                          onPressed: () {
                                            userEmail.emailUs = userData.email.toString();

                                            widget.goTR.goToRoute(AllRoutes.add_o);
                                          },
                                          splashRadius: 16,
                                          icon: Icon(LineAwesomeIcons.add_to_shopping_cart),
                                          color: Colors.white,
                                        );
                                      } else {
                                        return IconButton(
                                          onPressed: () {
                                            userEmail.emailUs = userData.email.toString();
                                            final fRecord = FModel(
                                              email: userEmail.emailUs,
                                              date_record: _dateFormatter(_value),
                                            );
                                            final fRepo = Get.put(FRep());
                                            fRepo.createFRecord(fRecord);
                                            widget.goTR.goToRoute(AllRoutes.add_o);
                                          },
                                          splashRadius: 16,
                                          icon: Icon(LineAwesomeIcons.add_to_shopping_cart),
                                          color: Colors.white,
                                        );
                                      }
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                        FutureBuilder(
                            future: controllerF.getAllFRecords(),
                            builder: (context, snapshotAll) {
                              try {
                                foodPageCal.PageCal_o = 0;
                                id = snapshotAll.data![0].id!;
                              } catch (e) {}
                              return FutureBuilder(
                                  future: controllerFoodB.getAllFoodRecordsO(id.toString()),
                                  builder: (context, snapshotB) {
                                    if (snapshotB.connectionState == ConnectionState.done) {
                                      if (snapshotB.data!.length > 0 && snapshotB.hasData) {
                                        return SizedBox(
                                          height: 120 * double.parse(snapshotB.data!.length.toString()),
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.only(left: 25, right: 25),
                                            itemCount: snapshotB.data!.length,
                                            separatorBuilder: (BuildContext context, int index) => Divider(
                                              color: Colors.white,
                                            ),
                                            itemBuilder: (BuildContext context, int index) {
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      FutureBuilder(
                                                          future: controllerFoodB.getAllCalRecordsO(id),
                                                          builder: (context, snapshotS) {
                                                            if (snapshotB.data!.length > 1) {
                                                              try{
                                                                cal_o = snapshotS.data!.cal_o.toString();
                                                                id_o = snapshotS.data!.id;
                                                              } catch(e){
                                                              }
                                                              return FutureBuilder(
                                                                  future: controllerFoodB.getAllRecordsPFC(id),
                                                                  builder: (context, snapshotPFC) {
                                                                    if (snapshotPFC.connectionState == ConnectionState.done) {
                                                                      if(snapshotPFC.hasData){
                                                                        try{
                                                                          id_pfc = snapshotPFC.data!.id;
                                                                          prot_value = snapshotPFC.data!.protein_value.toString();
                                                                          fats_value = snapshotPFC.data!.fats_value.toString();
                                                                          carb_value = snapshotPFC.data!.carb_value.toString();
                                                                          calories_value = snapshotPFC.data!.calories_value.toString();
                                                                        } catch(e){
                                                                        }
                                                                        return SizedBox(
                                                                          height: 35,
                                                                          width: 35,
                                                                          child: IconButton(
                                                                            onPressed: () {
                                                                              showDialog<void>(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      backgroundColor: Colors.blueGrey,
                                                                                      title: Text(
                                                                                        'Удаление записи',
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
                                                                                            try {
                                                                                              final foodCal = CalModelO(
                                                                                                cal_o: (double.parse(cal_o!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              final foodPCF = ModelPFC(
                                                                                                protein_value: (double.parse(prot_value!) - (double.parse(snapshotB.data![index].protein.toString()))).toStringAsFixed(1),
                                                                                                fats_value: (double.parse(fats_value!) - (double.parse(snapshotB.data![index].fats.toString()))).toStringAsFixed(1),
                                                                                                carb_value: (double.parse(carb_value!) - (double.parse(snapshotB.data![index].carb.toString()))).toStringAsFixed(1),
                                                                                                calories_value: (double.parse(calories_value!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              await controllerFoodB.updateCalO(foodCal, id, id_o.toString());
                                                                                              controllerFoodB.deleteFoodO(snapshotB.data![index].id.toString(), id.toString());
                                                                                              controllerFoodB.updatePFC(foodPCF, id.toString(), id_pfc.toString());
                                                                                              Navigator.of(context).pop();
                                                                                              setState(() {
                                                                                                foodPageCal.blbl = true;
                                                                                              });
                                                                                            }
                                                                                            catch (e) {}
                                                                                          },
                                                                                          child: Text(
                                                                                            'Да',
                                                                                            style: TextStyle(
                                                                                                fontFamily: 'Ubuntu',
                                                                                                color: Colors.white,
                                                                                                fontSize: 22,
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
                                                                                                fontSize: 22,
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
                                                                            },
                                                                            icon: Icon(LineAwesomeIcons.minus_circle),
                                                                            color: Colors.red,
                                                                            splashRadius: 16,
                                                                          ),
                                                                        );
                                                                      } else{
                                                                        return Center(child: Text('Ошибка!'),);
                                                                      }
                                                                    }
                                                                    else{
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
                                                                    }});
                                                            } else{
                                                              try{
                                                                cal_o = snapshotS.data!.cal_o.toString();
                                                                id_o = snapshotS.data!.id;
                                                              } catch(e){
                                                              }
                                                              return FutureBuilder(
                                                                  future: controllerFoodB.getAllRecordsPFC(id),
                                                                  builder: (context, snapshotPFC) {
                                                                    if (snapshotPFC.connectionState == ConnectionState.done) {
                                                                      if(snapshotPFC.hasData){
                                                                        try{
                                                                          id_pfc = snapshotPFC.data!.id;
                                                                          prot_value = snapshotPFC.data!.protein_value.toString();
                                                                          fats_value = snapshotPFC.data!.fats_value.toString();
                                                                          carb_value = snapshotPFC.data!.carb_value.toString();
                                                                          calories_value = snapshotPFC.data!.calories_value.toString();
                                                                        } catch(e){
                                                                        }
                                                                        return SizedBox(
                                                                          height: 35,
                                                                          width: 35,
                                                                          child: IconButton(
                                                                            onPressed: () {
                                                                              showDialog<void>(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      backgroundColor: Colors.blueGrey,
                                                                                      title: Text(
                                                                                        'Удаление записи',
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
                                                                                            try {
                                                                                              final foodCal = CalModelO(
                                                                                                cal_o: (double.parse(cal_o!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              final foodPCF = ModelPFC(
                                                                                                protein_value: (double.parse(prot_value!) - (double.parse(snapshotB.data![index].protein.toString()))).toStringAsFixed(1),
                                                                                                fats_value: (double.parse(fats_value!) - (double.parse(snapshotB.data![index].fats.toString()))).toStringAsFixed(1),
                                                                                                carb_value: (double.parse(carb_value!) - (double.parse(snapshotB.data![index].carb.toString()))).toStringAsFixed(1),
                                                                                                calories_value: (double.parse(calories_value!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              await controllerFoodB.updateCalO(foodCal, id, id_o.toString());
                                                                                              controllerFoodB.deleteFoodO(snapshotB.data![index].id.toString(), id.toString());
                                                                                              controllerFoodB.updatePFC(foodPCF, id.toString(), id_pfc.toString());
                                                                                              Navigator.of(context).pop();
                                                                                              setState(() {
                                                                                                foodPageCal.blbl = true;
                                                                                              });
                                                                                            }
                                                                                            catch (e) {}
                                                                                          },
                                                                                          child: Text(
                                                                                            'Да',
                                                                                            style: TextStyle(
                                                                                                fontFamily: 'Ubuntu',
                                                                                                color: Colors.white,
                                                                                                fontSize: 22,
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
                                                                                                fontSize: 22,
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
                                                                            },
                                                                            icon: Icon(LineAwesomeIcons.minus_circle),
                                                                            color: Colors.red,
                                                                            splashRadius: 16,
                                                                          ),
                                                                        );
                                                                      } else{
                                                                        return Center(child: Text('Ошибка!'),);
                                                                      }
                                                                    }
                                                                    else{
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
                                                                    }});
                                                            }}),
                                                    ],
                                                  ),
                                                  Divider(color: Colors.blueGrey,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshotB.data![index].name_product.toString(),
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].protein.toString() + "Б",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].fats.toString() + "Ж",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].carb.toString() + "У",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshotB.data![index].weight_product.toString() + ' г.',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].calorie.toString() + ' Ккал',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        if (snapshotB.hasError) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        return SizedBox(
                                          height: 5,
                                        );
                                      }
                                    } else {
                                      return SizedBox(
                                        height: 5,
                                      );
                                    }
                                  });
                            }),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(color: Colors.grey.shade600, borderRadius: BorderRadius.circular(15), boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: AssetImage(
                                    'assets/image/food_page/uj.png',
                                  ),
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Ужин',
                                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 3,
                                  )),
                              Column(
                                children: [
                                  FutureBuilder(
                                      future: controllerFoodB.getAllCalRecordsU(id),
                                      builder: (context, snapshotS) {
                                        if (snapshotS.connectionState == ConnectionState.done) {
                                          if (snapshotS.hasData) {
                                            return Text(
                                              snapshotS.data!.cal_u.toString(),
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            );
                                          } else {
                                            return Text(
                                              '0.0',
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            );
                                          }
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      }),
                                  Text(
                                    'Калории',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              FutureBuilder(
                                  future: controllerF.getAllFRecords(),
                                  builder: (context, snapshotS) {
                                    if (snapshotS.connectionState == ConnectionState.done) {
                                      if (snapshotS.data!.length > 0 && snapshotS.hasData) {
                                        return IconButton(
                                          onPressed: () {
                                            userEmail.emailUs = userData.email.toString();

                                            widget.goTR.goToRoute(AllRoutes.add_u);
                                          },
                                          splashRadius: 16,
                                          icon: Icon(LineAwesomeIcons.add_to_shopping_cart),
                                          color: Colors.white,
                                        );
                                      } else {
                                        return IconButton(
                                          onPressed: () {
                                            userEmail.emailUs = userData.email.toString();
                                            final fRecord = FModel(
                                              email: userEmail.emailUs,
                                              date_record: _dateFormatter(_value),
                                            );
                                            final fRepo = Get.put(FRep());
                                            fRepo.createFRecord(fRecord);
                                            widget.goTR.goToRoute(AllRoutes.add_u);
                                          },
                                          splashRadius: 16,
                                          icon: Icon(LineAwesomeIcons.add_to_shopping_cart),
                                          color: Colors.white,
                                        );
                                      }
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                        FutureBuilder(
                            future: controllerF.getAllFRecords(),
                            builder: (context, snapshotAll) {
                              try {
                                foodPageCal.PageCal_u = 0;
                                id = snapshotAll.data![0].id!;
                              } catch (e) {}
                              return FutureBuilder(
                                  future: controllerFoodB.getAllFoodRecordsU(id.toString()),
                                  builder: (context, snapshotB) {
                                    if (snapshotB.connectionState == ConnectionState.done) {
                                      if (snapshotB.data!.length > 0 && snapshotB.hasData) {
                                        return SizedBox(
                                          height: 120 * double.parse(snapshotB.data!.length.toString()),
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.only(left: 25, right: 25),
                                            itemCount: snapshotB.data!.length,
                                            separatorBuilder: (BuildContext context, int index) => Divider(
                                              color: Colors.white,
                                            ),
                                            itemBuilder: (BuildContext context, int index) {
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      FutureBuilder(
                                                          future: controllerFoodB.getAllCalRecordsU(id),
                                                          builder: (context, snapshotS) {
                                                            if (snapshotB.data!.length > 1) {
                                                              try{
                                                                cal_u = snapshotS.data!.cal_u.toString();
                                                                id_u = snapshotS.data!.id;
                                                              } catch(e){
                                                              }
                                                              return FutureBuilder(
                                                                  future: controllerFoodB.getAllRecordsPFC(id),
                                                                  builder: (context, snapshotPFC) {
                                                                    if (snapshotPFC.connectionState == ConnectionState.done) {
                                                                      if(snapshotPFC.hasData){
                                                                        try{
                                                                          id_pfc = snapshotPFC.data!.id;
                                                                          prot_value = snapshotPFC.data!.protein_value.toString();
                                                                          fats_value = snapshotPFC.data!.fats_value.toString();
                                                                          carb_value = snapshotPFC.data!.carb_value.toString();
                                                                          calories_value = snapshotPFC.data!.calories_value.toString();
                                                                        } catch(e){
                                                                        }
                                                                        return SizedBox(
                                                                          height: 35,
                                                                          width: 35,
                                                                          child: IconButton(
                                                                            onPressed: () {
                                                                              showDialog<void>(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      backgroundColor: Colors.blueGrey,
                                                                                      title: Text(
                                                                                        'Удаление записи',
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
                                                                                            try {
                                                                                              final foodCal = CalModelU(
                                                                                                cal_u: (double.parse(cal_u!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              final foodPCF = ModelPFC(
                                                                                                protein_value: (double.parse(prot_value!) - (double.parse(snapshotB.data![index].protein.toString()))).toStringAsFixed(1),
                                                                                                fats_value: (double.parse(fats_value!) - (double.parse(snapshotB.data![index].fats.toString()))).toStringAsFixed(1),
                                                                                                carb_value: (double.parse(carb_value!) - (double.parse(snapshotB.data![index].carb.toString()))).toStringAsFixed(1),
                                                                                                calories_value: (double.parse(calories_value!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              await controllerFoodB.updateCalU(foodCal, id, id_u.toString());
                                                                                              controllerFoodB.deleteFoodU(snapshotB.data![index].id.toString(), id.toString());
                                                                                              controllerFoodB.updatePFC(foodPCF, id.toString(), id_pfc.toString());
                                                                                              Navigator.of(context).pop();
                                                                                              setState(() {
                                                                                                foodPageCal.blbl = true;
                                                                                              });
                                                                                            }
                                                                                            catch (e) {}
                                                                                          },
                                                                                          child: Text(
                                                                                            'Да',
                                                                                            style: TextStyle(
                                                                                                fontFamily: 'Ubuntu',
                                                                                                color: Colors.white,
                                                                                                fontSize: 22,
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
                                                                                                fontSize: 22,
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
                                                                            },
                                                                            icon: Icon(LineAwesomeIcons.minus_circle),
                                                                            color: Colors.red,
                                                                            splashRadius: 16,
                                                                          ),
                                                                        );
                                                                      } else{
                                                                        return Center(child: Text('Ошибка!'),);
                                                                      }
                                                                    }
                                                                    else{
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
                                                                    }});
                                                            } else{
                                                              try{
                                                                cal_u = snapshotS.data!.cal_u.toString();
                                                                id_u = snapshotS.data!.id;
                                                              } catch(e){
                                                              }
                                                              return FutureBuilder(
                                                                  future: controllerFoodB.getAllRecordsPFC(id),
                                                                  builder: (context, snapshotPFC) {
                                                                    if (snapshotPFC.connectionState == ConnectionState.done) {
                                                                      if(snapshotPFC.hasData){
                                                                        try{
                                                                          id_pfc = snapshotPFC.data!.id;
                                                                          prot_value = snapshotPFC.data!.protein_value.toString();
                                                                          fats_value = snapshotPFC.data!.fats_value.toString();
                                                                          carb_value = snapshotPFC.data!.carb_value.toString();
                                                                          calories_value = snapshotPFC.data!.calories_value.toString();
                                                                        } catch(e){
                                                                        }
                                                                        return SizedBox(
                                                                          height: 35,
                                                                          width: 35,
                                                                          child: IconButton(
                                                                            onPressed: () {
                                                                              showDialog<void>(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      backgroundColor: Colors.blueGrey,
                                                                                      title: Text(
                                                                                        'Удаление записи',
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
                                                                                            try {
                                                                                              cal_u = snapshotS.data!.cal_u.toString();
                                                                                              id_u = snapshotS.data!.id;
                                                                                              final foodCal = CalModelU(
                                                                                                cal_u: (double.parse(cal_u!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              final foodPCF = ModelPFC(
                                                                                                protein_value: (double.parse(prot_value!) - (double.parse(snapshotB.data![index].protein.toString()))).toStringAsFixed(1),
                                                                                                fats_value: (double.parse(fats_value!) - (double.parse(snapshotB.data![index].fats.toString()))).toStringAsFixed(1),
                                                                                                carb_value: (double.parse(carb_value!) - (double.parse(snapshotB.data![index].carb.toString()))).toStringAsFixed(1),
                                                                                                calories_value: (double.parse(calories_value!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              await controllerFoodB.updateCalU(foodCal, id, id_u.toString());
                                                                                              controllerFoodB.deleteFoodU(snapshotB.data![index].id.toString(), id.toString());
                                                                                              controllerFoodB.updatePFC(foodPCF, id.toString(), id_pfc.toString());
                                                                                              Navigator.of(context).pop();
                                                                                              setState(() {
                                                                                                foodPageCal.blbl = true;
                                                                                              });
                                                                                            }
                                                                                            catch (e) {}
                                                                                          },
                                                                                          child: Text(
                                                                                            'Да',
                                                                                            style: TextStyle(
                                                                                                fontFamily: 'Ubuntu',
                                                                                                color: Colors.white,
                                                                                                fontSize: 22,
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
                                                                                                fontSize: 22,
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
                                                                            },
                                                                            icon: Icon(LineAwesomeIcons.minus_circle),
                                                                            color: Colors.red,
                                                                            splashRadius: 16,
                                                                          ),
                                                                        );
                                                                      } else{
                                                                        return Center(child: Text('Ошибка!'),);
                                                                      }
                                                                    }
                                                                    else{
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
                                                                    }});
                                                            }}),
                                                    ],
                                                  ),
                                                  Divider(color: Colors.blueGrey,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshotB.data![index].name_product.toString(),
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].protein.toString() + "Б",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].fats.toString() + "Ж",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].carb.toString() + "У",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshotB.data![index].weight_product.toString() + ' г.',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].calorie.toString() + ' Ккал',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        if (snapshotB.hasError) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        return SizedBox(
                                          height: 5,
                                        );
                                      }
                                    } else {
                                      return SizedBox(
                                        height: 5,
                                      );
                                    }
                                  });
                            }),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(color: Colors.grey.shade600, borderRadius: BorderRadius.circular(15), boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: AssetImage(
                                    'assets/image/food_page/moon.png',
                                  ),
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Перекус',
                                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 3,
                                  )),
                              Column(
                                children: [
                                  FutureBuilder(
                                      future: controllerFoodB.getAllCalRecordsP(id),
                                      builder: (context, snapshotS) {
                                        if (snapshotS.connectionState == ConnectionState.done) {
                                          if (snapshotS.hasData) {
                                            return Text(
                                              snapshotS.data!.cal_p.toString(),
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            );
                                          } else {
                                            return Text(
                                              '0.0',
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            );
                                          }
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      }),
                                  Text(
                                    'Калории',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              FutureBuilder(
                                  future: controllerF.getAllFRecords(),
                                  builder: (context, snapshotS) {
                                    if (snapshotS.connectionState == ConnectionState.done) {
                                      if (snapshotS.data!.length > 0 && snapshotS.hasData) {
                                        return IconButton(
                                          onPressed: () {
                                            userEmail.emailUs = userData.email.toString();

                                            widget.goTR.goToRoute(AllRoutes.add_p);
                                          },
                                          splashRadius: 16,
                                          icon: Icon(LineAwesomeIcons.add_to_shopping_cart),
                                          color: Colors.white,
                                        );
                                      } else {
                                        return IconButton(
                                          onPressed: () {
                                            userEmail.emailUs = userData.email.toString();
                                            final fRecord = FModel(
                                              email: userEmail.emailUs,
                                              date_record: _dateFormatter(_value),
                                            );
                                            final fRepo = Get.put(FRep());
                                            fRepo.createFRecord(fRecord);
                                            widget.goTR.goToRoute(AllRoutes.add_p);
                                          },
                                          splashRadius: 16,
                                          icon: Icon(LineAwesomeIcons.add_to_shopping_cart),
                                          color: Colors.white,
                                        );
                                      }
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                        FutureBuilder(
                            future: controllerF.getAllFRecords(),
                            builder: (context, snapshotAll) {
                              try {
                                foodPageCal.PageCal_p = 0;
                                id = snapshotAll.data![0].id!;
                              } catch (e) {}
                              return FutureBuilder(
                                  future: controllerFoodB.getAllFoodRecordsP(id.toString()),
                                  builder: (context, snapshotB) {
                                    if (snapshotB.connectionState == ConnectionState.done) {
                                      if (snapshotB.hasData) {
                                        return SizedBox(
                                          height: 120 * double.parse(snapshotB.data!.length.toString()),
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.only(left: 25, right: 25),
                                            itemCount: snapshotB.data!.length,
                                            separatorBuilder: (BuildContext context, int index) => Divider(
                                              color: Colors.white,
                                            ),
                                            itemBuilder: (BuildContext context, int index) {
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      FutureBuilder(
                                                          future: controllerFoodB.getAllCalRecordsP(id),
                                                          builder: (context, snapshotS) {
                                                            if (snapshotB.data!.length > 1) {
                                                              try{
                                                                cal_p = snapshotS.data!.cal_p.toString();
                                                                id_p = snapshotS.data!.id;
                                                              } catch(e){
                                                              }
                                                              return FutureBuilder(
                                                                  future: controllerFoodB.getAllRecordsPFC(id),
                                                                  builder: (context, snapshotPFC) {
                                                                    if (snapshotPFC.connectionState == ConnectionState.done) {
                                                                      if(snapshotPFC.hasData){
                                                                        try{
                                                                          id_pfc = snapshotPFC.data!.id;
                                                                          prot_value = snapshotPFC.data!.protein_value.toString();
                                                                          fats_value = snapshotPFC.data!.fats_value.toString();
                                                                          carb_value = snapshotPFC.data!.carb_value.toString();
                                                                          calories_value = snapshotPFC.data!.calories_value.toString();
                                                                        } catch(e){
                                                                        }
                                                                        return SizedBox(
                                                                          height: 35,
                                                                          width: 35,
                                                                          child: IconButton(
                                                                            onPressed: () {
                                                                              showDialog<void>(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      backgroundColor: Colors.blueGrey,
                                                                                      title: Text(
                                                                                        'Удаление записи',
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
                                                                                            try {
                                                                                              final foodCal = CalModelP(
                                                                                                cal_p: (double.parse(cal_p!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              final foodPCF = ModelPFC(
                                                                                                protein_value: (double.parse(prot_value!) - (double.parse(snapshotB.data![index].protein.toString()))).toStringAsFixed(1),
                                                                                                fats_value: (double.parse(fats_value!) - (double.parse(snapshotB.data![index].fats.toString()))).toStringAsFixed(1),
                                                                                                carb_value: (double.parse(carb_value!) - (double.parse(snapshotB.data![index].carb.toString()))).toStringAsFixed(1),
                                                                                                calories_value: (double.parse(calories_value!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              await controllerFoodB.updateCalP(foodCal, id, id_p.toString());
                                                                                              controllerFoodB.deleteFoodP(snapshotB.data![index].id.toString(), id.toString());
                                                                                              controllerFoodB.updatePFC(foodPCF, id.toString(), id_pfc.toString());
                                                                                              Navigator.of(context).pop();
                                                                                              setState(() {
                                                                                                foodPageCal.blbl = true;
                                                                                              });
                                                                                            }
                                                                                            catch (e) {}
                                                                                          },
                                                                                          child: Text(
                                                                                            'Да',
                                                                                            style: TextStyle(
                                                                                                fontFamily: 'Ubuntu',
                                                                                                color: Colors.white,
                                                                                                fontSize: 22,
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
                                                                                                fontSize: 22,
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
                                                                            },
                                                                            icon: Icon(LineAwesomeIcons.minus_circle),
                                                                            color: Colors.red,
                                                                            splashRadius: 16,
                                                                          ),
                                                                        );
                                                                      } else{
                                                                        return Center(child: Text('Ошибка!'),);
                                                                      }
                                                                    }
                                                                    else{
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
                                                                    }});
                                                            } else{
                                                              try{
                                                                cal_p = snapshotS.data!.cal_p.toString();
                                                                id_p = snapshotS.data!.id;
                                                              } catch(e){
                                                              }
                                                              return FutureBuilder(
                                                                  future: controllerFoodB.getAllRecordsPFC(id),
                                                                  builder: (context, snapshotPFC) {
                                                                    if (snapshotPFC.connectionState == ConnectionState.done) {
                                                                      if(snapshotPFC.hasData){
                                                                        try{
                                                                          id_pfc = snapshotPFC.data!.id;
                                                                          prot_value = snapshotPFC.data!.protein_value.toString();
                                                                          fats_value = snapshotPFC.data!.fats_value.toString();
                                                                          carb_value = snapshotPFC.data!.carb_value.toString();
                                                                          calories_value = snapshotPFC.data!.calories_value.toString();
                                                                        } catch(e){
                                                                        }
                                                                        return SizedBox(
                                                                          height: 35,
                                                                          width: 35,
                                                                          child: IconButton(
                                                                            onPressed: () {
                                                                              showDialog<void>(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      backgroundColor: Colors.blueGrey,
                                                                                      title: Text(
                                                                                        'Удаление записи',
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
                                                                                            try {
                                                                                              cal_p = snapshotS.data!.cal_p.toString();
                                                                                              id_p = snapshotS.data!.id;
                                                                                              final foodCal = CalModelP(
                                                                                                cal_p: (double.parse(cal_p!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              final foodPCF = ModelPFC(
                                                                                                protein_value: (double.parse(prot_value!) - (double.parse(snapshotB.data![index].protein.toString()))).toStringAsFixed(1),
                                                                                                fats_value: (double.parse(fats_value!) - (double.parse(snapshotB.data![index].fats.toString()))).toStringAsFixed(1),
                                                                                                carb_value: (double.parse(carb_value!) - (double.parse(snapshotB.data![index].carb.toString()))).toStringAsFixed(1),
                                                                                                calories_value: (double.parse(calories_value!) - (double.parse(snapshotB.data![index].calorie.toString()))).toStringAsFixed(1),
                                                                                              );
                                                                                              await controllerFoodB.updateCalP(foodCal, id, id_p.toString());
                                                                                              controllerFoodB.deleteFoodP(snapshotB.data![index].id.toString(), id.toString());
                                                                                              controllerFoodB.updatePFC(foodPCF, id.toString(), id_pfc.toString());
                                                                                              Navigator.of(context).pop();
                                                                                              setState(() {
                                                                                                foodPageCal.blbl = true;
                                                                                              });
                                                                                            }
                                                                                            catch (e) {}
                                                                                          },
                                                                                          child: Text(
                                                                                            'Да',
                                                                                            style: TextStyle(
                                                                                                fontFamily: 'Ubuntu',
                                                                                                color: Colors.white,
                                                                                                fontSize: 22,
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
                                                                                                fontSize: 22,
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
                                                                            },
                                                                            icon: Icon(LineAwesomeIcons.minus_circle),
                                                                            color: Colors.red,
                                                                            splashRadius: 16,
                                                                          ),
                                                                        );
                                                                      } else{
                                                                        return Center(child: Text('Ошибка!'),);
                                                                      }
                                                                    }
                                                                    else{
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
                                                                    }});
                                                            }}),
                                                    ],
                                                  ),
                                                  Divider(color: Colors.blueGrey,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshotB.data![index].name_product.toString(),
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].protein.toString() + "Б",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].fats.toString() + "Ж",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].carb.toString() + "У",
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshotB.data![index].weight_product.toString() + ' г.',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshotB.data![index].calorie.toString() + ' Ккал',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        if (snapshotB.hasError) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        return SizedBox(
                                          height: 5,
                                        );
                                      }
                                    } else {
                                      return SizedBox(
                                        height: 5,
                                      );
                                    }
                                  });
                            }),
                        Text(
                          'Подробности',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            FutureBuilder(
                                future: controllerFoodB.getAllRecordsPFC(id),
                                builder: (context, snapshotS) {
                                  if (snapshotS.connectionState == ConnectionState.done) {
                                    if (snapshotS.hasData) {
                                      if(double.parse((double.parse(snapshotS.data!.protein_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                        prot_nan = '0';
                                      } else{
                                        prot_nan = (double.parse(snapshotS.data!.protein_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                      }
                                      if(double.parse((double.parse(snapshotS.data!.fats_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                        fats_nan = '0';
                                      } else{
                                        fats_nan = (double.parse(snapshotS.data!.fats_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                      }
                                      if(double.parse((double.parse(snapshotS.data!.carb_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                        carb_nan = '0';
                                      } else{
                                        carb_nan = (double.parse(snapshotS.data!.carb_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                      }
                                      return SizedBox(
                                        height: 120,
                                        child: PieChart(PieChartData(centerSpaceRadius: 35, borderData: FlBorderData(show: false), sections: [
                                          PieChartSectionData(
                                              value: 1 + double.parse(carb_nan),
                                              color: Colors.redAccent,
                                              radius: 30,
                                              title: 'У',
                                              titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
                                          PieChartSectionData(
                                              value: 1 + double.parse(fats_nan),
                                              color: Colors.yellow,
                                              radius: 30,
                                              title: 'Ж',
                                              titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
                                          PieChartSectionData(
                                              value: 1 + double.parse(prot_nan),
                                              color: Colors.lightBlueAccent,
                                              radius: 30,
                                              title: 'Б',
                                              titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10))
                                        ])),
                                      );
                                    } else {
                                      return SizedBox(
                                        height: 120,
                                        child: PieChart(PieChartData(centerSpaceRadius: 35, borderData: FlBorderData(show: false), sections: [
                                          PieChartSectionData(
                                              value: 1,
                                              color: Colors.redAccent,
                                              radius: 30,
                                              title: 'У',
                                              titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
                                          PieChartSectionData(
                                              value: 1,
                                              color: Colors.yellow,
                                              radius: 30,
                                              title: 'Ж',
                                              titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
                                          PieChartSectionData(
                                              value: 1,
                                              color: Colors.lightBlueAccent,
                                              radius: 30,
                                              title: 'Б',
                                              titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10))
                                        ])),
                                      );
                                    }
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    FutureBuilder(
                                        future: controllerFoodB.getAllRecordsPFC(id),
                                        builder: (context, snapshotS) {
                                          if (snapshotS.connectionState == ConnectionState.done) {
                                            if (snapshotS.hasData) {
                                              if(double.parse((double.parse(snapshotS.data!.protein_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                prot_nan = '0';
                                              } else{
                                                prot_nan = (double.parse(snapshotS.data!.protein_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              if(double.parse((double.parse(snapshotS.data!.fats_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                fats_nan = '0';
                                              } else{
                                                fats_nan = (double.parse(snapshotS.data!.fats_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              if(double.parse((double.parse(snapshotS.data!.carb_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                carb_nan = '0';
                                              } else{
                                                carb_nan = (double.parse(snapshotS.data!.carb_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              return Text('Белки: ' + (double.parse(prot_nan)).toStringAsFixed(2) + '%',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                textAlign: TextAlign.center,
                                              );
                                            } else {
                                              return Text(
                                                'Белки: 0.00%',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                        }),
                                  ],
                                ),
                                FutureBuilder(
                                    future: controllerFoodB.getAllRecordsPFC(id),
                                    builder: (context, snapshotS) {
                                      if (snapshotS.connectionState == ConnectionState.done) {
                                        if (snapshotS.hasData) {
                                          return Text(
                                              'Всего б: ' + snapshotS.data!.protein_value.toString() + ' г.',
                                            style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        } else {
                                          return Text(
                                            'Всего б: 0 г.',
                                            style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        }
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    FutureBuilder(
                                        future: controllerFoodB.getAllRecordsPFC(id),
                                        builder: (context, snapshotS) {
                                          if (snapshotS.connectionState == ConnectionState.done) {
                                            if (snapshotS.hasData) {
                                              if(double.parse((double.parse(snapshotS.data!.protein_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                prot_nan = '0';
                                              } else{
                                                prot_nan = (double.parse(snapshotS.data!.protein_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              if(double.parse((double.parse(snapshotS.data!.fats_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                fats_nan = '0';
                                              } else{
                                                fats_nan = (double.parse(snapshotS.data!.fats_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              if(double.parse((double.parse(snapshotS.data!.carb_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                carb_nan = '0';
                                              } else{
                                                carb_nan = (double.parse(snapshotS.data!.carb_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              return Text('Жиры: ' + (double.parse(fats_nan)).toStringAsFixed(2) + '%',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                textAlign: TextAlign.center,
                                              );
                                            } else {
                                              return Text(
                                                'Жиры: 0.00%',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                        }),
                                  ],
                                ),
                                FutureBuilder(
                                    future: controllerFoodB.getAllRecordsPFC(id),
                                    builder: (context, snapshotS) {
                                      if (snapshotS.connectionState == ConnectionState.done) {
                                        if (snapshotS.hasData) {
                                          return Text(
                                            'Всего ж: ' + snapshotS.data!.fats_value.toString() + ' г.',
                                            style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        } else {
                                          return Text(
                                            'Всего ж: 0 г.',
                                            style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        }
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    FutureBuilder(
                                        future: controllerFoodB.getAllRecordsPFC(id),
                                        builder: (context, snapshotS) {
                                          if (snapshotS.connectionState == ConnectionState.done) {
                                            if (snapshotS.hasData) {
                                              if(double.parse((double.parse(snapshotS.data!.protein_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                prot_nan = '0';
                                              } else{
                                                prot_nan = (double.parse(snapshotS.data!.protein_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              if(double.parse((double.parse(snapshotS.data!.fats_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                fats_nan = '0';
                                              } else{
                                                fats_nan = (double.parse(snapshotS.data!.fats_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              if(double.parse((double.parse(snapshotS.data!.carb_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2)).isNaN){
                                                carb_nan = '0';
                                              } else{
                                                carb_nan = (double.parse(snapshotS.data!.carb_value.toString()) / ((double.parse(snapshotS.data!.protein_value.toString()) + double.parse(snapshotS.data!.fats_value.toString()) + double.parse(snapshotS.data!.carb_value.toString())) / 100)).toStringAsFixed(2);
                                              }
                                              return Text('Углеводы: ' + (double.parse(carb_nan)).toStringAsFixed(2) + '%',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                textAlign: TextAlign.center,
                                              );
                                            } else {
                                              return Text(
                                                'Углеводы: 0.00%',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                        }),
                                  ],
                                ),
                                FutureBuilder(
                                    future: controllerFoodB.getAllRecordsPFC(id),
                                    builder: (context, snapshotS) {
                                      if (snapshotS.connectionState == ConnectionState.done) {
                                        Future.delayed(const Duration(milliseconds: 1), () {
                                          if (foodPageCal.blbl) {
                                            setState(() {
                                              foodPageCal.blbl = false;
                                            });
                                          }
                                        });
                                        if (snapshotS.hasData) {
                                          return Text(
                                            'Всего у: ' + snapshotS.data!.carb_value.toString() + ' г.',
                                            style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        } else {
                                          return Text(
                                            'Всего у: 0 г.',
                                            style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        }
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'Извините, данные не найдены!',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              } else {
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
            }),
      ),
      bottomNavigationBar: BottomWidget(widget.goTR),
    );
  }
}
