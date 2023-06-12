import 'package:cloud_firestore/cloud_firestore.dart';

class CalModelP{
  String? id;
  final dynamic cal_p;

  CalModelP({
    this.id,
    required this.cal_p,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "cal_p": cal_p,
  };

  factory CalModelP.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return CalModelP(
      id: document.id,
      cal_p: data["cal_p"],
    );
  }
}