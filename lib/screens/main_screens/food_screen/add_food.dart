import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/models/f_model.dart';
import 'package:health_steshkin/models/food_model.dart';
import 'package:health_steshkin/repository/food_repo.dart';
import 'package:health_steshkin/repository/user_repository/f_rep.dart';
import 'package:health_steshkin/services/controllers/f_controller.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AddFoodScreen extends StatefulWidget{
  final globalVar goTR;
  const AddFoodScreen(this.goTR, {super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen>{
  TextEditingController txtCon = TextEditingController();
  TextEditingController wCon = TextEditingController();
  TextEditingController pCon = TextEditingController();
  TextEditingController cCon = TextEditingController();
  TextEditingController fCon = TextEditingController();
  TextEditingController calCon = TextEditingController();
  DateTime _value = DateTime.now();

  @override
  void dispose(){
    txtCon.dispose();
    wCon.dispose();
    pCon.dispose();
    cCon.dispose();
    fCon.dispose();
    calCon.dispose();
    super.dispose();
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
  Widget build(BuildContext context){
    final controller = Get.put(FController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Добавить продукт',
          style: TextStyle(
              fontFamily: 'Ubuntu',
              color: Colors.white,
              fontSize: 22,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              splashRadius: 24,
              onPressed: (){
                widget.goTR.goToRoute(AllRoutes.food);
              },
              icon: Icon(LineAwesomeIcons.angle_left),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
            }, splashRadius: 1, icon: Icon(Icons.food_bank_outlined),
            color: Colors.blueGrey,
          ),
        ],
      ),
      body: FutureBuilder(
        future: controller.getAllFRecords(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              if(snapshot.data![0].date_record == _dateFormatter(_value) && snapshot.data![0].email == userEmail.emailUs){
                final id = snapshot.data![0].id;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Text('Продукт на завтрак',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15,),
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
                            helperStyle: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
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
                        SizedBox(height: 15,),
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
                            helperStyle: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
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
                        SizedBox(height: 15,),
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
                            helperStyle: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
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
                        SizedBox(height: 15,),
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
                            helperStyle: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
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
                        SizedBox(height: 15,),
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
                            helperStyle: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
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
                        SizedBox(height: 15,),
                        TextFormField(
                          maxLength: 4,
                          controller: calCon,
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
                            helperStyle: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Colors.white,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            prefixIcon: Icon(LineAwesomeIcons.burn),
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
                            labelText: 'Калории',
                          ),
                          enabled: true,
                        ),
                        SizedBox(height: 15,),
                        ElevatedButton(
                          onPressed: () {
                            foodPageCal.blbl = true;
                            final foodRecord = FoodModel(
                              name_product: txtCon.text.trim(),
                              weight_product: wCon.text.trim(),
                              protein: pCon.text.trim(),
                              carb: cCon.text.trim(),
                              fats: fCon.text.trim(),
                              calorie: calCon.text.trim(),
                            );
                            print(foodRecord.fats);
                            print(foodRecord.carb);
                            final foodRepo = Get.put(FoodRepository());
                            foodRepo.createFoodRecord(foodRecord, id.toString());
                            widget.goTR.goToRoute(AllRoutes.food);
                          },
                          child: Text(
                            'Добавить',
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
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
                        ),
                      ],
                    ),
                  ),
                );
              } else{
                return Center(child: Text('Нет данных'),);
              }
            } else{
              return Center(child: Text('Нет данных'),);
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
    );
  }
}
