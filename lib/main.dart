import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_steshkin/screens/email_verified_screen.dart';
import 'package:health_steshkin/screens/welcome_page.dart';
import 'firebase_options.dart';
import 'package:health_steshkin/screens/reg_screen.dart';
import 'package:health_steshkin/screens/auth_screen.dart';
import 'package:health_steshkin/services/firebase_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => LoginScreen(),
        '/reg': (context) => RegScreen(),
        '/verified': (context) => VerifyEmailScreen(),
      },
      initialRoute: '/start',
    );
  }
}