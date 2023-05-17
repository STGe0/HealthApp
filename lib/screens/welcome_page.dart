import 'package:flutter/material.dart';
import 'package:health_steshkin/screens/reg_screen.dart';
import 'package:health_steshkin/screens/auth_screen.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/image/123.png",
                    width: 260,
                    height: 180,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                              );
                            },
                            child: Text('Есть аккаунт?',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              side: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              minimumSize: Size(150, 50),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute(builder: (context) => RegScreen()),
                              );
                            },
                            child: Text('Нет аккаунта?',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              side: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              minimumSize: Size(150, 50),
                            ),
                          ),
                        ],),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container _getHeader() {
  return Container(
    alignment: Alignment.center,
    child: Column(children: [
      SizedBox(
        height: 55,
      ),
      Text(
        'Добро пожаловать!',
        style:
        TextStyle(
            fontFamily: 'Rubik',
            color: Colors.white,
            fontSize: 37,
            fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 25,
      ),
      Text(
        'Трекер здоровья',
        style: TextStyle(
          fontFamily: 'Rubik',
          color: Colors.green,
          fontSize: 37,
        ),
        textAlign: TextAlign.center,
      ),
    ]),
  );
}

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    //Рисуем фон
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Color.fromARGB(255, 27, 35, 36);
    canvas.drawPath(mainBackground, paint);

    Path waveB = Path();
    waveB.lineTo(sw, 1);
    waveB.lineTo(sw, sh * 0.85);
    waveB.quadraticBezierTo(sw * 0.1, sh * 0.75, sw * 0.01, 0.9);
    waveB.close();
    paint.color = Color.fromARGB(255, 163, 195, 199);
    canvas.drawPath(waveB, paint);

    Path waveG = Path();
    waveG.lineTo(sw, 0);
    waveG.lineTo(sw, sh * 0.1);
    waveG.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    waveG.cubicTo(sw * 0.62, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    waveG.close();
    paint.color = Color.fromARGB(255, 163, 195, 199);
    canvas.drawPath(waveG, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}