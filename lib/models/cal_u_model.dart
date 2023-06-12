import 'package:cloud_firestore/cloud_firestore.dart';

class CalModelU{
  String? id;
  final dynamic cal_u;

  CalModelU({
    this.id,
    required this.cal_u,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "cal_u": cal_u,
  };

  factory CalModelU.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return CalModelU(
      id: document.id,
      cal_u: data["cal_u"],
    );
  }
}