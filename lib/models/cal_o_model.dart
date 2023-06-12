import 'package:cloud_firestore/cloud_firestore.dart';

class CalModelO{
  String? id;
  final dynamic cal_o;

  CalModelO({
    this.id,
    required this.cal_o,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "cal_o": cal_o,
  };

  factory CalModelO.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return CalModelO(
      id: document.id,
      cal_o: data["cal_o"],
    );
  }
}