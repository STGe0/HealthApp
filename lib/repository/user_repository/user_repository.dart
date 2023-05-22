import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_steshkin/models/user_model.dart';

class UserRepository extends GetxController{
    static UserRepository get instance => Get.find();

    final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection("users").add(user.toJson());
  }

  Future<UserModel> getUserDetails(String email) async{
    final snapshot = await _db.collection("users").where("Email", isEqualTo: email).get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUserAccount(UserModel user) async{
    await _db.collection("users").doc(user.id).update(user.toJson());
  }

    Future<void> deleteUserAccount(UserModel user) async{
      await _db.collection("users").doc(user.id).delete();
    }
}