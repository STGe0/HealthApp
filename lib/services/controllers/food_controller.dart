import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_steshkin/models/cal_b_model.dart';
import 'package:health_steshkin/models/cal_o_model.dart';
import 'package:health_steshkin/models/cal_p_model.dart';
import 'package:health_steshkin/models/cal_u_model.dart';
import 'package:health_steshkin/models/f_model.dart';
import 'package:health_steshkin/models/food_model.dart';
import 'package:health_steshkin/models/pfc_value_model.dart';
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

  Future<FoodModel> getFoodRecordData(){
    final email = _authRepo.firebaseUser.value?.email;
    return _fRepo.getFoodDetails(getFDetails(email!).toString());
  }

  Future<List<FoodModel>> getAllFoodRecords(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.allFoodRecords(id);
  }

  Future<List<FoodModel>> getAllFoodRecordsO(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.allFoodRecordsO(id);
  }

  Future<List<FoodModel>> getAllFoodRecordsU(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.allFoodRecordsU(id);
  }

  Future<List<FoodModel>> getAllFoodRecordsP(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.allFoodRecordsP(id);
  }

  Future<void> deleteFoodB(String id, String id_f) async{
    await _fRepo.deleteFoodB(id, id_f);
  }

  Future<void> deleteFoodO(String id, String id_f) async{
    await _fRepo.deleteFoodO(id, id_f);
  }

  Future<void> deleteFoodU(String id, String id_f) async{
    await _fRepo.deleteFoodU(id, id_f);
  }

  Future<void> deleteFoodP(String id, String id_f) async{
    await _fRepo.deleteFoodP(id, id_f);
  }

  Future<CalModelB> getAllCalRecordsB(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.getFoodCalB(id);
  }

  Future<void> updateCalB(CalModelB calM, String id_f, String id_b) async{
    await _fRepo.updateCalB(calM, id_f, id_b);
  }

  Future<void> deleteCalB(String id_f, String id_b) async{
    await _fRepo.deleteCalB(id_f, id_b);
  }

  Future<ModelPFC> getAllRecordsPFC(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.getFoodPFC(id);
  }

  Future<void> updatePFC(ModelPFC modelPFC, String id_f, String id_pfc) async{
    await _fRepo.updatePFC(modelPFC, id_f, id_pfc);
  }

  Future<CalModelO> getAllCalRecordsO(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.getFoodCalO(id);
  }

  Future<void> updateCalO(CalModelO calM, String id_f, String id_b) async{
    await _fRepo.updateCalO(calM, id_f, id_b);
  }

  Future<void> deleteCalO(String id_f, String id_b) async{
    await _fRepo.deleteCalO(id_f, id_b);
  }

  Future<CalModelU> getAllCalRecordsU(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.getFoodCalU(id);
  }

  Future<void> updateCalU(CalModelU calU, String id_f, String id_b) async{
    await _fRepo.updateCalU(calU, id_f, id_b);
  }

  Future<void> deleteCalU(String id_f, String id_b) async{
    await _fRepo.deleteCalU(id_f, id_b);
  }

  Future<CalModelP> getAllCalRecordsP(String id) async{
    final email = _authRepo.firebaseUser.value?.email;

    return await _fRepo.getFoodCalP(id);
  }

  Future<void> updateCalP(CalModelP calP, String id_f, String id_b) async{
    await _fRepo.updateCalP(calP, id_f, id_b);
  }

  Future<void> deleteCalP(String id_f, String id_b) async{
    await _fRepo.deleteCalP(id_f, id_b);
  }
}