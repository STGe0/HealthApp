import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_steshkin/services/variables.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  bool animate_button = false;

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Color.fromARGB(255, 27, 35, 36),
            body: SafeArea(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1600),
                    top: animate ? 14.h : 14.h,
                    left: animate ? 5.h : 5.h,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1600),
                      opacity: animate ? 1 : 0,
                      child: Text(
                        'Добро пожаловать!',
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1600),
                    top: animate ? 15.h : 15.h,
                    left: animate ? 12.h : 12.h,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1600),
                      opacity: animate ? 1 : 0,
                      child: SizedBox(
                        width: 60.w,
                        height: 60.h,
                        child: Image(
                          image: AssetImage('assets/image/logo.png'),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1600),
                    top: animate ? 70.h : 70.h,
                    left: animate ? 16.h : 16.h,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1600),
                      opacity: animate ? 1 : 0,
                      child: Text(
                        'HealthApp',
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1600),
                    bottom: animate_button ? 5.h : -10.h,
                    left: animate_button ? 8.h : 8.h,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1600),
                      opacity: animate ? 1 : 0,
                      child: ElevatedButton(
                        onPressed: (){
                          navigator.pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                        },
                        child: Text('Войти',
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontStyle: FontStyle.italic),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          side: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          minimumSize: Size(33.w, 50),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1600),
                    bottom: animate_button ? 5.h : -10.h,
                    right: animate_button ? 8.h : 8.h,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1600),
                      opacity: animate ? 1 : 0,
                      child: ElevatedButton(
                        onPressed: (){
                          navigator.pushNamedAndRemoveUntil('/reg', (Route<dynamic> route) => false);
                        },
                        child: Text('Создать',
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontStyle: FontStyle.italic),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          side: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          minimumSize: Size(33.w, 50),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }

    );
  }

  Future startAnimation() async {
    await Future<void>.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future<void>.delayed(Duration(milliseconds: 2000));
    setState(() {
      animate_button = true;
    });
  }

}