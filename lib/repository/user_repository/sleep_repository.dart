import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_steshkin/models/sleep_records_model.dart';

class SleepRepository extends GetxController{
  static SleepRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createSleepRecord(SleepModel sleep) async {
    await _db.collection("sleep").add(sleep.toJsonSleep());
  }

  Future<SleepModel> getSleepDetails(String email) async{
    final snapshotSleepRecords = await _db.collection("sleep").where("Email_user", isEqualTo: email).get();

    final sleepData = snapshotSleepRecords.docs.map((e) => SleepModel.fromSnapshot(e)).single;
    return sleepData;
  }

  Future<void> updateSleepRecord(SleepModel sleep, String id) async{
    await _db.collection("sleep").doc(id).update(sleep.toJsonSleep());
  }

  Future<void> deleteSleepRecord(SleepModel sleep) async{
    await _db.collection("sleep").doc(sleep.id).delete();
  }
  
  Future<List<SleepModel>> allSleepRecords(String email) async{
    final snapshot = await _db.collection("sleep")
        .where("Email_user", isEqualTo: email)
        .get();
    final sleepRecords = snapshot.docs.map((e) => SleepModel.fromSnapshot(e)).toList();

    return sleepRecords;
  }

  Future<List<SleepModel>> allSleepRecordsS(String email, String date) async{
    final snapshot = await _db.collection("sleep")
        .where("Email_user", isEqualTo: email).where("Date_record", isEqualTo: date)
        .get();
    final sleepRecords = snapshot.docs.map((e) => SleepModel.fromSnapshot(e)).toList();

    return sleepRecords;
  }
}