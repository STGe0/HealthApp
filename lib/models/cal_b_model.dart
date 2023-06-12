import 'package:cloud_firestore/cloud_firestore.dart';

class CalModelB{
  String? id;
  final dynamic cal_b;

  CalModelB({
    this.id,
    required this.cal_b,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "cal_b": cal_b,
  };

  factory CalModelB.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return CalModelB(
      id: document.id,
      cal_b: data["cal_b"],
    );
  }
}