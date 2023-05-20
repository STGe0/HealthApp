import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class AuthRep extends GetxController{
 static  AuthRep get instance => Get.find();

 final _auth = FirebaseAuth.instance;
 late final Rx<User?> firebaseUser;

 @override
  void onReady() {
   firebaseUser = Rx<User?>(_auth.currentUser);
   firebaseUser.bindStream(_auth.userChanges());
 }
}