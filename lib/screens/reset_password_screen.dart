import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget{
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>{
  TextEditingController emailTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    emailTextInputController.dispose();

    super.dispose();
  }
  Future<void> resetPassword() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailTextInputController.text.trim());

      showDialog<void>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: Text(
                'Пароль сброшен',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                ),
              ),
              content: Text(
                'Пароль сброшен, проверьте почту',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    navigator.pushNamedAndRemoveUntil('/start', (Route<dynamic> route) => false);
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
              ],
            );
          });
    } on FirebaseAuthException catch (e){

      if(e.code == 'user-not-found'){
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return _getAlertWarning(
                  'Пользователь не найден',
                  'Пользователь с данной электронной почтой не найден',
                  context);
            });
      } else {
        if(e.code == 'unknown' || e.code == 'invalid-email'){
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return _getAlertWarning(
                  'Неверный формат',
                  'Неверный формат или поле email не заполнено',
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
                    'Сброс пароля',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                        fontSize: 24,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
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
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: resetPassword,
                    child: Text('Сбросить пароль',
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 22),
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
                  TextButton(
                    onPressed: () => navigator.pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false),
                    child: Text(
                      'Назад',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.amber,
                      ),
                    ),
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
