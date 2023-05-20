import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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