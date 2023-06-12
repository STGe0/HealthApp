import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_steshkin/models/cal_b_model.dart';
import 'package:health_steshkin/models/cal_o_model.dart';
import 'package:health_steshkin/models/cal_p_model.dart';
import 'package:health_steshkin/models/cal_u_model.dart';
import 'package:health_steshkin/models/food_model.dart';
import 'package:health_steshkin/models/pfc_value_model.dart';

class FoodRepository extends GetxController{
  static FoodRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createFoodRecord(FoodModel foodModel, String id) async {
    await _db.collection("food").doc(id).collection("breakfast").add(foodModel.toJson());
  }

  Future<FoodModel> getFoodDetails(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("breakfast").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => FoodModel.fromSnapshot(e)).single;
    return FoodData;
  }

  Future<List<FoodModel>> allFoodRecords(String id) async{
    final snapshotFRecords = await _db.collection("food").where("email", isEqualTo: 'gogogogy95@yandex.ru').get();
    final snapshot = await _db.collection("food").doc(id).collection("breakfast").get();
    final foodRecords = snapshot.docs.map((e) => FoodModel.fromSnapshot(e)).toList();

    return foodRecords;
  }
  Future<void> createFoodRecordO(FoodModel foodModel, String id) async {
    await _db.collection("food").doc(id).collection("ob").add(foodModel.toJson());
  }

  Future<FoodModel> getFoodDetailsO(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("ob").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => FoodModel.fromSnapshot(e)).single;
    return FoodData;
  }

  Future<List<FoodModel>> allFoodRecordsO(String id) async{
    final snapshot = await _db.collection("food").doc(id).collection("ob").get();
    final foodRecords = snapshot.docs.map((e) => FoodModel.fromSnapshot(e)).toList();

    return foodRecords;
  }

  Future<void> createFoodRecordU(FoodModel foodModel, String id) async {
    await _db.collection("food").doc(id).collection("u").add(foodModel.toJson());
  }

  Future<FoodModel> getFoodDetailsU(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("u").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => FoodModel.fromSnapshot(e)).single;
    return FoodData;
  }

  Future<List<FoodModel>> allFoodRecordsU(String id) async{
    final snapshot = await _db.collection("food").doc(id).collection("u").get();
    final foodRecords = snapshot.docs.map((e) => FoodModel.fromSnapshot(e)).toList();

    return foodRecords;
  }
  Future<void> createFoodRecordP(FoodModel foodModel, String id) async {
    await _db.collection("food").doc(id).collection("p").add(foodModel.toJson());
  }

  Future<FoodModel> getFoodDetailsP(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("p").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => FoodModel.fromSnapshot(e)).single;
    return FoodData;
  }

  Future<List<FoodModel>> allFoodRecordsP(String id) async{
    final snapshot = await _db.collection("food").doc(id).collection("p").get();
    final foodRecords = snapshot.docs.map((e) => FoodModel.fromSnapshot(e)).toList();

    return foodRecords;
  }

  Future<void> deleteFoodB(String id, String id_f) async{
    await _db.collection("food").doc(id_f).collection("breakfast").doc(id).delete();
  }

  Future<void> deleteFoodO(String id, String id_f) async{
    await _db.collection("food").doc(id_f).collection("ob").doc(id).delete();
  }

  Future<void> deleteFoodU(String id, String id_f) async{
    await _db.collection("food").doc(id_f).collection("u").doc(id).delete();
  }

  Future<void> deleteFoodP(String id, String id_f) async{
    await _db.collection("food").doc(id_f).collection("p").doc(id).delete();
  }

  Future<CalModelB> getFoodCalB(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("cal_b").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => CalModelB.fromSnapshot(e)).single;
    return FoodData;
  }

  Future<void> createFoodCalB(CalModelB calModelB, String id) async {
    await _db.collection("food").doc(id).collection("cal_b").add(calModelB.toJson());
  }

  Future<void> updateCalB(CalModelB calB, String id_f, String id_b) async{
    await _db.collection("food").doc(id_f).collection("cal_b").doc(id_b).update(calB.toJson());
  }

  Future<void> deleteCalB(String id_f, String id_b) async{
    await _db.collection("food").doc(id_f).collection("cal_b").doc(id_b).delete();
  }

  Future<ModelPFC> getFoodPFC(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("pfc_value").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => ModelPFC.fromSnapshot(e)).single;
    return FoodData;
  }

  Future<void> createFoodPFC(ModelPFC modelPFC, String id) async {
    await _db.collection("food").doc(id).collection("pfc_value").add(modelPFC.toJson());
  }

  Future<void> updatePFC(ModelPFC modelPFC, String id_f, String id_pfc) async{
    await _db.collection("food").doc(id_f).collection("pfc_value").doc(id_pfc).update(modelPFC.toJson());
  }

  Future<void> deletePFC(String id_f, String id_pfc) async{
    await _db.collection("food").doc(id_f).collection("pfc_value").doc(id_pfc).delete();
  }

  Future<void> createFoodCalO(CalModelO calModelO, String id) async {
    await _db.collection("food").doc(id).collection("cal_o").add(calModelO.toJson());
  }

  Future<void> updateCalO(CalModelO calB, String id_f, String id_b) async{
    await _db.collection("food").doc(id_f).collection("cal_o").doc(id_b).update(calB.toJson());
  }

  Future<void> deleteCalO(String id_f, String id_b) async{
    await _db.collection("food").doc(id_f).collection("cal_o").doc(id_b).delete();
  }

  Future<CalModelO> getFoodCalO(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("cal_o").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => CalModelO.fromSnapshot(e)).single;
    return FoodData;
  }

  Future<void> createFoodCalU(CalModelU calModelU, String id) async {
    await _db.collection("food").doc(id).collection("cal_u").add(calModelU.toJson());
  }

  Future<void> updateCalU(CalModelU calU, String id_f, String id_b) async{
    await _db.collection("food").doc(id_f).collection("cal_u").doc(id_b).update(calU.toJson());
  }

  Future<void> deleteCalU(String id_f, String id_b) async{
    await _db.collection("food").doc(id_f).collection("cal_u").doc(id_b).delete();
  }

  Future<CalModelU> getFoodCalU(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("cal_u").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => CalModelU.fromSnapshot(e)).single;
    return FoodData;
  }

  Future<void> createFoodCalP(CalModelP calModelP, String id) async {
    await _db.collection("food").doc(id).collection("cal_p").add(calModelP.toJson());
  }

  Future<void> updateCalP(CalModelP calP, String id_f, String id_b) async{
    await _db.collection("food").doc(id_f).collection("cal_p").doc(id_b).update(calP.toJson());
  }

  Future<void> deleteCalP(String id_f, String id_b) async{
    await _db.collection("food").doc(id_f).collection("cal_p").doc(id_b).delete();
  }

  Future<CalModelP> getFoodCalP(String id) async{
    final snapshotFoodRecords = await _db.collection("food").doc(id).collection("cal_p").get();

    final FoodData = snapshotFoodRecords.docs.map((e) => CalModelP.fromSnapshot(e)).single;
    return FoodData;
  }
}