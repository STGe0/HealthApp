import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_steshkin/models/user_model.dart';

import '../repository/user_repository/user_repository.dart';

class ProfileRepository extends GetxController{
  static ProfileRepository get instance => Get.find();

  final _userRepo = Get.put(UserRepository());

   Future<UserModel> getUserData(){
    final email = FirebaseAuth.instance.currentUser!.email;

    return _userRepo.getUserDetails(email!);
  }
}