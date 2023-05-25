import 'package:cloud_firestore/cloud_firestore.dart';

class SleepModel{
  String? id;
  final dynamic Email_user;
  final dynamic Date_record;
  final dynamic Duration;
  final dynamic Status;

  SleepModel({
    this.id,
    required this.Email_user,
    required this.Date_record,
    required this.Duration,
    required this.Status,
  });

  Map<String, dynamic> toJsonSleep() => <String, dynamic>{
    "Email_user": Email_user,
    "Date_record": Date_record,
    "Duration": Duration,
    "Status": Status,
  };

  factory SleepModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return SleepModel(
      id: document.id,
      Email_user: data["Email_user"],
      Date_record: data["Date_record"],
      Duration: data["Duration"],
      Status: data["Status"],
    );
  }
}