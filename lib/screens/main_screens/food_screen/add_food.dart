import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/models/cal_b_model.dart';
import 'package:health_steshkin/models/food_model.dart';
import 'package:health_steshkin/models/pfc_value_model.dart';
import 'package:health_steshkin/repository/food_repo.dart';
import 'package:health_steshkin/services/controllers/f_controller.dart';
import 'package:health_steshkin/services/controllers/food_controller.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AddFoodScreen extends StatefulWidget {
  final globalVar goTR;

  const AddFoodScreen(this.goTR, {super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  TextEditingController txtCon = TextEditingController();
  TextEditingController wCon = TextEditingController();
  TextEditingController pCon = TextEditingController();
  TextEditingController cCon = TextEditingController();
  TextEditingController fCon = TextEditingController();
  TextEditingController calCon = TextEditingController();
  DateTime _value = DateTime.now();
  final controllerFoodB = Get.put(FoodController());

  @override
  void dispose() {
    txtCon.dispose();
    wCon.dispose();
    pCon.dispose();
    cCon.dispose();
    fCon.dispose();
    calCon.dispose();
    super.dispose();
  }

  String _dateFormatter(DateTime tm) {
    DateTime today = new DateTime.now();
    Duration oneDay = new Duration(days: 1);
    Duration twoDay = new Duration(days: 2);
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
    Duration difference = today.difference(tm);

    return "${tm.day} $month ${tm.year}";
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Добавить продукт',
          style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 22, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              splashRadius: 24,
              onPressed: () {
                foodPageCal.blbl = true;
                widget.goTR.goToRoute(AllRoutes.food);
              },
              icon: Icon(LineAwesomeIcons.angle_left),
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
      body: FutureBuilder(
          future: controller.getAllFRecords(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (snapshot.data![0].date_record == _dateFormatter(foodPageCal.valueF) && snapshot.data![0].email == userEmail.emailUs) {
                  final id = snapshot.data![0].id;
                  return FutureBuilder(
                      future: controllerFoodB.getAllCalRecordsB(id!),
                      builder: (context, snapshotS) {
                        if (snapshotS.hasData) {
                          final id_b = snapshotS.data!.id;
                          final cal_break = snapshotS.data!.cal_b.toString();
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Text(
                                  'Продукт на завтрак',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Укажите данные с упаковки продукта (БЖУ на 100 грамм)',
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLength: 16,
                                  controller: txtCon,
                                  autocorrect: false,
                                  keyboardAppearance: Brightness.dark,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    prefixIcon: Icon(LineAwesomeIcons.hamburger),
                                    prefixIconColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    labelStyle: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    labelText: 'Продукт',
                                  ),
                                  enabled: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLength: 4,
                                  controller: wCon,
                                  keyboardType: TextInputType.number,
                                  autocorrect: false,
                                  keyboardAppearance: Brightness.dark,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    prefixIcon: Icon(LineAwesomeIcons.weight),
                                    prefixIconColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    labelStyle: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    labelText: 'Вес (г)',
                                  ),
                                  enabled: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLength: 3,
                                  controller: pCon,
                                  keyboardType: TextInputType.number,
                                  autocorrect: false,
                                  keyboardAppearance: Brightness.dark,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    prefixIcon: Icon(LineAwesomeIcons.scroll),
                                    prefixIconColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    labelStyle: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    labelText: 'Белок',
                                  ),
                                  enabled: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLength: 3,
                                  controller: fCon,
                                  keyboardType: TextInputType.number,
                                  autocorrect: false,
                                  keyboardAppearance: Brightness.dark,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    prefixIcon: Icon(LineAwesomeIcons.scroll),
                                    prefixIconColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    labelStyle: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    labelText: 'Жиры',
                                  ),
                                  enabled: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLength: 3,
                                  controller: cCon,
                                  keyboardType: TextInputType.number,
                                  autocorrect: false,
                                  keyboardAppearance: Brightness.dark,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    prefixIcon: Icon(LineAwesomeIcons.scroll),
                                    prefixIconColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    labelStyle: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    labelText: 'Углеводы',
                                  ),
                                  enabled: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                FutureBuilder(
                                  future: controllerFoodB.getAllRecordsPFC(id),
                                  builder: (context, snapshotPFC) {
                                    if (snapshotPFC.connectionState == ConnectionState.done) {
                                    if(snapshotPFC.hasData){
                                      final id_PFC = snapshotPFC.data!.id;
                                      final protein_value = snapshotPFC.data!.protein_value.toString();
                                      final fats_value = snapshotPFC.data!.fats_value.toString();
                                      final carb_value = snapshotPFC.data!.carb_value.toString();
                                      final calories_value = snapshotPFC.data!.calories_value.toString();
                                      return ElevatedButton(
                                        onPressed: () async {
                                          try{
                                          if(txtCon.text.trim().isNotEmpty) {
                                            foodPageCal.blbl = true;
                                            final foodRecord = FoodModel(
                                              name_product: txtCon.text.trim(),
                                              weight_product: wCon.text.trim(),
                                              protein: (double.parse(pCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                              carb: (double.parse(cCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                              fats: (double.parse(fCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                              calorie: ((((double.parse(pCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 4) + (((double.parse(cCon.text.trim())) * (double.parse(wCon.text
                                                  .trim()) / 100)) * 4) + (((double.parse(fCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 9)).toStringAsFixed(1),
                                            );
                                            String ui = foodRecord.calorie.toString();
                                            final foodCal = CalModelB(
                                              cal_b: (double.parse(cal_break) + double.parse(ui)).toStringAsFixed(1),
                                            );
                                            final foodPCF = ModelPFC(
                                              protein_value: (double.parse(protein_value) + double.parse(foodRecord.protein.toString())).toStringAsFixed(1),
                                              fats_value: (double.parse(fats_value) + double.parse(foodRecord.fats.toString())).toStringAsFixed(1),
                                              carb_value: (double.parse(carb_value) + double.parse(foodRecord.carb.toString())).toStringAsFixed(1),
                                              calories_value: (double.parse(calories_value) + double.parse(foodRecord.calorie.toString())).toStringAsFixed(1),
                                            );
                                            final foodRepo = Get.put(FoodRepository());
                                            foodRepo.createFoodRecord(foodRecord, id.toString());
                                            await controllerFoodB.updateCalB(foodCal, id, id_b.toString());
                                            foodRepo.updatePFC(foodPCF, id.toString(), id_PFC.toString());
                                            widget.goTR.goToRoute(AllRoutes.food);
                                          } else{
                                            showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.blueGrey,
                                                    title: Text(
                                                      'Поля не заполнены',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 28,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      'Для добавления записи заполните поля',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                            Navigator.of(context).pop();
                                                        },
                                                        child: Text(
                                                          'Ок',
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
                                          }
                                        }catch(e){
                                            showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.blueGrey,
                                                    title: Text(
                                                      'Поля не заполнены',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 28,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      'Для добавления записи заполните поля',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text(
                                                          'Ок',
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
                                          }},
                                        child: Text(
                                          'Добавить',
                                          style: TextStyle(fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                          minimumSize: Size(150, 50),
                                        ),
                                      );
                                    } else{
                                      return ElevatedButton(
                                        onPressed: () async {
                                          try{
                                          if(txtCon.text.trim().isNotEmpty) {
                                            foodPageCal.blbl = true;
                                            final foodRecord = FoodModel(
                                              name_product: txtCon.text.trim(),
                                              weight_product: wCon.text.trim(),
                                              protein: (double.parse(pCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                              carb: (double.parse(cCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                              fats: (double.parse(fCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                              calorie: ((((double.parse(pCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 4) + (((double.parse(cCon.text.trim())) * (double.parse(wCon.text
                                                  .trim()) / 100)) * 4) + (((double.parse(fCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 9)).toStringAsFixed(1),
                                            );
                                            String ui = foodRecord.calorie.toString();
                                            final foodCal = CalModelB(
                                              cal_b: (double.parse(cal_break) + double.parse(ui)).toStringAsFixed(1),
                                            );
                                            final foodPCF = ModelPFC(
                                              protein_value: foodRecord.protein,
                                              fats_value: foodRecord.fats,
                                              carb_value: foodRecord.carb,
                                              calories_value: foodRecord.calorie,
                                            );
                                            final foodRepo = Get.put(FoodRepository());
                                            foodRepo.createFoodRecord(foodRecord, id.toString());
                                            await controllerFoodB.updateCalB(foodCal, id, id_b.toString());
                                            foodRepo.createFoodPFC(foodPCF, id.toString());
                                            widget.goTR.goToRoute(AllRoutes.food);
                                          } else{
                                            showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.blueGrey,
                                                    title: Text(
                                                      'Поля не заполнены',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 28,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      'Для добавления записи заполните поля',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text(
                                                          'Ок',
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
                                          }
                                          }catch(e){
                                            showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.blueGrey,
                                                    title: Text(
                                                      'Поля не заполнены',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 28,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      'Для добавления записи заполните поля',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text(
                                                          'Ок',
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
                                          }},
                                        child: Text(
                                          'Добавить',
                                          style: TextStyle(fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                          minimumSize: Size(150, 50),
                                        ),
                                      );
                                    }
                                  }else{
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
                                    }}),
                              ],
                            ),
                          ),
                        );
                      } else{
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Продукт на завтрак',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Text(
                                    'Укажите данные с упаковки продукта (БЖУ на 100 грамм)',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    maxLength: 16,
                                    controller: txtCon,
                                    autocorrect: false,
                                    keyboardAppearance: Brightness.dark,
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.redAccent,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(LineAwesomeIcons.hamburger),
                                      prefixIconColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      labelStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Продукт',
                                    ),
                                    enabled: true,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    maxLength: 4,
                                    controller: wCon,
                                    keyboardType: TextInputType.number,
                                    autocorrect: false,
                                    keyboardAppearance: Brightness.dark,
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.redAccent,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(LineAwesomeIcons.weight),
                                      prefixIconColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      labelStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Вес (г)',
                                    ),
                                    enabled: true,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    maxLength: 3,
                                    controller: pCon,
                                    keyboardType: TextInputType.number,
                                    autocorrect: false,
                                    keyboardAppearance: Brightness.dark,
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.redAccent,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(LineAwesomeIcons.scroll),
                                      prefixIconColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      labelStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Белок',
                                    ),
                                    enabled: true,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    maxLength: 3,
                                    controller: fCon,
                                    keyboardType: TextInputType.number,
                                    autocorrect: false,
                                    keyboardAppearance: Brightness.dark,
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.redAccent,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(LineAwesomeIcons.scroll),
                                      prefixIconColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      labelStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Жиры',
                                    ),
                                    enabled: true,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    maxLength: 3,
                                    controller: cCon,
                                    keyboardType: TextInputType.number,
                                    autocorrect: false,
                                    keyboardAppearance: Brightness.dark,
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      helperStyle: TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.redAccent,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      prefixIcon: Icon(LineAwesomeIcons.scroll),
                                      prefixIconColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      labelStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelText: 'Углеводы',
                                    ),
                                    enabled: true,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  FutureBuilder(
                                    future: controllerFoodB.getAllRecordsPFC(id),
                                    builder: (context, snapshotPFC) {
                                      if(snapshotPFC.connectionState == ConnectionState.done){
                                      if(snapshotPFC.hasData){
                                        final id_PFC = snapshotPFC.data!.id;
                                        final protein_value = snapshotPFC.data!.protein_value.toString();
                                        final fats_value = snapshotPFC.data!.fats_value.toString();
                                        final carb_value = snapshotPFC.data!.carb_value.toString();
                                        final calories_value = snapshotPFC.data!.calories_value.toString();
                                        return ElevatedButton(
                                          onPressed: () {
                                            try{
                                            if(txtCon.text.trim().isNotEmpty) {
                                              foodPageCal.blbl = true;
                                              final foodRecord = FoodModel(
                                                name_product: txtCon.text.trim(),
                                                weight_product: wCon.text.trim(),
                                                protein: (double.parse(pCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                                carb: (double.parse(cCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                                fats: (double.parse(fCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                                calorie: ((((double.parse(pCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 4) + (((double.parse(cCon.text.trim())) * (double.parse(wCon
                                                    .text.trim()) / 100)) * 4) + (((double.parse(fCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 9)).toStringAsFixed(1),
                                              );
                                              final foodCal = CalModelB(
                                                cal_b: foodRecord.calorie,
                                              );
                                              final foodPCF = ModelPFC(
                                                protein_value: (double.parse(protein_value) + double.parse(foodRecord.protein.toString())).toStringAsFixed(1),
                                                fats_value: (double.parse(fats_value) + double.parse(foodRecord.fats.toString())).toStringAsFixed(1),
                                                carb_value: (double.parse(carb_value) + double.parse(foodRecord.carb.toString())).toStringAsFixed(1),
                                                calories_value: (double.parse(calories_value) + double.parse(foodRecord.calorie.toString())).toStringAsFixed(1),
                                              );
                                              final foodRepo = Get.put(FoodRepository());
                                              foodRepo.createFoodRecord(foodRecord, id.toString());
                                              foodRepo.createFoodCalB(foodCal, id.toString());
                                              foodRepo.updatePFC(foodPCF, id.toString(), id_PFC.toString());
                                              widget.goTR.goToRoute(AllRoutes.food);
                                            } else{
                                              showDialog<void>(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor: Colors.blueGrey,
                                                      title: Text(
                                                        'Поля не заполнены',
                                                        style: TextStyle(
                                                            fontFamily: 'Ubuntu',
                                                            color: Colors.white,
                                                            fontSize: 28,
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      content: const Text(
                                                        'Для добавления записи заполните поля',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: Text(
                                                            'Ок',
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
                                            }
                                            }catch(e){
                                              showDialog<void>(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor: Colors.blueGrey,
                                                      title: Text(
                                                        'Поля не заполнены',
                                                        style: TextStyle(
                                                            fontFamily: 'Ubuntu',
                                                            color: Colors.white,
                                                            fontSize: 28,
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      content: const Text(
                                                        'Для добавления записи заполните поля',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: Text(
                                                            'Ок',
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
                                            }
                                            },
                                          child: Text(
                                            'Добавить',
                                            style: TextStyle(fontFamily: 'Ubuntu',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey,
                                            side: BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                            minimumSize: Size(150, 50),
                                          ),
                                        );
                                      } else{
                                      return ElevatedButton(
                                        onPressed: () {
                                          try{
                                          if(txtCon.text.trim().isNotEmpty){
                                          foodPageCal.blbl = true;
                                          final foodRecord = FoodModel(
                                            name_product: txtCon.text.trim(),
                                            weight_product: wCon.text.trim(),
                                            protein: (double.parse(pCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                            carb: (double.parse(cCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                            fats: (double.parse(fCon.text.trim()) * (double.parse(wCon.text.trim()) / 100)).toStringAsFixed(1),
                                            calorie: ((((double.parse(pCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 4) + (((double.parse(cCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 4) + (((double.parse(fCon.text.trim())) * (double.parse(wCon.text.trim()) / 100)) * 9)).toStringAsFixed(1),
                                          );
                                          final foodCal = CalModelB(
                                            cal_b: foodRecord.calorie,
                                          );
                                          final foodPCF = ModelPFC(
                                            protein_value: foodRecord.protein,
                                            fats_value: foodRecord.fats,
                                            carb_value: foodRecord.carb,
                                            calories_value: foodRecord.calorie,
                                          );
                                          final foodRepo = Get.put(FoodRepository());
                                          foodRepo.createFoodRecord(foodRecord, id.toString());
                                          foodRepo.createFoodCalB(foodCal, id.toString());
                                          foodRepo.createFoodPFC(foodPCF, id.toString());
                                          widget.goTR.goToRoute(AllRoutes.food);
                                        } else{
                                            showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.blueGrey,
                                                    title: Text(
                                                      'Поля не заполнены',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 28,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      'Для добавления записи заполните поля',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text(
                                                          'Ок',
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
                                          }
                                          }catch (e){
                                            showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.blueGrey,
                                                    title: Text(
                                                      'Поля не заполнены',
                                                      style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 28,
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      'Для добавления записи заполните поля',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text(
                                                          'Ок',
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
                                          }
                                          } ,
                                        child: Text(
                                          'Добавить',
                                          style: TextStyle(fontFamily: 'Ubuntu',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueGrey,
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                          minimumSize: Size(150, 50),
                                        ),
                                      );}
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
                                      }}),
                                ],
                              ),
                            ),
                          );
                        }
                      });
                } else {
                  return Center(
                    child: Text('Нет данных 1'),
                  );
                }
              } else {
                return Center(
                  child: Text('Нет данных'),
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
    );
  }
}
