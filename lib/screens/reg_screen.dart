import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:health_steshkin/repository/user_repository/user_repository.dart';
import 'package:health_steshkin/screens/auth_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/services/controllers.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RegScreen extends StatefulWidget {
  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State {
  bool passwordHidden = true;

  final formKey = GlobalKey<FormState>();

  void togglePasswordView() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final controller = Get.put(SignUpController());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      body: Center(
        child: Form(
          key: formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              reverse: false,
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Text(
                    'Регистрация',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                        fontSize: 37,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Текстовое поле (Логин)
                  TextFormField(
                    controller: controller.fullNameController,
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
                  //Текстовое поле (email)
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
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
                      labelText: 'Email',
                      helperStyle: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                      helperText: 'Формат: 123qwe@mail.com',
                    ),
                    enabled: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Числовое поле (Рост)
                  TextFormField(
                    controller: controller.heightController,
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
                  //Числовое поле (Вес)
                  TextFormField(
                    controller: controller.weightController,
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
                  //Текстовое поле (Пароль)
                  TextFormField(
                    controller: controller.passwordController,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.next,
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
                    height: 15,
                  ),
                  //Текстовое поле (Пароль (повтор))
                  TextFormField(
                    controller: controller.passwordRepeatController,
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
                        labelText: 'Пароль (повтор)',
                        helperStyle: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                        helperText: 'Повторите пароль'),
                    obscureText: passwordHidden,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if(controller.passwordController.text.trim() == controller.passwordRepeatController.text.trim()
                          && formKey.currentState!.validate() && !controller.passwordController.text.trim().isEmpty
                          && !controller.passwordRepeatController.text.trim().isEmpty && !controller.fullNameController.text.trim().isEmpty
                          && !controller.emailController.text.trim().isEmpty && !controller.heightController.text.trim().isEmpty
                          && !controller.weightController.text.trim().isEmpty) {
                        final userM = UserModel(
                          fullName: controller.fullNameController.text.trim(),
                          email: controller.emailController.text.trim(),
                          password: controller.passwordController.text.trim(),
                          height_user: controller.heightController.text.trim(),
                          weight_user_now: controller.weightController.text.trim(),
                        );
                        //Создаем запись в БД пользователей (user)
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: controller.emailController.text.trim(),
                            password: controller.passwordController.text.trim(),
                          );
                          //Создаем запись в БД (user)
                          final userRepo = Get.put(UserRepository());
                          userRepo.createUser(userM);
                          navigator.pushNamedAndRemoveUntil('/start', (Route<dynamic> route) => false);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return _getAlertWarning(
                                      'Слабый пароль',
                                      'Слабый пароль, постарайтесь придумать другой',
                                      context);
                                });
                          } else if (e.code == 'email-already-in-use') {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return _getAlertWarning(
                                      'Почта уже используется',
                                      'Пользователь уже зарегистрирован в системе',
                                      context);
                                });
                          } else if (e.code == 'invalid-email' ||
                              e.code == 'internal-error' ||
                              e.code == 'unknown') {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return _getAlertWarning(
                                      'Неверный формат',
                                      'Неверный формат или поля email/пароль не заполнены',
                                      context);
                                });
                          }
                        } catch(e){
                          print(e);
                        }
                      } else {
                        showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return _getAlertWarning('Неверные данные',
                                  'Введены неверные данные (пустые поля или неверный формат) или введенные пароли не совпадают', context);
                            });
                      }
                    },
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 22),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Есть аккаунт?',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: Text(
                          'Авторизоваться',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

AlertDialog _getAlertReg(String description, BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.blueGrey,
    title: Text(
      'Успех!',
      style: TextStyle(
        fontFamily: 'Rubik',
        color: Colors.white,
      ),
    ),
    content: Text(
      description,
      style: TextStyle(
        fontFamily: 'Rubik',
        color: Colors.white,
      ),
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: Text(
          'Ок',
          style: TextStyle(
            fontFamily: 'Rubik',
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'Закрыть',
          style: TextStyle(
            fontFamily: 'Rubik',
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
        ),
      ),
    ],
  );
}

AlertDialog _getAlertWarning(String text, String description, BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.blueGrey,
    title: Text(
      text,
      style: TextStyle(
        fontFamily: 'Rubik',
        color: Colors.white,
      ),
    ),
    content: Text(
      description,
      style: TextStyle(
        fontFamily: 'Rubik',
        color: Colors.white,
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
            fontFamily: 'Rubik',
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
        ),
      ),
    ],
  );
}
