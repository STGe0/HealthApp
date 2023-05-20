import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_steshkin/services/all_routes.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatefulWidget{
  final globalVar goTR;
  const UpdateProfileScreen(this.goTR, {super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>{
  bool passwordHidden = true;

  String dateSignUp = DateFormat.yMMMd().format(FirebaseAuth.instance.currentUser!.metadata.creationTime as DateTime);

  void togglePasswordView() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
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
          builder: (BuildContext context){
            return IconButton(
                splashRadius: 24,
                onPressed: () {
                  widget.goTR.goToRoute(AllRoutes.account);
                },
                icon: Icon(LineAwesomeIcons.angle_left)
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage('assets/image/account.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blueGrey),
                      child: const Icon(LineAwesomeIcons.camera,
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
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        keyboardAppearance: Brightness.dark,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
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
                            fontFamily: 'Rubik',
                            color: Colors.white,
                          ),
                          labelText: 'Логин',
                          helperStyle: TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.white,
                          ),
                          helperText: 'Введите свой логин',
                        ),
                        enabled: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            prefixIcon: Icon(LineAwesomeIcons.alternate_long_arrow_up),
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
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            labelText: 'Рост (см)',
                            helperStyle: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            helperText: 'Введите свой рост'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        //controller: controller.weightController,
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
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
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            labelText: 'Вес (кг)',
                            helperStyle: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            helperText: 'Введите свой вес'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        //controller: controller.passwordController,
                        keyboardAppearance: Brightness.dark,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            prefixIcon: Icon(LineAwesomeIcons.fingerprint),
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
                            suffix: InkWell(
                              onTap: togglePasswordView,
                              child: Icon(
                                passwordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            labelText: 'Пароль',
                            helperStyle: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            helperText: 'Обязательно 6 символов'),
                        obscureText: passwordHidden,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(onPressed: () {
                          widget.goTR.goToRoute(AllRoutes.account_update);
                        },
                          child: Text('Редактировать',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Зарегистрирован ' + dateSignUp,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(onPressed: (){},
                              child: Text('Удалить',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Colors.white,
                                ),
                              ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent.withOpacity(0.6),
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
          ),
        ),
      ),
    );
  }
}