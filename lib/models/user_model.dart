import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? id;
  final dynamic fullName;
  final dynamic email;
  final dynamic height_user;
  final dynamic weight_user_now;
  final dynamic imt;
  final dynamic calorie;

  UserModel({
   this.id,
   required this.fullName,
    required this.email,
    required this.height_user,
    required this.weight_user_now,
    required this.imt,
    required this.calorie,
});

  Map<String, dynamic> toJson() => <String, dynamic>{
    "FullName": fullName,
    "Email": email,
    "Height_user": height_user,
    "Weight_user_now": weight_user_now,
    "imt": imt,
    "calorie": calorie,
  };

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["FullName"],
        email: data["Email"],
        height_user: data["Height_user"],
        weight_user_now: data["Weight_user_now"],
      imt: data["imt"],
      calorie: data["calorie"],
    );
  }
}