import 'package:cloud_firestore/cloud_firestore.dart';

class FModel{
  String? id;
  final dynamic email;
  final dynamic date_record;

  FModel({
    this.id,
    required this.email,
    required this.date_record,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "email": email,
    "date_record": date_record,
  };

  factory FModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return FModel(
      id: document.id,
      email: data["email"],
      date_record: data["date_record"],
    );
  }
}