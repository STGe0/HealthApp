import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:health_steshkin/repository/user_repository/user_repository.dart';
import 'package:health_steshkin/screens/main_screens/main_screen.dart';
import 'package:health_steshkin/services/controllers/controllers.dart';

class VerifyEmailScreen extends StatefulWidget{
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen>{
  bool isEmailVerified = false; //Переменная в которой хранится информация о подтверждении email (да/нет)
  bool canResendEmail = false;
  Timer? timer;

  final controller = Get.put(SignUpController());


  @override
  void initState(){
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified){
      sendVerificationEmail();

      timer = Timer.periodic(const Duration(seconds: 3),
              (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified)
      {
        final userM = UserModel(
          fullName: controller.fullNameController.text.trim(),
          email: controller.emailController.text.trim(),
          height_user: controller.heightController.text.trim(),
          weight_user_now: controller.weightController.text.trim(),
          imt: (int.parse(controller.weightController.text) / (int.parse(controller.heightController.text) * int.parse(controller.heightController.text) / 10000)).toStringAsFixed(1),
          calorie: (int.parse(controller.weightController.text) * 20.6).toStringAsFixed(0),
        );

        final userRepo = Get.put(UserRepository());
        userRepo.createUser(userM);

        timer?.cancel();
      }
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      print(user);

      setState(() {
        canResendEmail = false;
      });
      await Future<void>.delayed(const Duration(seconds: 5));

      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      print(e);
      if (mounted) {
        print('Ошибка!');
      }
    }
  }

  @override
    Widget build(BuildContext context) => isEmailVerified
        ? const MainScreen()
        : Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 35, 36),
      body: Center (
        child: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                'Подтвердите почту, перейдя по ссылке в письме',
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
              ElevatedButton(onPressed: canResendEmail ? sendVerificationEmail : null,
                child: Text('Отправить повторно',
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
              TextButton(onPressed: () async{
                timer?.cancel();
                await FirebaseAuth.instance.currentUser!.delete();
              },
                  child: Text('Отменить регистрацию',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16),
                  ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }