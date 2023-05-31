import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_steshkin/models/f_model.dart';

class FRep extends GetxController{
  static FRep get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createFRecord(FModel fM) async {
    await _db.collection("food").add(fM.toJson());
  }

  Future<FModel> getFDetails(String email) async{
    final snapshotFRecords = await _db.collection("food").where("email", isEqualTo: email).get();

    final FData = snapshotFRecords.docs.map((e) => FModel.fromSnapshot(e)).single;
    return FData;
  }

  Future<void> updateFRecord(FModel fM) async{
    await _db.collection("food").doc(fM.id).update(fM.toJson());
  }

  Future<void> deleteFRecord(FModel fM) async{
    await _db.collection("food").doc(fM.id).delete();
  }

  Future<List<FModel>> allFRecords(String email) async{
    final snapshot = await _db.collection("food")
        .where("email", isEqualTo: email).
    where("date_record", isEqualTo: '31 Мая 2023')
        .get();
    final fRecords = snapshot.docs.map((e) => FModel.fromSnapshot(e)).toList();

    return fRecords;
  }
}