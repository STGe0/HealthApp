import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_steshkin/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  //Контроллеры для работы с тектовыми полями
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
}