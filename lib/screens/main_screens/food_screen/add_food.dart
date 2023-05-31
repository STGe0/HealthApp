import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/models/food_model.dart';
import 'package:health_steshkin/repository/food_repo.dart';
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

  @override
  Widget build(BuildContext context){
    final controller = Get.put(FController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Добавить продукт',
          style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontSize: 22,
              fontStyle: FontStyle.italic),
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
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: txtCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: wCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: pCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: cCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: fCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                      onPressed: () {
                        if(true){

                        }
                        final foodRecord = FoodModel(
                            name_product: txtCon.text.trim(),
                            weight_product: wCon.text.trim(),
                            protein: pCon.text.trim(),
                            carb: cCon.text.trim(),
                            fats: fCon.text.trim()
                        );
                        final foodRepo = Get.put(FoodRepository());
                        foodRepo.createFoodRecord(foodRecord, 'RJITVOI2PnbYwMfVkSID');
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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: txtCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: wCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: pCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: cCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: fCon,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                      onChanged: (_) => setState(() {
                      }),
                      decoration: InputDecoration(
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
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        labelText: 'Название',
                      ),
                      enabled: true,
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                      onPressed: () {
                        if(true){

                        }
                        final foodRecord = FoodModel(
                            name_product: txtCon.text.trim(),
                            weight_product: wCon.text.trim(),
                            protein: pCon.text.trim(),
                            carb: cCon.text.trim(),
                            fats: fCon.text.trim()
                        );
                        final foodRepo = Get.put(FoodRepository());
                        foodRepo.createFoodRecord(foodRecord, 'RJITVOI2PnbYwMfVkSID');
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
          }
        }
      ),
    );
  }
}
