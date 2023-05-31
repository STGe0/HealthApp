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
}