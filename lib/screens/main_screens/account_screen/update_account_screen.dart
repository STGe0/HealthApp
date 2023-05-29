import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:health_steshkin/services/navigation/all_routes.dart';
import 'package:health_steshkin/services/controllers/profile_controller.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatefulWidget {
  final globalVar goTR;

  const UpdateProfileScreen(this.goTR, {super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String dateSignUp = DateFormat.yMMMd().format(
      FirebaseAuth.instance.currentUser!.metadata.creationTime as DateTime);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Редактировать профиль',
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
                  widget.goTR.goToRoute(AllRoutes.account);
                },
                icon: Icon(LineAwesomeIcons.angle_left));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    final id = TextEditingController(text: userData.id);
                    final fullName = TextEditingController(text: userData.fullName.toString());
                    final height = TextEditingController(text: userData.height_user.toString());
                    final weight = TextEditingController(text: userData.weight_user_now.toString());

                    return Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                  image: AssetImage('assets/image/logo.png'),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.blueGrey),
                                child: const Icon(
                                  LineAwesomeIcons.camera,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: fullName,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                keyboardAppearance: Brightness.dark,
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold
                                ),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
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
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                  ),
                                  labelText: 'Логин',
                                  helperStyle: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                  ),
                                  helperText: 'Введите свой логин',
                                ),
                                enabled: true,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: height,
                                keyboardAppearance: Brightness.dark,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold
                                ),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(LineAwesomeIcons
                                        .alternate_long_arrow_up),
                                    prefixIconColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.blueGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.blueGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold
                                    ),
                                    labelText: 'Рост (см)',
                                    helperStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold
                                    ),
                                    helperText: 'Введите свой рост'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: weight,
                                keyboardAppearance: Brightness.dark,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold
                                ),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(LineAwesomeIcons.weight),
                                    prefixIconColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.blueGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.blueGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold
                                    ),
                                    labelText: 'Вес (кг)',
                                    helperStyle: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold
                                    ),
                                    helperText: 'Введите свой вес'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () async{
                                    if(fullName.text.trim().length >=4 && weight.text.length >= 2 && height.text.length >= 3){
                                    final userMod = UserModel(
                                      id: id.text,
                                      email: userData.email,
                                      fullName: fullName.text.trim(),
                                      height_user: height.text.trim(),
                                      weight_user_now: weight.text.trim(),
                                    );
                                    await controller.updateAccount(userMod);
                                    showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.blueGrey,
                                            title: Text(
                                              'Успешно',
                                              style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            content: Text(
                                              'Аккаунт успешно отредактирован',
                                              style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  color: Colors.white,
                                                  fontSize: 20,
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
                                  } else {
                                      showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.blueGrey,
                                              title: Text(
                                                'Неверный формат',
                                                style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              content: Text(
                                                'Неверный формат или поля пустые',
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
                                    };
                                  },
                                  child: Text(
                                    'Редактировать',
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
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: dateSignUp,
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      final userMod = UserModel(
                                        id: id.text,
                                        email: userData.email,
                                        fullName: fullName.text.trim(),
                                        height_user: height.text.trim(),
                                        weight_user_now: weight.text.trim(),
                                      );
                                      showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.blueGrey,
                                              title: Text(
                                                'Удаления аккаунта',
                                                style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              content: const Text(
                                                'Вы точно хотите удалить аккаунт?',
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
                                                      await FirebaseAuth.instance.currentUser!.delete();
                                                      controller.deleteAccount(userMod);
                                                      Navigator.of(context).pop();
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
                                    child: Text(
                                      'Удалить',
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.6),
                                      elevation: 0,
                                      shape: const StadiumBorder(
                                        side: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("Что-то пошло не так"),
                      );
                    }
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}