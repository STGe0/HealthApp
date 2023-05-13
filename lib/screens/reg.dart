import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_steshkin/screens/variables.dart';
import 'package:health_steshkin/screens/auth.dart';

class RegRoute extends StatelessWidget{
  const RegRoute({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: RegScreen(),
    );
  }
}

class RegScreen extends StatefulWidget {
  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
                child:
                Column(
                  children: [
                    Text(
                      'Регистрация',
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
                    Image.asset(
                      "assets/image/123.png",
                      width: 160,
                      height: 120,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _getElements(),
                    _getButton(context),
                    _getReg(context),
                  ],
            ),
          ),
        ),
      ),
    );
  }
}

void _onChangedEmail(String text) {
  globalVar.email_reg = text;
}

void _onChangedPas(String text) {
  globalVar.pas_reg = text;
}

Column _getElements() {
  return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
            keyboardAppearance: Brightness.dark,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
            ),
            textInputAction: TextInputAction.next,
            onChanged: _onChangedEmail,
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
          TextField(
            keyboardAppearance: Brightness.dark,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
            ),
            textInputAction: TextInputAction.done,
            onChanged: _onChangedPas,
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
                suffixIconColor: Colors.white,
                suffixIcon: Icon(Icons.password),
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
            obscureText: true,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      );
}

ElevatedButton _getButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () async {
      try {
        final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: globalVar.email_reg,
          password: globalVar.pas_reg,
        );
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return _getAlertReg('Регистрация прошла успешно', context);
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return _getAlertWarning(
                    'Слабый пароль','Слабый пароль, постарайтесь придумать другой', context);
              });
        } else if (e.code == 'email-already-in-use') {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return _getAlertWarning(
                    'Почта уже используется', 'Пользователь уже зарегистрирован в системе', context);
              });
        } else if (e.code == 'invalid-email' || e.code == 'internal-error' || e.code == 'unknown') {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return _getAlertWarning(
                    'Неверный формат', 'Неверный формат или поля email/пароль не заполнены', context);
              });
        }
      } catch (e) {
        print(e);
      }
    },
    child: Text(
      'Зарегистрироваться',
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
  );
}

Row _getReg(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Есть аккаунт?',
        style: TextStyle(
          fontFamily: 'Rubik',
          color: Colors.white,
        ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(builder: (context) => const AuthRoute()),
            );
          },
          child: Text('Авторизоваться',
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.blueAccent,
            ),
          ),
        ),
      ],
  );
}

AlertDialog _getAlertReg(String description, BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.blueGrey,
    title: Text('Успех!',
      style: TextStyle(
        fontFamily: 'Rubik',
        color: Colors.white,
      ),
    ),
    content: Text(description,
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
            MaterialPageRoute(builder: (context) => const AuthRoute()),
          );
        },
        child: Text('Ок',
          style: TextStyle(
            fontFamily: 'Rubik',
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Закрыть',
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

AlertDialog _getAlertWarning(String text, String description, BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.blueGrey,
    title: Text(text,
      style: TextStyle(
        fontFamily: 'Rubik',
        color: Colors.white,
      ),
    ),
    content: Text(description,
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
        child: Text('Ок',
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