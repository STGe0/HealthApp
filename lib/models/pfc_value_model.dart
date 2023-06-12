import 'package:cloud_firestore/cloud_firestore.dart';

class ModelPFC{
  String? id;
  final dynamic protein_value;
  final dynamic fats_value;
  final dynamic carb_value;
  final dynamic calories_value;

  ModelPFC({
    this.id,
    required this.protein_value,
    required this.fats_value,
    required this.carb_value,
    required this.calories_value,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
    "protein_value": protein_value,
    "fats_value": fats_value,
    "carb_value": carb_value,
    "calories_value": calories_value,
  };

  factory ModelPFC.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return ModelPFC(
      id: document.id,
      protein_value: data["protein_value"],
      fats_value: data["fats_value"],
      carb_value: data["carb_value"],
      calories_value: data["calories_value"],
    );
  }
}