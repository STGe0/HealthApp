import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/repository/auth_rep.dart';
import 'package:health_steshkin/screens/authentication/registration_screen/email_verified_screen.dart';
import 'package:health_steshkin/screens/authentication/authorization_screen/reset_password_screen.dart';
import 'firebase_options.dart';
import 'package:health_steshkin/screens/authentication/registration_screen/reg_screen.dart';
import 'package:health_steshkin/screens/authentication/authorization_screen/auth_screen.dart';
import 'package:health_steshkin/services/navigation/firebase_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthRep()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/start': (context) => FirebaseUser(),
        '/login': (context) => LoginScreen(),
        '/reg': (context) => RegScreen(),
        '/verified': (context) => VerifyEmailScreen(),
        '/reset_password': (context) => ResetPasswordScreen(),
      },
      initialRoute: '/start',
    );
  }
}