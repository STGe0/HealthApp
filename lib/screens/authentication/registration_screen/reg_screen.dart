import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:health_steshkin/screens/authentication/authorization_screen/auth_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/services/controllers/controllers.dart';
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
                    //Вызов пустого "setState" для обновления валидации при изменении текстового поля
                    onChanged: (_) => setState(() {
                    }),
                    decoration: InputDecoration(
                      errorText: _errorText(controller.fullNameController.text.trim()),
                      errorStyle: TextStyle(
                        color: Colors.red.shade400,
                        fontFamily: 'Rubik',
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
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
                    ),
                    enabled: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Текстовое поле (email)
                  TextFormField(
                    onChanged: (_) => setState(() {}),
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
                      errorText: _errorEmail(controller.emailController.text.trim()),
                      errorStyle: TextStyle(
                        color: Colors.red.shade400,
                        fontFamily: 'Rubik',
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
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
                    ),
                    enabled: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Числовое поле (Рост)
                  TextFormField(
                    onChanged: (_) => setState(() {}),
                    maxLength: 3,
                    controller: controller.heightController,
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorText: _errorHeight(controller.heightController.text.trim()),
                        errorStyle: TextStyle(
                          color: Colors.red.shade400,
                          fontFamily: 'Rubik',
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
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
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Числовое поле (Вес)
                  TextFormField(
                    onChanged: (_) => setState(() {}),
                    maxLength: 3,
                    controller: controller.weightController,
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorText: _errorWeight(controller.weightController.text.trim()),
                        errorStyle: TextStyle(
                          color: Colors.red.shade400,
                          fontFamily: 'Rubik',
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(50),
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
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Текстовое поле (Пароль)
                  TextFormField(
                    onChanged: (_) => setState(() {}),
                    controller: controller.passwordController,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorText: _errorPass(controller.passwordController.text.trim()),
                        errorStyle: TextStyle(
                          color: Colors.red.shade400,
                          fontFamily: 'Rubik',
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),                        prefixIcon: Icon(LineAwesomeIcons.fingerprint),
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
                    ),
                    obscureText: passwordHidden,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Текстовое поле (Пароль (повтор))
                  TextFormField(
                    onChanged: (_) => setState(() {}),
                    controller: controller.passwordRepeatController,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        errorText: _errorPassRep(controller.passwordController.text.trim(), controller.passwordRepeatController.text.trim()),
                        errorStyle: TextStyle(
                          color: Colors.red.shade400,
                          fontFamily: 'Rubik',
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
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
                    ),
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
                          && !controller.weightController.text.trim().isEmpty && controller.weightController.text.trim().length >= 2
                          && controller.heightController.text.trim().length >= 3 && controller.fullNameController.text.trim().length >= 4) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: controller.emailController.text.trim(),
                            password: controller.passwordController.text.trim(),
                          );
                          navigator.pushNamedAndRemoveUntil(
                              '/start', (Route<dynamic> route) => false);
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

//Функции проверки текстовых полей (валидации полей)
String? _errorText(String text) {
  if(text.isEmpty){
    return 'Введите Ваш логин';
  } else{
    if(text.length < 4){
      return 'Минимум 4 символа';
    }
  } return null;
}

String? _errorEmail(String text) {
  final bool isEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
  if(text.isEmpty){
    return 'Введите адрес электронной почты';
  } else{
    if(!isEmail){
      return 'Введите верный формат адреса';
    }
  } return null;
}

String? _errorWeight(String text) {
  if(text.isEmpty || text.length < 2){
    return 'Введите Ваш вес (кг)';
  } return null;
}

String? _errorHeight(String text) {
  if(text.isEmpty || text.length < 3){
    return 'Введите Ваш рост (см)';
  } return null;
}

String? _errorPass(String text) {
  if(text.isEmpty){
    return 'Введите пароль';
  } else{
    if(text.length < 6){
      return 'Минимум 6 символов';
    }
  } return null;
}

String? _errorPassRep(String pass1, String pass2) {
  if(pass2.isEmpty){
    return 'Повторите пароль';
  } else{
    if(pass2.length < 6){
      return 'Минимум 6 символов';
    } else{
      if(pass1 != pass2){
        return 'Пароли не совпадают';
      }
    }
  } return null;
}

//Функция вывода на экран диалог. окна
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
