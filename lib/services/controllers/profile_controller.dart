import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_steshkin/models/user_model.dart';
import 'package:health_steshkin/repository/auth_rep.dart';
import '../../repository/user_repository/user_repository.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthRep());
  final _userRepo = Get.put(UserRepository());

   Future<UserModel> getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    return _userRepo.getUserDetails(email!);
  }

  Future<void> updateAccount(UserModel user) async{
     await _userRepo.updateUserAccount(user);
  }

  Future<void> deleteAccount(UserModel user) async{
    await _userRepo.deleteUserAccount(user);
  }
}