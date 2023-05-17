import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  bool passwordHidden = true; //Состояние видимости пароля в текстовом поле

  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();

  final formKey = GlobalKey<FormState>(); //Глобальный ключ

  //Уничтожение контроллеров при уничтожении страницы и "State"
  @override
  void dispose(){
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  //Функция переключения видимости пароля
  void togglePasswordView(){
    setState((){
      passwordHidden = !passwordHidden;
    });
  }

  Future<void> login() async{
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextInputController.text.trim(),
          password: passwordTextInputController.text.trim(),
      );
      navigator.pushNamedAndRemoveUntil('/start', (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return _getAlertWarning(
                  'Пользователь не найден',
                  'Пользователь с такими данными не обнаружен',
                  context);
            });
      } else if (e.code == 'wrong-password') {
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return _getAlertWarning(
                  'Неверный пароль',
                  'Неправильный пароль',
                  context);
            });
      } else {
        if(e.code == 'unknown' || e.code == 'invalid-email'){
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return _getAlertWarning(
                    'Поля не заполнены',
                    'Поля не заполнены или неправильный формат введенных данных',
                    context);
              });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context){
    final navigator = Navigator.of(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 27, 35, 36),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Center(
              child: SafeArea(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: [
                      Text(
                        'Авторизация',
                        style:
                        TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.white,
                            fontSize: 37,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            controller: emailTextInputController,
                            validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? null
                                : null,
                            keyboardAppearance: Brightness.dark,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIconColor: Colors.white,
                              suffixIcon: Icon(Icons.email),
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
                          TextFormField(
                            autocorrect: false,
                            controller: passwordTextInputController,
                            obscureText: passwordHidden,
                            validator: (value) => value != null && value.length < 6
                                ? null
                                : null,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardAppearance: Brightness.dark,
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors.green,
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
                                helperText:
                                'Обязательно 6 символов'),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(onPressed: login,
                            child: Text('Войти',
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 22),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              side: BorderSide(
                                color: Color.fromARGB(255, 121, 110, 101),
                                width: 2,
                              ),
                              minimumSize: Size(150, 50),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextButton(onPressed: () => navigator.pushNamedAndRemoveUntil('/reg', (Route<dynamic> route) => false),
                              child: Text(
                                'Регистрация',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Colors.blueAccent,
                                ),
                              ),),
                          TextButton(onPressed: (){},
                            child: Text(
                              'Сбросить пароль',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                color: Colors.blueAccent,
                              ),
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
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
          backgroundColor: Colors.green,
        ),
      ),
    ],
  );
}