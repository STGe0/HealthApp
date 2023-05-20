import 'dart:ffi';

class UserModel{
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final int height_user;
  final Double weight_user_now;

  const UserModel({
   this.id,
   required this.fullName,
    required this.email,
    required this.password,
    required this.height_user,
    required this.weight_user_now,
});

  Map<String, Object> toJson(){
    return{
      "FullName": fullName,
      "Email": email,
      "Password": password,
      "Height_user": height_user,
      "Weight_user_now": weight_user_now,
    };
  }
}