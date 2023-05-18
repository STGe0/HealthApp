import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_steshkin/screens/auth_screen.dart';

class RegScreen extends StatefulWidget {
  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State {
  bool passwordHidden = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextInputControllerRepeat =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextInputControllerRepeat.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      body: Center(
        child: Form(
          key: formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
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
                  TextFormField(
                    controller: emailTextInputController,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
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
                    controller: passwordTextInputController,
                    keyboardAppearance: Brightness.dark,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
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
                  TextFormField(
                    controller: passwordTextInputControllerRepeat,
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
                      if (passwordTextInputController.text ==
                          passwordTextInputControllerRepeat.text) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailTextInputController.text.trim(),
                            password: passwordTextInputController.text.trim(),
                          );
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
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return _getAlertWarning('Пароли не совпадают',
                                  'Пароли не совпадают', context);
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
