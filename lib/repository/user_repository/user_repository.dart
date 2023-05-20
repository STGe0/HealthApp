import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserRepository extends GetxController{
    static UserRepository get instance => Get.find();

    final _db = FirebaseFirestore.instance;

    Future<void> createUser(UserModel user) async {
       await _db.collection("users").add(user.toJson());
    }
}