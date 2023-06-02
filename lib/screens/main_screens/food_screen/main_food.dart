import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/custom_widgets/bottom_bar.dart';
import 'package:health_steshkin/models/f_model.dart';
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
  DateTime _value = DateTime.now();
  String? id = '123';
  final controllerF = Get.put(FController());
  final controllerFoodB = Get.put(FoodController());

  @override
  void initState() {
    super.initState();
  }

  String _dateFormatter(DateTime tm) {
    late String month;

    switch (tm.month) {
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
    return "${tm.day} $month ${tm.year}";
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
                              Text(
                                foodPageCal.PageCal.toString(),
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
                                  Text(
                                    foodPageCal.PageCal_breakfast.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
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
                                foodPageCal.PageCal = 0;
                                foodPageCal.PageCal_breakfast = 0;
                                foodPageCal.PageCal_protein = 0;
                                foodPageCal.PageCal_carb = 0;
                                foodPageCal.PageCal_fats = 0;
                                foodPageCal.PageCal_all = 0;
                                foodPageCal.PageCal_p = 0;
                                foodPageCal.PageCal_protein_perc = '0';
                                foodPageCal.PageCal_carb_perc = '0';
                                foodPageCal.PageCal_fats_perc = '0';
                                id = snapshotAll.data?[0].id;
                              } catch (e) {}
                              return FutureBuilder(
                                  future: controllerFoodB.getAllFoodRecords(id.toString()),
                                  builder: (context, snapshotB) {
                                    if (snapshotB.connectionState == ConnectionState.done) {
                                      if (snapshotB.data!.length > 0 && snapshotB.hasData) {
                                        Future(() {
                                          for (int i = 0; i < snapshotB.data!.length; i++) {
                                            foodPageCal.PageCal = foodPageCal.PageCal + int.parse(snapshotB.data![i].calorie.toString());
                                            foodPageCal.PageCal_protein = foodPageCal.PageCal_protein + int.parse(snapshotB.data![i].protein.toString());
                                            foodPageCal.PageCal_breakfast = foodPageCal.PageCal_breakfast + int.parse(snapshotB.data![i].calorie.toString());
                                            foodPageCal.PageCal_carb = foodPageCal.PageCal_carb + int.parse(snapshotB.data![i].carb.toString());
                                            foodPageCal.PageCal_fats = foodPageCal.PageCal_fats + int.parse(snapshotB.data![i].fats.toString());
                                          }
                                          foodPageCal.PageCal_all = foodPageCal.PageCal_protein + foodPageCal.PageCal_carb + foodPageCal.PageCal_fats;
                                        });
                                        return SizedBox(
                                          height: 100 * double.parse(snapshotB.data!.length.toString()),
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
                                                      //IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.edit), color: Colors.white, splashRadius: 16),
                                                      SizedBox(
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
                                                                            controllerFoodB.deleteFoodB(snapshotB.data![index].id.toString(), id.toString());
                                                                            Navigator.of(context).pop();
                                                                            setState(() {
                                                                              foodPageCal.blbl = true;
                                                                            });
                                                                            setState(() {
                                                                              foodPageCal.blbl = true;
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
                                                      ),
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
                                  Text(
                                    foodPageCal.PageCal_o.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
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
                                id = snapshotAll.data?[0].id;
                              } catch (e) {}
                              return FutureBuilder(
                                  future: controllerFoodB.getAllFoodRecordsO(id.toString()),
                                  builder: (context, snapshotB) {
                                    if (snapshotB.connectionState == ConnectionState.done) {
                                      if (snapshotB.data!.length > 0 && snapshotB.hasData) {
                                        Future(() {
                                          for (int i = 0; i < snapshotB.data!.length; i++) {
                                            foodPageCal.PageCal = foodPageCal.PageCal + int.parse(snapshotB.data![i].calorie.toString());
                                            foodPageCal.PageCal_o = foodPageCal.PageCal_o + int.parse(snapshotB.data![i].calorie.toString());
                                            foodPageCal.PageCal_protein = foodPageCal.PageCal_protein + int.parse(snapshotB.data![i].protein.toString());
                                            foodPageCal.PageCal_carb = foodPageCal.PageCal_carb + int.parse(snapshotB.data![i].carb.toString());
                                            foodPageCal.PageCal_fats = foodPageCal.PageCal_fats + int.parse(snapshotB.data![i].fats.toString());
                                          }
                                          foodPageCal.PageCal_all = foodPageCal.PageCal_protein + foodPageCal.PageCal_carb + foodPageCal.PageCal_fats;
                                        });
                                        return SizedBox(
                                          height: 100 * double.parse(snapshotB.data!.length.toString()),
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
                                                      //IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.edit), color: Colors.white, splashRadius: 16),
                                                      SizedBox(
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
                                                                            controllerFoodB.deleteFoodO(snapshotB.data![index].id.toString(), id.toString());
                                                                            Navigator.of(context).pop();
                                                                            setState(() {
                                                                              foodPageCal.blbl = true;
                                                                            });
                                                                            setState(() {
                                                                              foodPageCal.blbl = true;
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
                                                      ),
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
                                  Text(
                                    foodPageCal.PageCal_u.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
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
                                id = snapshotAll.data?[0].id;
                              } catch (e) {}
                              return FutureBuilder(
                                  future: controllerFoodB.getAllFoodRecordsU(id.toString()),
                                  builder: (context, snapshotB) {
                                    if (snapshotB.connectionState == ConnectionState.done) {
                                      if (snapshotB.data!.length > 0 && snapshotB.hasData) {
                                        Future(() {
                                          for (int i = 0; i < snapshotB.data!.length; i++) {
                                            foodPageCal.PageCal_u = foodPageCal.PageCal_u + int.parse(snapshotB.data![i].calorie.toString());
                                            foodPageCal.PageCal = foodPageCal.PageCal + int.parse(snapshotB.data![i].calorie.toString());
                                            foodPageCal.PageCal_protein = foodPageCal.PageCal_protein + int.parse(snapshotB.data![i].protein.toString());
                                            foodPageCal.PageCal_carb = foodPageCal.PageCal_carb + int.parse(snapshotB.data![i].carb.toString());
                                            foodPageCal.PageCal_fats = foodPageCal.PageCal_fats + int.parse(snapshotB.data![i].fats.toString());
                                          }
                                          foodPageCal.PageCal_all = foodPageCal.PageCal_protein + foodPageCal.PageCal_carb + foodPageCal.PageCal_fats;
                                        });
                                        return SizedBox(
                                          height: 100 * double.parse(snapshotB.data!.length.toString()),
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
                                                      //IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.edit), color: Colors.white, splashRadius: 16),
                                                      SizedBox(
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
                                                                            controllerFoodB.deleteFoodU(snapshotB.data![index].id.toString(), id.toString());
                                                                            Navigator.of(context).pop();
                                                                            setState(() {
                                                                              foodPageCal.blbl = true;
                                                                            });
                                                                            setState(() {
                                                                              foodPageCal.blbl = true;
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
                                                      ),
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
                                  Text(
                                    foodPageCal.PageCal_p.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
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
                                id = snapshotAll.data?[0].id;
                              } catch (e) {}
                              return FutureBuilder(
                                  future: controllerFoodB.getAllFoodRecordsP(id.toString()),
                                  builder: (context, snapshotB) {
                                    if (snapshotB.connectionState == ConnectionState.done) {
                                      if (true) {
                                        Future.delayed(const Duration(milliseconds: 1), () {
                                          print('123');
                                          for (int i = 0; i < snapshotB.data!.length; i++) {
                                            foodPageCal.PageCal_p = foodPageCal.PageCal_p + int.parse(snapshotB.data![i].calorie.toString());
                                            foodPageCal.PageCal = foodPageCal.PageCal + int.parse(snapshotB.data![i].calorie.toString());
                                            foodPageCal.PageCal_protein = foodPageCal.PageCal_protein + int.parse(snapshotB.data![i].protein.toString());
                                            foodPageCal.PageCal_carb = foodPageCal.PageCal_carb + int.parse(snapshotB.data![i].carb.toString());
                                            foodPageCal.PageCal_fats = foodPageCal.PageCal_fats + int.parse(snapshotB.data![i].fats.toString());
                                          }
                                          foodPageCal.PageCal_all = foodPageCal.PageCal_protein + foodPageCal.PageCal_carb + foodPageCal.PageCal_fats;

                                          foodPageCal.PageCal_protein_perc = (foodPageCal.PageCal_protein.toDouble() / (foodPageCal.PageCal_all / 100).toDouble()).toStringAsFixed(0);
                                          foodPageCal.PageCal_carb_perc = (foodPageCal.PageCal_carb.toDouble() / (foodPageCal.PageCal_all / 100).toDouble()).toStringAsFixed(0);
                                          foodPageCal.PageCal_fats_perc = (foodPageCal.PageCal_fats.toDouble() / (foodPageCal.PageCal_all / 100).toDouble()).toStringAsFixed(0);
                                          if (foodPageCal.blbl) {
                                            setState(() {
                                              foodPageCal.blbl = false;
                                            });
                                          }
                                        });
                                        return SizedBox(
                                          height: 100 * double.parse(snapshotB.data!.length.toString()),
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
                                                      //IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.edit), color: Colors.white, splashRadius: 16),
                                                      SizedBox(
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
                                                                            controllerFoodB.deleteFoodP(snapshotB.data![index].id.toString(), id.toString());
                                                                            Navigator.of(context).pop();
                                                                            setState(() {
                                                                              foodPageCal.blbl = true;
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
                                                      ),
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
                            SizedBox(
                              height: 120,
                              child: PieChart(PieChartData(centerSpaceRadius: 35, borderData: FlBorderData(show: false), sections: [
                                PieChartSectionData(
                                    value: 1 + foodPageCal.PageCal_carb.toDouble(),
                                    color: Colors.redAccent,
                                    radius: 30,
                                    title: 'У',
                                    titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
                                PieChartSectionData(
                                    value: 1 + foodPageCal.PageCal_fats.toDouble(),
                                    color: Colors.yellow,
                                    radius: 30,
                                    title: 'Ж',
                                    titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
                                PieChartSectionData(
                                    value: 1 + foodPageCal.PageCal_protein.toDouble(),
                                    color: Colors.lightBlueAccent,
                                    radius: 30,
                                    title: 'Б',
                                    titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10))
                              ])),
                            ),
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
                                    Text(
                                      'Белки: ' + foodPageCal.PageCal_protein_perc + '%',
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Всего б: ' + foodPageCal.PageCal_protein.toString() + ' г.',
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
                                    Text(
                                      'Жиры: ' + foodPageCal.PageCal_fats_perc + '%',
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Всего ж: ' + foodPageCal.PageCal_fats.toString() + ' г.',
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
                                    Text(
                                      'Углеводы: ' + foodPageCal.PageCal_carb_perc + '%',
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Всего у: ' + foodPageCal.PageCal_carb.toString() + ' г.',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
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
