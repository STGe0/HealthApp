import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_steshkin/models/food_model.dart';

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
}