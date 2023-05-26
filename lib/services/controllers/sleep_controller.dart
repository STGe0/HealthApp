import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_steshkin/models/sleep_records_model.dart';
import 'package:health_steshkin/repository/auth_rep.dart';
import 'package:health_steshkin/repository/user_repository/sleep_repository.dart';

class SleepController extends GetxController{
  static SleepController get instance => Get.find();

  final _authRepo = Get.put(AuthRep());
  final _sleepRepo = Get.put(SleepRepository());

  Future<SleepModel> getSleepRecordData(){
    final email = _authRepo.firebaseUser.value?.email;
    return _sleepRepo.getSleepDetails(email!);
  }

  Future<List<SleepModel>> getAllSleepRecords() async{
    final email = _authRepo.firebaseUser.value?.email;
    return await _sleepRepo.allSleepRecords(email!);
  }

  Future<void> deleteSleep(SleepModel sleep) async{
    await _sleepRepo.deleteSleepRecord(sleep);
  }
}