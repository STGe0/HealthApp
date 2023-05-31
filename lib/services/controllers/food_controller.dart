import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_steshkin/models/f_model.dart';
import 'package:health_steshkin/models/food_model.dart';
import 'package:health_steshkin/repository/auth_rep.dart';
import 'package:health_steshkin/repository/food_repo.dart';

class FoodController extends GetxController{
  static FoodController get instance => Get.find();

  final _authRepo = Get.put(AuthRep());
  final _fRepo = Get.put(FoodRepository());

  Future<String> getFDetails(String email) async{
    final snapshotFRecords = await FirebaseFirestore.instance.collection("food").where("email", isEqualTo: email).get();

    final FData = snapshotFRecords.docs.map((e) => FModel.fromSnapshot(e)).single;
    String FoodData = FData.id.toString();
    return FoodData;
  }

  Future<FoodModel> getFRecordData(){
    final email = _authRepo.firebaseUser.value?.email;
    return _fRepo.getFoodDetails(getFDetails(email!).toString());
  }
}