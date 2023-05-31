import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_steshkin/models/f_model.dart';
import 'package:health_steshkin/repository/auth_rep.dart';
import 'package:health_steshkin/repository/user_repository/f_rep.dart';

class FController extends GetxController{
  static FController get instance => Get.find();

  final _authRepo = Get.put(AuthRep());
  final _fRepo = Get.put(FRep());

  Future<FModel> getFRecordData(){
    final email = _authRepo.firebaseUser.value?.email;
    return _fRepo.getFDetails(email!);
  }

  Future<List<FModel>> getAllFRecords() async{
    final email = _authRepo.firebaseUser.value?.email;
    return await _fRepo.allFRecords(email!);
  }

  Future<void> deleteF(FModel fM) async{
    await _fRepo.deleteFRecord(fM);
  }
}