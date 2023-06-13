import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_steshkin/models/sleep_records_model.dart';
import 'package:health_steshkin/repository/auth_rep.dart';
import 'package:health_steshkin/repository/user_repository/sleep_repository.dart';
import 'package:health_steshkin/services/variables.dart';

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

  Future<List<SleepModel>> getAllSleepRecordsS() async{
    final email = _authRepo.firebaseUser.value?.email;

    String _dateFormatter(DateTime tm){
      DateTime today = new DateTime.now();
      Duration oneDay = new Duration(days: 1);
      Duration twoDay = new Duration(days: 2);
      late String month;

      switch(tm.month){
        case 1:
          month = 'Января';
          break;
        case 2:
          month = 'Ферваля';
          break;
        case 3:
          month = 'Марта';
          break;
        case 4:
          month = 'Апреля';
          break;
        case 5:
          month = 'Мая';
          break;
        case 6:
          month = 'Июня';
          break;
        case 7:
          month = 'Июля';
          break;
        case 8:
          month = 'Августа';
          break;
        case 9:
          month = 'Сентября';
          break;
        case 10:
          month = 'Октября';
          break;
        case 11:
          month = 'Ноября';
          break;
        case 12:
          month = 'Декабря';
          break;
      }
      Duration difference = today.difference(tm);

      return "${tm.day} $month ${tm.year}";
    }

    return await _sleepRepo.allSleepRecordsS(email!, _dateFormatter(foodPageCal.valueS));
  }

  Future<void> deleteSleep(SleepModel sleep) async{
    await _sleepRepo.deleteSleepRecord(sleep);
  }
}